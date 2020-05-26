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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User_Id"] != null)
            {
                Response.Redirect("~/Home.aspx");
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            //Clear all textbox and set dd to AL
            txtboxFN.Text = "";
            txtboxLN.Text = "";
            txtboxAddress.Text = "";
            txtboxCity.Text = "";
            ddState.SelectedValue = "AL";
            txtboxZip.Text = "";
            txtboxPhone.Text = "";
            txtboxEmail.Text = "";
            txtboxUser.Text = "";
            txtboxPsswd.Text = "";
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string fn = txtboxFN.Text;
            string ln = txtboxLN.Text;
            string address = txtboxAddress.Text;
            string city = txtboxCity.Text;
            string state = ddState.SelectedValue;
            string zip = txtboxZip.Text;
            string phone = txtboxPhone.Text;
            string email = txtboxEmail.Text;
            string user = txtboxUser.Text;
            string psswd = txtboxPsswd.Text;
            string role = "user";
            addUser(Server.MapPath("Database21.accdb"), fn, ln, address, city, state, zip, phone, email, user, psswd, role);

            MessageBox("You have successfully created an account for Grocery Gadget!");
            
            //AUTOMATICALLY LOGIN
            dsPerson dsUserLogin;
            string SecurityLevel;
            string userid;
            dsUserLogin = clsDataLayer.VerifyUser(Server.MapPath("Database21.accdb"), user, psswd);

            SecurityLevel = dsUserLogin.PERSON[0].Role.ToString();
            userid = dsUserLogin.PERSON[0].User_Id.ToString();

            Session["Role"] = SecurityLevel;
            Session["User_Id"] = userid;

            //Add default list to List Table for new user id
            addList(userid);

        }

        //Calls to Add User Into PERSON table
        public void addUser(string Database, string fn, string ln, string ad, string city, string state, string zip, string phone, string email, string user, string pass, string role)
        {
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
                strSQL = "Insert into [PERSON] " +
                "(UserName, UserPassword, FName, LName, SAdress, SCity, SState, SZip, SPhone, Email, Role) values ('" +
                user + "', '" + pass + "', '" + fn + "', '" + ln + "', '" + ad + "', '" +
                city + "', '" + state + "', '" + zip + "', '" + phone + "', '" + email + "', '" + role + "')";
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
                errorMessageBox("Failed to create an account.");
            }
        }

        //Add Default list to List table
        public void addList(string user)
        {
                OleDbTransaction myTransaction = null;
                string dflt = "Default";
                OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + Server.MapPath("Database21.accdb"));
                conn.Open();
                OleDbCommand command = conn.CreateCommand();
                string strSQL;
                myTransaction = conn.BeginTransaction();
                command.Transaction = myTransaction;
                strSQL = "Insert into [LIST] (User_List, User_Id) values ('" + dflt + "', '" + user + "')";
                command.CommandType = CommandType.Text;
                command.CommandText = strSQL;
                command.ExecuteNonQuery();
                myTransaction.Commit();
                conn.Close();
        }

        //Regular Messagebox that leads to Home Page if successfully added user
        private void MessageBox(String msg)
        {
            //Display message box before directing to Shopping List page
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + msg + "');window.location ='Home.aspx';", true);
        }

        //Error Messagebox if failed to add user
        private void errorMessageBox(String msg)
        {
            //Display message box before directing to Shopping List page
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + msg + "');", true);
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}