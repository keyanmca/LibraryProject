using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data;

namespace LibraryProject
{
    public partial class AcceptOrder : System.Web.UI.Page
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
                                   o.StartDate
                               };
                    foreach (var z in item)
                    {
                        if (Request.QueryString["oid"] != null)
                        {
                            lbl_startdate.Text = z.StartDate.ToString();
                            lbl_username.Text = z.UserName;
                            lbl_orderid.Text = z.OrderID.ToString();

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

        protected void btn_accept_Click(object sender, EventArgs e)
        {

            bool flag = true;
            int oid = int.Parse(lbl_orderid.Text);
            var item = from i in db.tbl_indexOrders
                       where i.OrderID == oid
                       select i.BookID;

            var ite = from o in db.tbl_orders
                      join x in db.tbl_indexOrders on o.OrderID equals x.OrderID
                      where o.State == "Accepted" && item.Contains(x.BookID)
                      select new
                      {
                          x.BookID
                      };
            foreach (var z in ite)
            {
                Label1.ForeColor = Color.Red;
                Label1.Text = "You cannot add this book Because, This book Barrowed please try again Later.";
                flag = false;
            }
            
            

            if (flag)
            {
                var it = from o in db.tbl_orders
                         where o.OrderID == int.Parse(Request.QueryString["oid"].ToString())
                         select o;
                foreach (var z in it)
                {
                    z.State = "Accepted";
                    db.SubmitChanges();
                    tbl_Message ne = new tbl_Message();
                    ne.message = "Your Order whose number is " + Request.QueryString["oid"].ToString() + " Has Been Accepted Succesfully";
                    ne.userID = z.UserID;
                    ne.state = "Unreaded";
                    db.tbl_Messages.InsertOnSubmit(ne);
                    db.SubmitChanges(); 
                    Response.Redirect("AcceptOrders.aspx");
                }
               
               
            }

        }

        protected void btn_ignore_Click(object sender, EventArgs e)
        {
            var it = from o in db.tbl_orders
                     where o.OrderID == int.Parse(Request.QueryString["oid"].ToString())
                     select o;
            foreach (var z in it)
            {
                z.State = "Ignored";
                db.SubmitChanges();
                tbl_Message ne = new tbl_Message();
                ne.message = "Your Order whose number is " + Request.QueryString["oid"].ToString() + " Has Been Ignored";
                ne.userID = z.UserID;
                ne.state = "Unreaded";
                db.tbl_Messages.InsertOnSubmit(ne);
                db.SubmitChanges();
                Response.Redirect("AcceptOrders.aspx");
            }
        }
    }
}