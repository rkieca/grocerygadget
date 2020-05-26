using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TeamGG_CourseProject_Website_V1
{
    public partial class EditList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillGrid();
            }
        }

        public void fillGrid()
        {
            //retrieve user id
            string userid = Convert.ToString(Session["User_Id"]);
            string sql = "Select List_Id, User_List from [LIST] Where [User_Id] = " + userid + "";
            OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + Server.MapPath("Database21.accdb"));
            OleDbCommand cmd = new OleDbCommand(sql, conn);
            OleDbDataAdapter da = new OleDbDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            lblError.Text = "";
            string id = ((Label)GridView1.Rows[e.RowIndex].FindControl("Label2")).Text;
            OleDbTransaction myTransaction = null;

            //Delete User List from Shopping List first
            try
            {
                OleDbConnection conn1 = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + Server.MapPath("Database21.accdb"));
                conn1.Open();
                OleDbCommand command1 = conn1.CreateCommand();
                string SQL_ShoppingList;
                //Add your comments here
                myTransaction = conn1.BeginTransaction();
                command1.Transaction = myTransaction;
                // Performs an Insert statement
                SQL_ShoppingList = "Delete from [Shopping List] Where [List_Id] = " + id + "";
                command1.CommandType = CommandType.Text;
                command1.CommandText = SQL_ShoppingList;
                command1.ExecuteNonQuery();
                //Commit the Transaction
                myTransaction.Commit();
                conn1.Close();
                fillGrid();
            }
            //catch (Exception ex)
            catch (Exception)
            {
                myTransaction.Rollback();
                errorMessageBox("Failed to delete items on the selected list.");
            }

            //Delete User List from List table first
            try
            {
                // Creates a new connection
                OleDbConnection conn2 = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + Server.MapPath("Database21.accdb"));
                conn2.Open();
                OleDbCommand command2 = conn2.CreateCommand();
                string SQL_List;
                //Add your comments here
                myTransaction = conn2.BeginTransaction();
                command2.Transaction = myTransaction;
                // Performs an Insert statement
                SQL_List = "Delete from [LIST] Where [List_Id] = " + id + "";
                command2.CommandType = CommandType.Text;
                command2.CommandText = SQL_List;
                command2.ExecuteNonQuery();
                //Commit the Transaction
                myTransaction.Commit();
                conn2.Close();
                fillGrid();
            }
            //catch (Exception ex)
            catch (Exception)
            {
                myTransaction.Rollback();
                errorMessageBox("Failed to delete selected list.");
            }
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            lblError.Text = "";
            string list_id = ((Label)GridView1.Rows[e.RowIndex].FindControl("Label1")).Text;
            string user_list = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox1")).Text;
            //if user list is blank
            if (string.IsNullOrWhiteSpace(user_list))
            {
                errorMessageBox("Do not leave list blank. Please rename the list or click Cancel.");
                return;
            }

            OleDbTransaction myTransaction = null;
            //Update User List
            try
            {
                // Creates a new connection
                OleDbConnection conn1 = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + Server.MapPath("Database21.accdb"));
                conn1.Open();
                OleDbCommand command1 = conn1.CreateCommand();
                string SQL_ShoppingList;
                //Add your comments here
                myTransaction = conn1.BeginTransaction();
                command1.Transaction = myTransaction;
                // Performs an Insert statement
                SQL_ShoppingList = "Update [LIST] Set [User_List] = '" + user_list + "' Where [List_Id] = " + list_id + "";
                command1.CommandType = CommandType.Text;
                command1.CommandText = SQL_ShoppingList;
                command1.ExecuteNonQuery();
                //Commit the Transaction
                myTransaction.Commit();
                // Closes the connection and makes boolean recordSaved true
                conn1.Close();
                //Come out from edit item
                GridView1.EditIndex = -1;
                fillGrid();
            }
            //catch (Exception ex)
            catch (Exception)
            {
                myTransaction.Rollback();
                errorMessageBox("Failed to update your list.");
            }
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            lblError.Text = "";
            GridView1.EditIndex = -1;
            fillGrid();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            lblError.Text = "";
            GridView1.EditIndex = e.NewEditIndex;
            fillGrid();
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            lblError.Text = "";
            string user_list = txtInsert.Text;
            //if user list is blank
            if (string.IsNullOrWhiteSpace(user_list))
            {
                lblError.Text = "Do not leave list blank after clicking Insert.";
                return;
            }

            OleDbTransaction myTransaction = null;
            string user = Session["User_Id"].ToString();
            //Insert list into List Table
            try
            {
                // Creates a new connection
                OleDbConnection conn1 = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + Server.MapPath("Database21.accdb"));
                conn1.Open();
                OleDbCommand command1 = conn1.CreateCommand();
                string SQL_ShoppingList;
                //Add your comments here
                myTransaction = conn1.BeginTransaction();
                command1.Transaction = myTransaction;
                // Performs an Insert statement
                SQL_ShoppingList = "Insert Into [LIST] (User_list, User_Id) Values ('" + user_list + "', '" + user + "')";
                command1.CommandType = CommandType.Text;
                command1.CommandText = SQL_ShoppingList;
                command1.ExecuteNonQuery();
                //Commit the Transaction
                myTransaction.Commit();
                // Closes the connection and makes boolean recordSaved true
                conn1.Close();
                fillGrid();
                txtInsert.Text = "";
            }
            //catch (Exception ex)
            catch (Exception)
            {
                myTransaction.Rollback();
                errorMessageBox("Failed to add user list.");
            }
        }
        
        //Error Messagebox if failed to add user
        private void errorMessageBox(String msg)
        {
            //Display message box before directing to Shopping List page
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + msg + "');", true);
        }

        public void LinkButton_Click(object sender, System.EventArgs e)
        {
            Session["User_Id"] = null;
            Session["Role"] = null;
            Response.Redirect("Default.aspx");
        }
    }
}