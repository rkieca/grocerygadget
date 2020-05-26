using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TeamGG_CourseProject_Website_V1
{
    public partial class EditPerson : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //If someone is not logged in
            if (Session["User_Id"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            
            if (!IsPostBack)
            {
                fillInfo();
            }
        }

        public void fillInfo()
        {
            //retrieve user id
            string userid;
            userid = Convert.ToString(Session["User_Id"]);

            OleDbConnection conn;
            OleDbCommand cmd;
            string sql = null;
            OleDbDataReader reader;

            sql = "Select UserName, UserPassword, FName, LName, SAdress, SCity, SState, SZip, SPhone, Email from PERSON Where User_Id = " + userid + "";
            conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + Server.MapPath("Database21.accdb"));

            try
            {
                // Creates a new connection
                conn.Open();
                cmd = new OleDbCommand(sql, conn);
                reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    txtboxFN.Text = reader["FName"].ToString();
                    txtboxLN.Text = reader["LName"].ToString();
                    txtboxAddress.Text = reader["SAdress"].ToString();
                    txtboxCity.Text = reader["SCity"].ToString();
                    ddState.SelectedValue = reader["SState"].ToString();
                    txtboxZip.Text = reader["SZip"].ToString();
                    txtboxPhone.Text = reader["SPhone"].ToString();
                    txtboxEmail.Text = reader["Email"].ToString();
                    txtboxUser.Text = reader["UserName"].ToString();
                    txtboxPsswd.Text = reader["UserPassword"].ToString();
                    //don't make password textbox blank
                    txtboxPsswd.Attributes["type"] = "password";
                }
                reader.Close();
                cmd.Dispose();
                conn.Close();
            }
            catch
            {
                MessageBox("Failed to load your information.");
            }
        }

        //Perform the Update when button is clicked
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string fn = txtboxFN.Text;
            string ln = txtboxLN.Text;
            string address = txtboxAddress.Text;
            string city = txtboxCity.Text;
            string state = ddState.SelectedValue;
            string zip = txtboxZip.Text;
            string phone = txtboxPhone.Text;
            string email = txtboxEmail.Text;
            string psswd = txtboxPsswd.Text;
            string userid = Session["User_Id"].ToString();
            userid = Convert.ToString(Session["User_Id"]);
            updateUser(Server.MapPath("Database21.accdb"), fn, ln, address, city, state, zip, phone, email, psswd, userid);

            MessageBox("Your user information has been successfully updated.");

        }

        // This function updates the Person Table based on the user logged in
        public void updateUser(string Database, string fn, string ln, string ad, string city, string state, string zip, string phone, string email, string pass, string id)
        {
            OleDbTransaction myTransaction = null;
            try
            {
                // Creates a new connection
                OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + Database);
                conn.Open();
                OleDbCommand command = conn.CreateCommand();
                string strSQL;
                //Add your comments here
                myTransaction = conn.BeginTransaction();
                command.Transaction = myTransaction;
                // Performs an Update statement
                strSQL = ("Update PERSON set FName = '" + fn + "', LName = '" + ln + "', SAdress = '" + ad + "', SCity = '" + city + "', SState = '" + state
                        + "', SZip = '" + zip + "', SPhone = '" + phone + "', Email = '" + email + "', UserPassword = '" + pass + "' WHERE User_Id = " + id + "");
                command.CommandType = CommandType.Text;
                command.CommandText = strSQL;
                command.ExecuteNonQuery();
                //Commit the Transaction
                myTransaction.Commit();
                conn.Close();
            }
            //catch (Exception ex)
            catch (Exception)
            {
                myTransaction.Rollback();
                MessageBox("Failed to update your information.");
            }
        }

        //Regular Messagebox
        private void MessageBox(String msg)
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