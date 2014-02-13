using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace LibraryProject
{
    public partial class BooksManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        GenelDataContext db = new GenelDataContext();
        protected void btn_add_Click(object sender, EventArgs e)
        {
            lbl_intro.ForeColor = Color.Red;

            if (TextBoxTitle.Text.Length==0 || TextBoxTitle.Text.Length > 50)
            {
                lbl_intro.Text = "Length of Title should be 1-50";
                return;
            }

            if (ddl_category.SelectedIndex==-1)
            {
                lbl_intro.Text = "Please Choose Category!";
                return;
            }

            if (TextBoxAuthor.Text.Length<3)
            {
                lbl_intro.Text = "Author is too short!";
                return;
            }
            int year;
            if (!int.TryParse(TextBoxYear.Text,out year))
            {
                lbl_intro.Text = "Please enter year correctly!";
                return;
            }
            if (year>DateTime.Now.Year || year<1600)
            {
                lbl_intro.Text = "Year should be 1600-" + DateTime.Now.Year.ToString() ;
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


            tbl_Book newBook = new tbl_Book();

            newBook.Author = TextBoxAuthor.Text;
            newBook.BookDesc = TextBoxDesc.Text;
            newBook.BookTitle = TextBoxTitle.Text;
            newBook.CategoryID = int.Parse(ddl_category.SelectedValue.ToString());
            newBook.Publisher = TextBoxPublisher.Text;
            newBook.Year = year;
            newBook.ImagePath = "~/images/" + FileUploadImage.FileName;
            if (FileUploadImage.HasFile)
            {
                FileUploadImage.SaveAs(Server.MapPath("~/images/" + FileUploadImage.FileName));
            }
            db.tbl_Books.InsertOnSubmit(newBook);
            db.SubmitChanges();

            lbl_intro.ForeColor = Color.Green;
            lbl_intro.Text = newBook.BookTitle+" Has Been Added Successfully";




            Response.Redirect("AdminBooks.aspx");
        }

       

        
        
    }
}