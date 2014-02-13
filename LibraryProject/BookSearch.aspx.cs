using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryProject
{
    public partial class BookSearch : System.Web.UI.Page
    {
        GenelDataContext db = new GenelDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var ite = from b in db.tbl_BlockedBooks
                      select b.BookId;
            var item = from b in db.tbl_Books
                       join c in db.tbl_Categories on b.CategoryID equals c.CategoryId
                       where !ite.Contains(b.BookId) && b.BookTitle.Contains(@TextBox1.Text)
                       select new
                       {
                           b.BookId,
                           b.BookTitle,
                           b.Author,
                           desc = b.BookDesc.Substring(0, 46) + "...",
                           b.Year,
                           b.Publisher,
                           b.ImagePath,
                           c.CategoryName,
                           b.CategoryID
                       };
            DataList1.DataSource = item;
            DataList1.DataBind();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Panel3.Visible = true;
            Panel4.Visible = false;
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Panel3.Visible = false;
            Panel4.Visible = true;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            var ite = from b in db.tbl_BlockedBooks
                      select b.BookId;
            var item = from b in db.tbl_Books
                       join c in db.tbl_Categories on b.CategoryID equals c.CategoryId
                       where !ite.Contains(b.BookId) && b.BookTitle.Contains(@TextBox2.Text)
                       && b.Author.Contains(@TextBox3.Text) && b.CategoryID==int.Parse(DropDownList1.SelectedValue.ToString())
                       select new
                       {
                           b.BookId,
                           b.BookTitle,
                           b.Author,
                           desc = b.BookDesc.Substring(0, 46) + "...",
                           b.Year,
                           b.Publisher,
                           b.ImagePath,
                           c.CategoryName,
                           b.CategoryID
                       };
            DataList1.DataSource = item;
            DataList1.DataBind();
        }
    }
}