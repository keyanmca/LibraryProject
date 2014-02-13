using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryProject
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        GenelDataContext db = new GenelDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["userID"] != null && Session["userID"] == null)
            {
                Session["userID"] = Request.Cookies["UserID"].Value;
            }
            if (Session["userID"] != null)
            {
                var item = from u in db.tbl_users
                           where u.UserID == int.Parse(Session["userID"].ToString())
                           select u;
                foreach (var z in item)
                {
                    lnkbtnUsername.Text = z.UserName;
                    if (z.Type!=0)
                    {
                        Response.Redirect("Default.aspx");
                    }
                }
                

                Panel2.Visible = true;
                Panel1.Visible = false;
            }
            else
            {
                Panel2.Visible = false;
                Panel1.Visible = true;
                Response.Redirect("Default.aspx");
            }
        }

        protected void lnkbtnLogout_Click(object sender, EventArgs e)
        {
            if (Session["userID"] != null)
            {
                tbl_AccountLog ne = new tbl_AccountLog();
                ne.UserID = int.Parse(Session["userID"].ToString());
                ne.Date = DateTime.Now;
                ne.Type = "Log out";
                db.tbl_AccountLogs.InsertOnSubmit(ne);
                db.SubmitChanges();
            }
            Session["userID"] = null;
            Response.Cookies["userID"].Expires = DateTime.Now.AddDays(-1);
            Response.Redirect("Default.aspx");
        }

        protected void lnkbtnUsername_Click(object sender, EventArgs e)
        {

        }
    }
}