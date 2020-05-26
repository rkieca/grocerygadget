using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TeamGG_CourseProject_Website_V1
{
    public partial class Main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Clears cache to prevent going back after logoff
            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();

            /*THIS IS TO PREVENT THE HOME SCREEN AND NAVIGATION BEFORE LOGGING IN*/
//            if ((Request.Url.ToString().ToLower().IndexOf("default.aspx") > -1) || (Request.Url.ToString().ToLower().IndexOf("register.aspx") > -1) || (Request.Url.ToString().ToLower().IndexOf(".aspx") == -1))
//            {
//                pnMenu.Visible = false;

//            }
//            else
//            {
//                pnMenu.Visible = true;
//            }

        }

//        public void LinkButton_Click(object sender, System.EventArgs e)
//        {
//            Session["User_Id"] = null;
//            Session["Role"] = null;
//            Response.Redirect("Default.aspx");
//       }
    }
}