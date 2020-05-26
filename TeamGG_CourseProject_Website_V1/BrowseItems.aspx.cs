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
    public partial class BrowseItems : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //If someone is not logged in
            if (Session["User_Id"] == null)
            {
                Response.Redirect("Default.aspx");
            }

            CheckBox ch = (CheckBox)GridView1.FindControl("CheckBox1");

            if (GridView1.Rows.Count == 0)
            {
                Button1.Visible = false;
            }
        }

        public void Button1_Click(object sender, EventArgs e)
        {
            //Count number of checkboxes
            int checkedCount = 0;

            foreach (GridViewRow gr in GridView1.Rows)
            {

                CheckBox ch = (CheckBox)gr.FindControl("CheckBox1");

                if (ch.Checked == true)
                {
                    checkedCount += 1;
                    string i = GridView1.DataKeys[gr.DataItemIndex].Values["Item_Id"].ToString();
                    string user = Session["User_Id"].ToString();
                    //List default item for Quantity column in Shopping List
                    int j = 1;
                    //Convert j to String
                    string def = j.ToString();
                    //List default item for Complete column in Shopping List (0 means not checked)
                    int k = 0;
                    //Convert k to String
                    string def2 = k.ToString();
                    DropDownList ddl1 = (DropDownList)(gr.FindControl("DropDownList1"));
                    string dd = ddl1.SelectedValue.ToString();
                    string time = DateTime.Now.ToString("MM/dd/yyyy hh:mm tt");
                    addToList(Server.MapPath("Database21.accdb"), i, user, def, def2, dd, time);
                }
            }

            //if total checkbox is 0, show error message; else show success message and go to Shopping List page
            if (checkedCount == 0)
            {
                errorMessageBox("You have nothing selected.");
                return;
            }
            else
            {
                MessageBox("Selected item(s) successfully added to your shopping list.");
                return;
            }
        }

        //Calls to Insert Selected Items Into Shopping List table
        public void addToList(string Database, string ItemID, string user, string def, string def2, string dd, string time)
        {
            //bool recordSaved;
            OleDbTransaction myTransaction = null;
            try
            {
                // Creates a new connection
                OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" +
                "Data Source=" + Database);
                conn.Open();
                OleDbCommand command = conn.CreateCommand();
                string strSQL;
                //Add your comments here
                myTransaction = conn.BeginTransaction();
                command.Transaction = myTransaction;
                // Performs an Insert statement
                strSQL = "Insert into [Shopping List] " +
                "(User_Id, Item_Id, [Date], Quantity, Complete, List_Id) values ('" +
                user + "', '" + ItemID + "', '" + time + "', '" + def + "', '" + def2 + "', '" + dd + "')";
                command.CommandType = CommandType.Text;
                command.CommandText = strSQL;
                command.ExecuteNonQuery();
                //Commit the Transaction
                myTransaction.Commit();
                // Closes the connection and makes boolean recordSaved true
                conn.Close();
            }
            //catch (Exception ex)
            catch (Exception)
            {
                myTransaction.Rollback();
                errorMessageBox("Failed to add selected item(s) to your shopping list.");
                GridView1.DataBind();
            }
        }

        //Regular Messagebox that leads to Shopping List if added item(s) successfully
        private void MessageBox(String msg)
        {
            //Display message box before directing to Shopping List page
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + msg + "');window.location ='ShoppingList.aspx';", true);
        }

        //Error Messagebox if failed to add item(s)
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