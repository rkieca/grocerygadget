using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace TeamGG_CourseProject_Website_V1
{
    public partial class Admin_Home : System.Web.UI.Page
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

            //Display full name of person logged in
            dsPerson dsUserLogin;
            string userid = Session["User_Id"].ToString();
            dsUserLogin = clsDataLayer.getUserInfo(Server.MapPath("Database21.accdb"), userid);
            string fname = dsUserLogin.PERSON[0].FName.ToString();
            string lname = dsUserLogin.PERSON[0].LName.ToString();
            Session["FName"] = fname;
            Session["LName"] = lname;
            lblAdmin.Text = fname + " " + lname;

        }

        protected void lbLogOut_Click(object sender, System.EventArgs e)
        {
            Session["User_Id"] = null;
            Session["Role"] = null;
            Response.Redirect("Default.aspx");
        }
    }
}