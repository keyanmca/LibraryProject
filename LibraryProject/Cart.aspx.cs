using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace LibraryProject
{
    public partial class Cart : System.Web.UI.Page
    {
        GenelDataContext db = new GenelDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                if (Request.QueryString["bid"]!=null)
                {
                    var item = from u in db.tbl_users
                               where u.UserID == int.Parse(Session["userID"].ToString())
                               select u;
                    foreach (var z in item)
                    {
                        if (z.Type==3)
                        {
                            Label1.ForeColor = Color.Red;
                            Label1.Text = "You cannot make an order because, You are banned user.";
                            return;
                        }
                    }

                    bool flag = true;
                    var ite = from o in db.tbl_orders
                           join i in db.tbl_indexOrders on o.OrderID equals i.OrderID
                           where o.State == "Accepted" && i.BookID == int.Parse(Request.QueryString["bid"].ToString())
                           select new {
                               i.BookID
                           };
                    foreach (var z in ite)
                    {
                        Label1.ForeColor = Color.Red;
                        Label1.Text = "You cannot add this book Because, This book Barrowed please try again Later.";
                        flag = false;
                    }




                    if (flag)
                    {
                        if (Session["cart"] != null)
                        {
                            string cart = Session["cart"].ToString();
                            cart += "+" + Request.QueryString["bid"].ToString();
                            Session["cart"] = cart;
                        }
                        else
                        {
                            Session["cart"] = Request.QueryString["bid"];
                        } 
                    }
                }

                if (Request.QueryString["dbid"]!=null)
                {
                    string Cart = Session["cart"].ToString();
                    string[] crt = Cart.Split('+');
                    Cart = "";
                    for (int i = 0; i < crt.Length; i++)
                    {
                        if (crt[i]!=Request.QueryString["dbid"].ToString())
                        {
                            Cart += crt[i] + "+";
                        }
                    }

                    if (Cart.Length!=0)
                    {
                        string cart = Cart.Substring(0, Cart.Length - 1);
                        Session["cart"] = cart;
                    }
                    else
                    {
                        Session["cart"] = null;
                    }
                }

                try
                {
                    string Cart = Session["cart"].ToString();
                    string[] crt = Cart.Split('+');

                    var item = from b in db.tbl_Books
                               join c in db.tbl_Categories on b.CategoryID equals c.CategoryId
                               where crt.Contains(b.BookId.ToString())
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
                catch (Exception)
                {
                    
                }

            }
        }

        protected void Btn_Continue_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserBooks.aspx");
        }

        protected void Btn_Barrow_Click(object sender, EventArgs e)
        {
            if (Session["cart"]!=null)
            {
                tbl_order ne = new tbl_order();
                ne.UserID = int.Parse(Session["userID"].ToString());
                ne.StartDate = DateTime.Now;
                ne.State = "Waiting";
                db.tbl_orders.InsertOnSubmit(ne);
                db.SubmitChanges();

                var item = from o in db.tbl_orders
                           select o;
                int id=0;
                foreach (var z in item)
                {
                    id = z.OrderID;
                }


                string cart = Session["cart"].ToString();
                string[] crt = cart.Split('+');
                for (int i = 0; i < crt.Length; i++)
                {
                    tbl_indexOrder n = new tbl_indexOrder();
                    n.OrderID = id;
                    n.BookID = int.Parse(crt[i]);
                    db.tbl_indexOrders.InsertOnSubmit(n);
                    db.SubmitChanges();
                }
                Session["cart"] = "";
                Label1.Text = "Your Cart has sent succesfully";
                Response.Redirect("Cart.aspx");
                
                
            }
        }
    }
}