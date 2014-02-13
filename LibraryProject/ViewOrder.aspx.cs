using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryProject
{
    public partial class ViewOrder : System.Web.UI.Page
    {
        GenelDataContext db = new GenelDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["oid"]!=null)
                {
                    var item = from o in db.tbl_orders
                               join u in db.tbl_users on o.UserID equals u.UserID
                               where o.OrderID == int.Parse(Request.QueryString["oid"].ToString())
                               select new
                               {
                                   o.OrderID,
                                   u.UserName,
                                   o.StartDate,
                                   o.FinishDate,
                                   o.State
                               };
                    foreach (var z in item)
                    {
                        if (Request.QueryString["oid"] != null)
                        {
                            lbl_startdate.Text = z.StartDate.ToString();
                            lbl_username.Text = z.UserName;
                            lbl_orderid.Text = z.OrderID.ToString();
                            lbl_finis.Text = z.FinishDate.ToString();
                            lbl_state.Text = z.State;

                            var ite = from i in db.tbl_indexOrders
                                      where i.OrderID == z.OrderID
                                      select i.BookID;
                            var it = from b in db.tbl_Books
                                     join c in db.tbl_Categories on b.CategoryID equals c.CategoryId
                                     where ite.Contains(b.BookId)
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

                            DataList1.DataSource = it;
                            DataList1.DataBind();
                        }
                    } 
                }
            }
        }
    }
}