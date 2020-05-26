using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TeamGG_CourseProject_Website_V1
{
    public partial class Browse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) {
                //If someone is not logged in
                if (Session["User_Id"] == null)
                {
                    Response.Redirect("Default.aspx");
                }
            }

        protected void GridView1_RowCommand(Object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            Response.Redirect("~/BrowseItems.aspx?catID=" + e.CommandArgument);
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