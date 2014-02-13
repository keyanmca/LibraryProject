using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace LibraryProject
{
    public partial class EditBooks : System.Web.UI.Page
    {
        GenelDataContext db = new GenelDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    string id = Request.QueryString["bid"];
                    var item = from u in db.tbl_Books
                               where u.BookId == int.Parse(id)
                               select u;
                    foreach (var z in item)
                    {
                        TextBoxAuthor.Text = z.Author;
                        TextBoxDesc.Text = z.BookDesc;
                        TextBoxPublisher.Text = z.Publisher;
                        TextBoxTitle.Text = z.BookTitle;
                        TextBoxYear.Text = z.Year.ToString();
                        ddl_category.SelectedValue = z.CategoryID.ToString();
                    }
                }
                catch (Exception)
                {
                    Response.Redirect("DefaultAdmin.aspx");
                    throw;
                }
            }
        }

        protected void btn_Update_Click(object sender, EventArgs e)
        {
            lbl_intro.ForeColor = Color.Red;

            if (TextBoxTitle.Text.Length == 0 || TextBoxTitle.Text.Length > 50)
            {
                lbl_intro.Text = "Length of Title should be 1-50";
                return;
            }

            if (ddl_category.SelectedIndex == -1)
            {
                lbl_intro.Text = "Please Choose Category!";
                return;
            }

            if (TextBoxAuthor.Text.Length < 3)
            {
                lbl_intro.Text = "Author is too short!";
                return;
            }
            int year;
            if (!int.TryParse(TextBoxYear.Text, out year))
            {
                lbl_intro.Text = "Please enter year correctly!";
                return;
            }
            if (year > DateTime.Now.Year || year < 1600)
            {
                lbl_intro.Text = "Year should be 1600-" + DateTime.Now.Year.ToString();
                return;
            }

            if (TextBoxPublisher.Text.Length < 3)
            {
                lbl_intro.Text = "Publisher is too short!";
                return;
            }

            if (TextBoxDesc.Text.Length < 50)
            {
                lbl_intro.Text = "Desc is too short!";
                return;
            }

            if (!regexValidator.IsValid)
            {
                lbl_intro.Text = "Please Choose only .jpg .jpeg .png";
                return;
            }


            string id = Request.QueryString["bid"];
            var item = from u in db.tbl_Books
                       where u.BookId == int.Parse(id)
                       select u;
            foreach (var z in item)
            {
                z.Author = TextBoxAuthor.Text;
                z.BookDesc = TextBoxDesc.Text;
                z.BookTitle = TextBoxTitle.Text;
                z.CategoryID = int.Parse(ddl_category.SelectedValue.ToString());
                z.Publisher = TextBoxPublisher.Text;
                z.Year = year;
                if (FileUploadImage.HasFile)
                {
                    z.ImagePath = "~/images/" + FileUploadImage.FileName;
                    FileUploadImage.SaveAs(Server.MapPath("~/images/" + FileUploadImage.FileName));
                }
                db.SubmitChanges();

                lbl_intro.ForeColor = Color.Green;
                lbl_intro.Text = z.BookTitle + " Has Been Updated Successfully";
            }


            
            
        }
    }
}