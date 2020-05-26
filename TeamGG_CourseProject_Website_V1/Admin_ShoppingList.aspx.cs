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
    public partial class Admin_ShoppingList : System.Web.UI.Page
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
        }
    }
}