using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryProject
{
    public partial class AdminBlockedBooks : System.Web.UI.Page
    {
        GenelDataContext db = new GenelDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["bid"] != null)
                {
                    var iter = from u in db.tbl_BlockedBooks
                              where u.BookId == int.Parse(Request.QueryString["bid"])
                              select u;
                    foreach (var z in iter)
                    {
                        tbl_BlockedBook ne = z;
                        db.tbl_BlockedBooks.DeleteOnSubmit(ne);
                        db.SubmitChanges();
                    }
                }


                var ite = from b in db.tbl_BlockedBooks
                          select b.BookId;
                var item = from b in db.tbl_Books
                           join c in db.tbl_Categories on b.CategoryID equals c.CategoryId
                           where ite.Contains(b.BookId)
                           select new
                           {
                               b.BookId,
                               b.BookTitle,
                               b.Author,
                               desc = b.BookDesc.Substring(0, 50) + "...",
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
}