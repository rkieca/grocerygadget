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
    public partial class Admin_Item : System.Web.UI.Page
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
            string sql = "Select Item_Id, Item_Name, Cat_Id, Aisle_Id, Item_ImgPath from [ITEM]";
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

            //Delete user's Shopping List first
            try
            {
                // Delete Item Table
                OleDbConnection conn3 = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + Server.MapPath("Database21.accdb"));
                conn3.Open();
                OleDbCommand command3 = conn3.CreateCommand();
                string SQL_Item;
                myTransaction = conn3.BeginTransaction();
                command3.Transaction = myTransaction;
                SQL_Item = "Delete from [ITEM] Where [Item_Id] = " + id + "";
                command3.CommandType = CommandType.Text;
                command3.CommandText = SQL_Item;
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
                errorMessageBox("Cannot delete item when user(s) has the item in their shopping list.");
            }
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string id = ((Label)GridView1.Rows[e.RowIndex].FindControl("Label1")).Text;
            string itemName = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox1")).Text;
            string catID = ((DropDownList)GridView1.Rows[e.RowIndex].FindControl("DropDownList1")).SelectedValue;
            string aisleID = ((DropDownList)GridView1.Rows[e.RowIndex].FindControl("DropDownList2")).SelectedValue;

            OleDbTransaction myTransaction = null;
            //Update Item table
            try
            {
                // Creates a new connection
                OleDbConnection conn1 = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + Server.MapPath("Database21.accdb"));
                conn1.Open();
                OleDbCommand command1 = conn1.CreateCommand();
                string SQL_Item;
                //Add your comments here
                myTransaction = conn1.BeginTransaction();
                command1.Transaction = myTransaction;
                // Performs an Insert statement
                SQL_Item = "Update [ITEM] Set [Item_Name] = '" + itemName + "', [Cat_Id] = '" + catID + "', [Aisle_Id] = '" + aisleID + "' Where [Item_Id] = " + id + "";
                command1.CommandType = CommandType.Text;
                command1.CommandText = SQL_Item;
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
                errorMessageBox("Failed to update item information.");
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
                //Save
                string dftImg = "images/question.jpg";

                // Creates a new connection
                OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + Server.MapPath("Database21.accdb"));
                conn.Open();
                OleDbCommand command = conn.CreateCommand();
                string strSQL;
                myTransaction = conn.BeginTransaction();
                command.Transaction = myTransaction;
                // Performs an Insert statement
                strSQL = "Insert into [ITEM] (Item_Name, Cat_Id, Aisle_Id, Item_ImgPath) values ('" +
                ((TextBox)GridView1.FooterRow.FindControl("txtItemName")).Text + "', '" + ((DropDownList)GridView1.FooterRow.FindControl("ddCatID")).SelectedValue + "', '"
                + ((DropDownList)GridView1.FooterRow.FindControl("ddAisleID")).SelectedValue + "', '" + dftImg + "')";
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
                errorMessageBox("Failed to add item into Item table.");
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