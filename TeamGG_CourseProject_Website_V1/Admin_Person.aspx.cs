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
    public partial class Admin_Person : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Prevent going back to Admin page after logoff
            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();

            if (Session["User_Id"] == null)
            {
                Response.Redirect("Default.aspx");
            }

            if (Session["Role"].ToString() == "user")
            {
                Response.Redirect("Default.aspx");
            }
            if (!IsPostBack)
            {
                fillGrid();
            }
        }

        public void fillGrid()
        {
            var data = getDataTable();
            GridView1.DataSource = data;
            GridView1.DataBind();
        }

        public DataTable getDataTable()
        {
            string sql = "Select User_Id, UserName, UserPassword, FName, LName, SAdress, SCity, SState, SZip, SPhone, Email, Role from [PERSON]";
            OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + Server.MapPath("Database21.accdb"));
            OleDbCommand cmd = new OleDbCommand(sql, conn);
            OleDbDataAdapter da = new OleDbDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds.Tables[0];
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string currentid = Session["User_Id"].ToString();
            string id = ((Label)GridView1.Rows[e.RowIndex].FindControl("lblId")).Text;
            string role = ((Label)GridView1.Rows[e.RowIndex].FindControl("Label12")).Text;
            OleDbTransaction myTransaction = null;

            if (currentid == id)
            {
                errorMessageBox("You cannot delete an admin that is currently logged in.");
                return;
            }

            //If role is a regular user, not admin
            if (role == "user")
            {

                //Delete user's Shopping List first
                try
                {
                    // Creates a new connection
                    OleDbConnection conn3 = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + Server.MapPath("Database21.accdb"));
                    conn3.Open();
                    OleDbCommand command3 = conn3.CreateCommand();
                    string SQL_Shop;
                    //Add your comments here
                    myTransaction = conn3.BeginTransaction();
                    command3.Transaction = myTransaction;
                    // Performs an Insert statement
                    SQL_Shop = "Delete from [SHOPPING LIST] Where [User_Id] = " + id + "";
                    command3.CommandType = CommandType.Text;
                    command3.CommandText = SQL_Shop;
                    command3.ExecuteNonQuery();
                    //Commit the Transaction
                    myTransaction.Commit();
                    // Closes the connection and makes boolean recordSaved true
                    conn3.Close();
                    fillGrid();
                }
                //catch (Exception ex)
                catch (Exception)
                {
                    myTransaction.Rollback();
                    errorMessageBox("Failed to delete user's shopping list table.");
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
                    SQL_List = "Delete from [LIST] Where [User_Id] = " + id + "";
                    command2.CommandType = CommandType.Text;
                    command2.CommandText = SQL_List;
                    command2.ExecuteNonQuery();
                    //Commit the Transaction
                    myTransaction.Commit();
                    // Closes the connection and makes boolean recordSaved true
                    conn2.Close();
                    fillGrid();
                }
                //catch (Exception ex)
                catch (Exception)
                {
                    myTransaction.Rollback();
                    errorMessageBox("Failed to delete user list on the List table.");
                }
            }

            //Delete User Id from Person
            try
            {
                OleDbConnection conn1 = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + Server.MapPath("Database21.accdb"));
                conn1.Open();
                OleDbCommand command1 = conn1.CreateCommand();
                string SQL_Person;
                //Add your comments here
                myTransaction = conn1.BeginTransaction();
                command1.Transaction = myTransaction;
                // Performs an Insert statement
                SQL_Person = "Delete from [PERSON] Where [User_Id] = " + id + "";
                command1.CommandType = CommandType.Text;
                command1.CommandText = SQL_Person;
                command1.ExecuteNonQuery();
                //Commit the Transaction
                myTransaction.Commit();
                // Closes the connection and makes boolean recordSaved true
                conn1.Close();
                fillGrid();
            }
            //catch (Exception ex)
            catch (Exception)
            {
                myTransaction.Rollback();
                errorMessageBox("Failed to delete User Id on the Person table.");
            }
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string user_id = ((Label)GridView1.Rows[e.RowIndex].FindControl("Label1")).Text;
            string userName = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox1")).Text;
            string userPass = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox2")).Text;
            string FiName = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox3")).Text;
            string LaName = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox4")).Text;
            string user_Add = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox5")).Text;
            string user_City = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox6")).Text;
            string user_State = ((DropDownList)GridView1.Rows[e.RowIndex].FindControl("DropDownList1")).SelectedValue;
            string user_Zip = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox8")).Text;
            string user_Phone = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox9")).Text;
            string user_Email = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox10")).Text;

            OleDbTransaction myTransaction = null;
            //Update User List
            try
            {
                // Creates a new connection
                OleDbConnection conn1 = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + Server.MapPath("Database21.accdb"));
                conn1.Open();
                OleDbCommand command1 = conn1.CreateCommand();
                string SQL_Person;
                //Add your comments here
                myTransaction = conn1.BeginTransaction();
                command1.Transaction = myTransaction;
                // Performs an Insert statement
                SQL_Person = "Update [PERSON] Set [UserName] = '" + userName + "', [UserPassword] = '" + userPass + "', [FName] = '" + FiName + "', [LName] = '" + LaName
                    + "', [SAdress] = '" + user_Add + "', [SCity] = '" + user_City + "', [SState] = '" + user_State + "', [SZip] = '" + user_Zip + "', [SPhone] = '" + user_Phone
                    + "', [Email] = '" + user_Email + "' Where [User_Id] = " + user_id + "";
                command1.CommandType = CommandType.Text;
                command1.CommandText = SQL_Person;
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
                errorMessageBox("Failed to update user's information.");
            }
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            fillGrid();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            fillGrid();
        }

        protected void lbInsert_Click(object sender, EventArgs e)
        {
            OleDbTransaction myTransaction = null;
            try
            {
                // Creates a new connection
                OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + Server.MapPath("Database21.accdb"));
                conn.Open();
                OleDbCommand command = conn.CreateCommand();
                string strSQL;
                //Add your comments here
                myTransaction = conn.BeginTransaction();
                command.Transaction = myTransaction;
                // Performs an Insert statement
                strSQL = "Insert into [PERSON] " +
                "(UserName, UserPassword, FName, LName, SAdress, SCity, SState, SZip, SPhone, Email, Role) values ('" +
                ((TextBox)GridView1.FooterRow.FindControl("txtUserName")).Text + "', '" + ((TextBox)GridView1.FooterRow.FindControl("txtUserPsswd")).Text + "', '"
                + ((TextBox)GridView1.FooterRow.FindControl("txtFName")).Text + "', '" + ((TextBox)GridView1.FooterRow.FindControl("txtLName")).Text + "', '"
                + ((TextBox)GridView1.FooterRow.FindControl("txtAddress")).Text + "', '" + ((TextBox)GridView1.FooterRow.FindControl("txtCity")).Text + "', '"
                + ((DropDownList)GridView1.FooterRow.FindControl("ddState")).SelectedValue + "', '" + ((TextBox)GridView1.FooterRow.FindControl("txtZip")).Text + "', '"
                + ((TextBox)GridView1.FooterRow.FindControl("txtPhone")).Text + "', '" + ((TextBox)GridView1.FooterRow.FindControl("txtEmail")).Text + "', '" + ((DropDownList)GridView1.FooterRow.FindControl("ddRole")).SelectedValue + "')";
                command.CommandType = CommandType.Text;
                command.CommandText = strSQL;
                command.ExecuteNonQuery();
                //Commit the Transaction
                myTransaction.Commit();
                conn.Close();

                //If user, add default list to List Table
                if (((DropDownList)GridView1.FooterRow.FindControl("ddRole")).SelectedValue == "user")
                {
                    //Get last User_Id
                    OleDbConnection conn1;
                    OleDbCommand cmd1;
                    string sql1 = null;
                    OleDbDataReader reader;
                    sql1 = "Select MAX(User_Id) as User_Id From Person";
                    conn1 = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + Server.MapPath("Database21.accdb"));
                    conn1.Open();
                    cmd1 = new OleDbCommand(sql1, conn1);
                    reader = cmd1.ExecuteReader();
                    while (reader.Read())
                    {
                        string userid = reader["User_Id"].ToString();
                        //Insert default list into List Table
                        OleDbTransaction myTransaction2 = null;
                        string dflt = "Default";
                        OleDbConnection conn2 = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + Server.MapPath("Database21.accdb"));
                        conn2.Open();
                        OleDbCommand command2 = conn2.CreateCommand();
                        string strSQL2;
                        myTransaction2 = conn2.BeginTransaction();
                        command2.Transaction = myTransaction2;
                        strSQL2 = "Insert into [LIST] (User_List, User_Id) values ('" + dflt + "', '" + userid + "')";
                        command2.CommandType = CommandType.Text;
                        command2.CommandText = strSQL2;
                        command2.ExecuteNonQuery();
                        myTransaction2.Commit();
                        conn2.Close();
                    }
                    reader.Close();
                    cmd1.Dispose();
                    conn1.Close();
                }
                fillGrid();
            }
            //catch (Exception ex)
            catch (Exception)
            {
                myTransaction.Rollback();
                errorMessageBox("Failed to add user into Person table.");
            }
        }

        //Error Messagebox if failed to add user
        private void errorMessageBox(String msg)
        {
            //Display message box before directing to Shopping List page
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + msg + "');", true);
        }

        //Sorting code
        protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
        {
            string sortExp = e.SortExpression;
            string direction = string.Empty;
            if (SortDir == SortDirection.Ascending)
            {
                SortDir = SortDirection.Descending;
                direction = "DESC";
            }
            else
            {
                SortDir = SortDirection.Ascending;
                direction = "ASC";
            }

            DataTable dt = getDataTable();
            dt.DefaultView.Sort = sortExp + " " + direction;
            GridView1.DataSource = dt;
            GridView1.DataBind();

        }

        public SortDirection SortDir
        {
            get
            {
                if (ViewState["SortDir"] == null)
                {
                    ViewState["SortDir"] = SortDirection.Ascending;
                }
                return (SortDirection)ViewState["SortDir"];
            }
            set
            {
                ViewState["SortDir"] = value;
            }
        }
    }
}