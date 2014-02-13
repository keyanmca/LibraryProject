using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace LibraryProject
{
    public partial class AdminBooks : System.Web.UI.Page
    {
        GenelDataContext db = new GenelDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["bid"]!=null)
                {
                    tbl_BlockedBook ne = new tbl_BlockedBook();
                    ne.BookId = int.Parse(Request.QueryString["bid"]);
                    db.tbl_BlockedBooks.InsertOnSubmit(ne);
                    db.SubmitChanges();
                }


                var ite = from b in db.tbl_BlockedBooks
                          select b.BookId;
                var item = from b in db.tbl_Books
                           join c in db.tbl_Categories on b.CategoryID equals c.CategoryId
                           where !ite.Contains(b.BookId)
                           select new
                           {
                               b.BookId,b.BookTitle,b.Author,
                               desc=b.BookDesc.Substring(0,50)+"...",
                               b.Year,b.Publisher,b.ImagePath,c.CategoryName,b.CategoryID
                           };
                DataList1.DataSource = item;
                DataList1.DataBind();
            }
        }

        public void blockBook(int id)
        {
 
        }


        
    }
}