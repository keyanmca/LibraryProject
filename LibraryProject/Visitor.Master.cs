using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryProject
{
    public partial class Visitor : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_hit.Text = Global.TotalNumberOfUsers.ToString();
            GenelDataContext db = new GenelDataContext();
            var item = from b in db.tbl_Books
                       select b;
            int num = 0;
            foreach (var z in item)
            {
                num++;
            }
            Label1.Text = num.ToString();

        }
    }
}