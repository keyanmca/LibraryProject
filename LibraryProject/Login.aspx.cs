using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryProject
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        GenelDataContext db = new GenelDataContext();

        protected void btn_Login_Click(object sender, EventArgs e)
        {
            if (txbox_password.Text=="" || txbox_Username.Text=="")
            {
                lbl_Intro.Text = "Please Fill The Empty Places!";
                return;
            }
            var item = from x in db.tbl_users
                       where x.UserName == txbox_Username.Text
                       select x;

            int us = 0;
            foreach (var u in item)
            {
                us = 1;
                if (u.Password!=txbox_password.Text)
                {
                    lbl_Intro.Text = "You entered wrong password, Please try again!";
                    return;
                }
            }

            if (us==0)
            {
                lbl_Intro.Text = "There is not such a username, Please click register button to register!";
                return;
            }

            foreach (var u in item)
            {
                Session["userID"] = u.UserID;
                if (Session["userID"] != null)
                {
                    tbl_AccountLog ne = new tbl_AccountLog();
                    ne.UserID = int.Parse(Session["userID"].ToString());
                    ne.Date = DateTime.Now;
                    ne.Type = "Log in";
                    db.tbl_AccountLogs.InsertOnSubmit(ne);
                    db.SubmitChanges();
                }
                if (checkbox_rememberMe.Checked)
                {
                    Response.Cookies["userID"].Value = u.UserID.ToString();
                    Response.Cookies["userID"].Expires = DateTime.Now.AddDays(30);
                }

                if (u.Type==1 || u.Type==3)
                {
                    Response.Redirect("Default.aspx");
                }
                else if (u.Type==0)
                {
                    Response.Redirect("DefaultAdmin.aspx");
                }
                else
                {
                    Response.Redirect("DefaultSupporter.aspx");
                }
            }

            
        }

        protected void btn_register_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }
    }
}