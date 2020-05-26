using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.IO;

namespace TeamGG_CourseProject_Website_V1
{
    public partial class Admin_CatImage : System.Web.UI.Page
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

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            //Count number of checkboxes
            int checkedCount = 0;
            foreach (GridViewRow gr in GridView1.Rows)
            {
                RadioButton rb = (RadioButton)gr.FindControl("rbId");

                if (rb.Checked == true)
                {
                    checkedCount += 1;
                    if (FileUpload1.HasFile)
                    {
                        string extension = System.IO.Path.GetExtension(FileUpload1.FileName);
                        //if file extension is not image
                        if (extension.ToLower() != ".jpg" && extension.ToLower() != ".png" && extension.ToLower() != ".tif" && extension.ToLower() != ".bmp")
                        {
                            MessageBox("Please upload an image with extensions jpg, png, tif, or bmp. Other extensions are not accepted.");
                        }
                        else
                        {
                            //fileSize will show in bytes
                            int fileSize = FileUpload1.PostedFile.ContentLength;
                            if (fileSize > 1048576)
                            {
                                MessageBox("Maximum file size exceeded. Please pick an image less than 1 MB.");
                            }
                            else
                            {
                                string pathName = "images/category/" + Path.GetFileName(FileUpload1.PostedFile.FileName);

                                //Perfrom long code SQL command
                                OleDbTransaction myTransaction = null;
                                try
                                {
                                    // Creates a new connection
                                    OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + Server.MapPath("Database21.accdb"));
                                    conn.Open();
                                    OleDbCommand command = conn.CreateCommand();
                                    string strSQL;
                                    //Add your comments here
                                    myTransaction = conn.BeginTransaction();
                                    command.Transaction = myTransaction;
                                    // Performs an Update statement
                                    strSQL = ("Update CATEGORY set Cat_ImgPath = '" + pathName + "' WHERE Cat_Id = " + GridView1.DataKeys[gr.DataItemIndex].Values["Cat_Id"].ToString() + "");
                                    command.CommandType = CommandType.Text;
                                    command.CommandText = strSQL;
                                    command.ExecuteNonQuery();
                                    //Commit the Transaction
                                    myTransaction.Commit();
                                    // Closes the connection and makes boolean recordSaved true
                                    conn.Close();
                                    FileUpload1.SaveAs(Server.MapPath("~/images/category/" + FileUpload1.FileName));
                                    MessageBox("Selected image successfully updated.");
                                    GridView1.DataBind();
                                    break;
                                }
                                //catch (Exception ex)
                                catch (Exception)
                                {
                                    myTransaction.Rollback();
                                    MessageBox("Failed to update image.");
                                    break;
                                }
                            }
                        }
                    }
                    else
                    {
                        MessageBox("Please upload an image.");
                        break;
                    }
                }
            }

            //if total checkbox is 0, show error message
            if (checkedCount == 0)
            {
                MessageBox("You have nothing selected.");
            }
        }

        //Error Messagebox if failed to add user
        private void MessageBox(String msg)
        {
            //Display message box before directing to Shopping List page
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + msg + "');", true);
        }
    }
}