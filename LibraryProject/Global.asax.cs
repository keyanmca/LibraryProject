using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace LibraryProject
{
    public class Global : System.Web.HttpApplication
    {
        GenelDataContext db = new GenelDataContext();
        private static int totalNumberOfUsers = 0;

        public static int TotalNumberOfUsers
        {
            get { return Global.totalNumberOfUsers; }
        }
        private static int currentNumberOfUsers = 0;

        public static int CurrentNumberOfUsers
        {
            get { return Global.currentNumberOfUsers; }
        }
        protected void Application_Start(object sender, EventArgs e)
        {
            Application["hit"] = 0;
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            int b = int.Parse(Application["hit"].ToString());
            totalNumberOfUsers += 1;
            b++;
            Application["hit"] = b;
            currentNumberOfUsers += 1;
            Session.Timeout = 90;
            if (Request.Cookies["userID"]!=null)
            {
                tbl_AccountLog ne = new tbl_AccountLog();
                int a=int.Parse(Request.Cookies["userID"].Value.ToString());
                ne.UserID = a;
                ne.Date = DateTime.Now;
                ne.Type = "Log in";
                db.tbl_AccountLogs.InsertOnSubmit(ne);
                db.SubmitChanges();
            }
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {
            currentNumberOfUsers -= 1;
            if (Session["userID"] != null)
            {
                tbl_AccountLog ne = new tbl_AccountLog();
                ne.UserID = int.Parse(Session["userID"].ToString());
                ne.Date = DateTime.Now;
                ne.Type = "Log out";
                db.tbl_AccountLogs.InsertOnSubmit(ne);
                db.SubmitChanges();
            }
        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}