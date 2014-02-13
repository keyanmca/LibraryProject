using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryProject
{
    public partial class EditSupportTeam : System.Web.UI.Page
    {
        GenelDataContext db = new GenelDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lnkbtn_delete_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                if (((CheckBox)GridView1.Rows[i].Cells[0].FindControl("CheckBoxSelect")).Checked)
                {
                    var item = from u in db.tbl_users
                               where u.UserName == GridView1.Rows[i].Cells[1].Text
                               select u;
                    foreach (var z in item)
                    {
                        db.tbl_users.DeleteOnSubmit(z);
                        db.SubmitChanges();
                    }
                }
            }
            GridView1.DataBind();
            lbl_intro.Text = "All Selected Supporters Have Been Deleted!";
        }

        protected void lnkbtn_makeAdmin_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                if (((CheckBox)GridView1.Rows[i].Cells[0].FindControl("CheckBoxSelect")).Checked)
                {
                    var item = from u in db.tbl_users
                               where u.UserName == GridView1.Rows[i].Cells[1].Text
                               select u;
                    foreach (var z in item)
                    {
                        z.Type = 0;
                        db.SubmitChanges();
                    }
                }
            }
            GridView1.DataBind();
            lbl_intro.Text = "All Selected Supporters Have Been Made Admin!";
        }

        protected void lnkbtn_remove_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                if (((CheckBox)GridView1.Rows[i].Cells[0].FindControl("CheckBoxSelect")).Checked)
                {
                    var item = from u in db.tbl_users
                               where u.UserName == GridView1.Rows[i].Cells[1].Text
                               select u;
                    foreach (var z in item)
                    {
                        z.Type = 1;
                        db.SubmitChanges();
                    }
                }
            }
            GridView1.DataBind();
            lbl_intro.Text = "All Selected Supporterss Have Been Removed From Support Team!";
        }
    }
}