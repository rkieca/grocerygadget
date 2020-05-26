using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TeamGG_CourseProject_Website_V1
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //If someone is not logged in
            if (Session["User_Id"] == null)
            {
                Response.Redirect("Default.aspx");
            }

            //If logged in as admin
            if (Session["Role"].ToString() == "admin")
            {
                Response.Redirect("Admin_Home.aspx");
            }
            
            //Display full name of person logged in
            dsPerson dsUserLogin;
            string userid = Session["User_Id"].ToString();
            dsUserLogin = clsDataLayer.getUserInfo(Server.MapPath("Database21.accdb"), userid);
            string fname = dsUserLogin.PERSON[0].FName.ToString();
            string lname = dsUserLogin.PERSON[0].LName.ToString();
            Session["FName"] = fname;
            Session["LName"] = lname;
            lblUser.Text = fname + " " + lname;

            loadImage();
            
        }

        //Load images from database to imagebutton
        protected void loadImage()
        {
            OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + Server.MapPath("Database21.accdb"));
            // Creates a new connection
            conn.Open();
            OleDbCommand cmd = new OleDbCommand("Select Special_ImgPath from SPECIAL", conn);
            OleDbDataAdapter da = new OleDbDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            //string url = dt.Rows[0].ToString();
            OleDbDataReader reader;
            reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                ImageButton imageButton = new ImageButton();
                string url = reader["Special_ImgPath"].ToString();
                imageButton.ImageUrl = url;
                imageButton.Height = Unit.Pixel(139);
                imageButton.Style.Add("padding", "5px");
                imageButton.Width = Unit.Pixel(200);
                Panel1.Controls.Add(imageButton);
                imageButton.Click += new ImageClickEventHandler(imageButton_Click);
            }
            reader.Close();
            cmd.Dispose();
            conn.Close();
        }

        //new page to view image larger, _blank opens new window
        protected void imageButton_Click(object sender, ImageClickEventArgs e)
        {
            Response.Write("<script>window.open('ViewImage.aspx?ImageURL=" + ((ImageButton)sender).ImageUrl + "','_blank');</script>");
        }

        public void LinkButton_Click(object sender, System.EventArgs e)
        {
            Session["User_Id"] = null;
            Session["Role"] = null;
            Response.Redirect("Default.aspx");
        }
    }
}