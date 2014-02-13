using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace LibraryProject
{
    public partial class EditNew : System.Web.UI.Page
    {
        GenelDataContext db=new GenelDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    string id = Request.QueryString["nid"];
                    var item = from u in db.tbl_News
                               where u.NewID == int.Parse(id)
                               select u;
                    foreach (var z in item)
                    {
                        TextBox_title.Text = z.Title;
                        TextBox_content.Text = z.NewContent;
                    }
                }
                catch (Exception)
                {
                    Response.Redirect("DefaultAdmin.aspx");
                    throw;
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox_title.Text.Length == 0)
            {
                lbl_info.ForeColor = Color.Red;
                lbl_info.Text = "Please enter new title!";
                return;
            }
            else if (TextBox_content.Text.Length == 0)
            {
                lbl_info.ForeColor = Color.Red;
                lbl_info.Text = "Please enter new content!";
                return;
            }

            string id = Request.QueryString["nid"];
            var item = from u in db.tbl_News
                       where u.NewID == int.Parse(id)
                       select u;
            foreach (var z in item)
            {
                z.Title = TextBox_title.Text ;
                z.NewContent = TextBox_content.Text;

            }
            db.SubmitChanges();

            lbl_info.ForeColor = Color.Green;
            lbl_info.Text = "The New Has Been Updated Successfully";
        }
    }
}