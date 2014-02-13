using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryProject
{
    public partial class Messages : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            GenelDataContext db = new GenelDataContext();
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                if (((CheckBox)GridView1.Rows[i].Cells[0].FindControl("CheckBox1")).Checked)
                {
                    var item = from m in db.tbl_Messages
                               where m.MessageID == int.Parse(GridView1.Rows[i].Cells[1].Text)
                               select m;
                    foreach (var z in item)
                    {
                        z.state = "Readed";
                        db.SubmitChanges();
                        GridView1.DataBind();
                    }
                }


            }
        }
    }
}