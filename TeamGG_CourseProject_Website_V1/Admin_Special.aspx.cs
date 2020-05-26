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
    public partial class Admin_Special : System.Web.UI.Page
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

        //Add image to SPECIAL database
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            //If file exists
            if (FileUpload1.HasFile)
            {
                string extension = System.IO.Path.GetExtension(FileUpload1.FileName);
                //if file extension is not image
                if (extension.ToLower() != ".jpg" && extension.ToLower() != ".png" && extension.ToLower() != ".tif" && extension.ToLower() != ".bmp")
                {
                    MessageBox("Please upload an image with extensions of jpg, png, tif, or bmp. Other extensions will not be accepted.");
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
                        string pathName = "images/specials/" + Path.GetFileName(FileUpload1.PostedFile.FileName);
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
                            strSQL = ("Insert Into [SPECIAL] (Special_ImgPath) values ('" + pathName + "')");
                            command.CommandType = CommandType.Text;
                            command.CommandText = strSQL;
                            command.ExecuteNonQuery();
                            myTransaction.Commit();
                            conn.Close();
                            FileUpload1.SaveAs(Server.MapPath("~/images/specials/" + FileUpload1.FileName));
                            GridView1.DataBind();
                        }
                        //catch (Exception ex)
                        catch (Exception)
                        {
                            myTransaction.Rollback();
                            MessageBox("Failed to add image.");
                        }
                    }
                }
            }
            else
            {
                MessageBox("Please upload an image.");
            }
        }

        //Update image to SPECIAL database
        protected void btnUpdate_Click(object sender, EventArgs e)
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
                            MessageBox("Please upload an image with extensions of jpg, png, tif, or bmp. Other extensions will not be accepted.");
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
                                string pathName = "images/specials/" + Path.GetFileName(FileUpload1.PostedFile.FileName);

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
                                    strSQL = ("Update [SPECIAL] set Special_ImgPath = '" + pathName + "' WHERE Special_Id = " + GridView1.DataKeys[gr.DataItemIndex].Values["Special_Id"].ToString() + "");
                                    command.CommandType = CommandType.Text;
                                    command.CommandText = strSQL;
                                    command.ExecuteNonQuery();
                                    //Commit the Transaction
                                    myTransaction.Commit();
                                    // Closes the connection and makes boolean recordSaved true
                                    conn.Close();
                                    FileUpload1.SaveAs(Server.MapPath("~/images/specials/" + FileUpload1.FileName));
                                    GridView1.DataBind();
                                    break;
                                }
                                //catch (Exception ex)
                                catch (Exception)
                                {
                                    myTransaction.Rollback();
                                    MessageBox("Failed to update image into selected special.");
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

        //Delete image
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            //Count number of checkboxes
            int checkedCount = 0;
            foreach (GridViewRow gr in GridView1.Rows)
            {
                RadioButton rb = (RadioButton)gr.FindControl("rbId");
                if (rb.Checked == true)
                {
                    checkedCount += 1;
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
                        strSQL = ("Delete from [SPECIAL] WHERE Special_Id = " + GridView1.DataKeys[gr.DataItemIndex].Values["Special_Id"].ToString() + "");
                        command.CommandType = CommandType.Text;
                        command.CommandText = strSQL;
                        command.ExecuteNonQuery();
                        myTransaction.Commit();
                        conn.Close();
                        GridView1.DataBind();
                        break;
                    }
                    //catch (Exception ex)
                    catch (Exception)
                    {
                        myTransaction.Rollback();
                        MessageBox("Failed to delete image from Special table.");
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