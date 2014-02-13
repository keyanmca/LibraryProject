using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryProject
{
    public partial class Main : System.Web.UI.MasterPage
    {
        GenelDataContext db = new GenelDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = Global.CurrentNumberOfUsers.ToString();
            Label2.Text = DateTime.Now.ToShortDateString();
            lbl_hit.Text = Global.TotalNumberOfUsers.ToString()+Application["hit"].ToString();
            if (Request.Cookies["userID"] != null && Session["userID"]==null)
            {
                Session["userID"] = Request.Cookies["UserID"].Value;
            }
            if (Session["userID"] != null)
            {
                var item =from u in db.tbl_users
                          where u.UserID==int.Parse(Session["userID"].ToString())
                              select u;
                foreach (var z in item)
                {
                    lnkbtnUsername.Text = z.UserName;
                }
                
                Panel2.Visible = true;
                Panel1.Visible = false;

                int id=int.Parse(Session["userID"].ToString());
                var ite = from m in db.tbl_Messages
                          where m.userID == id && m.state == "Unreaded"
                          select m;
                int mes = 0;
                foreach (var z in ite)
                {
                    mes++;
                }
                lnk_btn_messages.Text = "Messages (" + mes.ToString() + ")";
            }
            else
            {
                Panel2.Visible = false;
                Panel1.Visible = true;
                Response.Redirect("Index.aspx");
            }
            
        }

        protected void lnkbtnLogin_Click(object sender, EventArgs e)
        {
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
    }
}