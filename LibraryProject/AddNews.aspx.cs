using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace LibraryProject
{
    public partial class AdminNews : System.Web.UI.Page
    {
        GenelDataContext db = new GenelDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox_title.Text.Length==0)
            {
                lbl_info.ForeColor = Color.Red;
                lbl_info.Text = "Please enter new title!";
                return;
            }
            else if (TextBox_content.Text.Length==0)
            {
                lbl_info.ForeColor = Color.Red;
                lbl_info.Text = "Please enter new content!";
                return;
            }

            tbl_New nw = new tbl_New();
            nw.Title = TextBox_title.Text;
            nw.NewContent = TextBox_content.Text;
            nw.Date = DateTime.Now;
            lbl_info.ForeColor = Color.Green;
            lbl_info.Text = "New added Successfully!";
            db.tbl_News.InsertOnSubmit(nw);
            db.SubmitChanges();
        }
    }
}