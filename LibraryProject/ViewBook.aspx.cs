using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryProject
{
    public partial class ViewBook : System.Web.UI.Page
    {
        GenelDataContext db = new GenelDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["bid"] != null)
                {
                    var item = from u in db.tbl_Books
                               where u.BookId == int.Parse(Request.QueryString["bid"]) 
                               select u;
                    foreach (var z in item)
                    {
                        lbl_author.Text = z.Author;
                        lbl_title.Text = z.BookTitle;
                        lbl_Year.Text = z.Year.ToString() ;
                        TextBox1.Text = z.BookDesc;
                        lbl_publisher.Text = z.Publisher;
                        Image1.ImageUrl = z.ImagePath;
                        var ite = from u in db.tbl_Categories
                                  where u.CategoryId == z.CategoryID
                                  select u;
                        foreach (var x in ite)
                        {
                            lbl_category.Text = x.CategoryName;
                        }
                        

                    }
                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
            }
        }
    }
}