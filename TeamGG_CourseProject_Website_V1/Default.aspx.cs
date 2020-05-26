using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Security;

namespace TeamGG_CourseProject_Website_V1
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User_Id"] != null)
            {
                Response.Redirect("~/Home.aspx");
            }
                
        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            dsPerson dsUserLogin;
            string SecurityLevel;
            string userid;
            dsUserLogin = clsDataLayer.VerifyUser(Server.MapPath("Database21.accdb"), Login1.UserName, Login1.Password);

            //If login Fails
            if (dsUserLogin.PERSON.Count < 1)
            {
                e.Authenticated = false;
                return;
            }

            SecurityLevel = dsUserLogin.PERSON[0].Role.ToString();
            userid = dsUserLogin.PERSON[0].User_Id.ToString();

            switch (SecurityLevel)
            {
                case "admin":
                    e.Authenticated = true;
                    FormsAuthentication.RedirectFromLoginPage(Login1.UserName, false);
                    Session["Role"] = "admin";
                    break;
                case "user":
                    e.Authenticated = true;
                    FormsAuthentication.RedirectFromLoginPage(Login1.UserName, false);
                    Session["Role"] = "user";
                    break;
                default:
                    e.Authenticated = false;
                    break;
            }

            Session["User_Id"] = userid;
        }
    }
}