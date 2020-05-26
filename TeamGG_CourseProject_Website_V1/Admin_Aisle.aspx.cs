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
    public partial class Admin_Aisle: System.Web.UI.Page
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
            string sql = "Select Aisle_Id, Aisle_Loc, Aisle_Des from [AISLE]";
            OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + Server.MapPath("Database21.accdb"));
            OleDbCommand cmd = new OleDbCommand(sql, conn);
            OleDbDataAdapter da = new OleDbDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds.Tables[0];
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = ((Label)GridView1.Rows[e.RowIndex].FindControl("Label2")).Text;
            OleDbTransaction myTransaction = null;

            // Delete aisle from Item Table first
            try
            {
                OleDbConnection conn3 = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + Server.MapPath("Database21.accdb"));
                conn3.Open();
                OleDbCommand command3 = conn3.CreateCommand();
                string SQL_Item;
                myTransaction = conn3.BeginTransaction();
                command3.Transaction = myTransaction;
                SQL_Item = "Delete from [ITEM] Where [Aisle_Id] = " + id + "";
                command3.CommandType = CommandType.Text;
                command3.CommandText = SQL_Item;
                command3.ExecuteNonQuery();
                myTransaction.Commit();
                conn3.Close();
                fillGrid();
            }
            //catch (Exception ex)
            catch (Exception)
            {
                myTransaction.Rollback();
                errorMessageBox("Cannot delete aisle when user(s) has the item on that category in their shopping list.");
            }

            //Delete aisle from Aisle table
            try
            {
                OleDbConnection conn2 = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + Server.MapPath("Database21.accdb"));
                conn2.Open();
                OleDbCommand command2 = conn2.CreateCommand();
                string SQL_Aisle;
                myTransaction = conn2.BeginTransaction();
                command2.Transaction = myTransaction;
                SQL_Aisle = "Delete from [AISLE] Where [Aisle_Id] = " + id + "";
                command2.CommandType = CommandType.Text;
                command2.CommandText = SQL_Aisle;
                command2.ExecuteNonQuery();
                myTransaction.Commit();
                conn2.Close();
                fillGrid();
            }
            //catch (Exception ex)
            catch (Exception)
            {
                myTransaction.Rollback();
                errorMessageBox("Failed to delete aisle from Aisle table.");
            }
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string id = ((Label)GridView1.Rows[e.RowIndex].FindControl("Label1")).Text;
            string aisleLoc = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox1")).Text;
            string aisleDesc = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox2")).Text;

            OleDbTransaction myTransaction = null;
            //Update User List
            try
            {
                OleDbConnection conn1 = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + Server.MapPath("Database21.accdb"));
                conn1.Open();
                OleDbCommand command1 = conn1.CreateCommand();
                string SQL_Person;
                myTransaction = conn1.BeginTransaction();
                command1.Transaction = myTransaction;
                SQL_Person = "Update [AISLE] Set [Aisle_Loc] = '" + aisleLoc + "', [Aisle_Des] = '" + aisleDesc + "' Where [Aisle_Id] = " + id + "";
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
                errorMessageBox("Failed to update aisle information.");
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
                OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + Server.MapPath("Database21.accdb"));
                conn.Open();
                OleDbCommand command = conn.CreateCommand();
                string strSQL;
                //Add your comments here
                myTransaction = conn.BeginTransaction();
                command.Transaction = myTransaction;
                // Performs an Insert statement
                strSQL = "Insert into [AISLE] " + "(Aisle_Loc, Aisle_Des) values ('" +
                ((TextBox)GridView1.FooterRow.FindControl("txtLocation")).Text + "', '" + ((TextBox)GridView1.FooterRow.FindControl("txtDescription")).Text + "')";
                command.CommandType = CommandType.Text;
                command.CommandText = strSQL;
                command.ExecuteNonQuery();
                //Commit the Transaction
                myTransaction.Commit();
                conn.Close();
                fillGrid();
            }
            //catch (Exception ex)
            catch (Exception)
            {
                myTransaction.Rollback();
                errorMessageBox("Failed to add aisle into Aisle table.");
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
