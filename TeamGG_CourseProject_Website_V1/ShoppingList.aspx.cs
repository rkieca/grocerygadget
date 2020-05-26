using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TeamGG_CourseProject_Website_V1
{
    public partial class ShoppingList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //If someone is not logged in
            if (Session["User_Id"] == null)
            {
                Response.Redirect("Default.aspx");
            }

            /*            if (GridView1.Rows.Count == 0)
                        {
                            labelPrint.Text = "You don't have anything on your Shopping List. Start adding by clicking on BROWSE Tab.";
                            labelPrint.BackColor = Color.Yellow;
                            linkPrint.Visible = false;
                        }
                        else
                        {
                            labelPrint.Text = "If you viewing it as desktop mode, you may print the sheet for your convenience. Click ";
                            labelPrint.BackColor = default(Color);
                            linkPrint.Visible = true;
                        } */
        }

        protected void linkPrint_Click(object sender, EventArgs e)
        {

        }

        public void LinkButton_Click(object sender, System.EventArgs e)
        {
            Session["User_Id"] = null;
            Session["Role"] = null;
            Response.Redirect("Default.aspx");
        }
    }
}
