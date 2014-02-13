using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryProject
{
    public partial class EditNews : System.Web.UI.Page
    {
        GenelDataContext db = new GenelDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (Request.QueryString["nid"] != null)
                {
                    tbl_New ne = new tbl_New();
                    var item = from u in db.tbl_News
                         where u.NewID == int.Parse(Request.QueryString["nid"])
                         select u;
                    foreach (var z in item)
                    {
                        db.tbl_News.DeleteOnSubmit(z);
                    }
                    db.SubmitChanges();
                } 
            }
        }
    }
}