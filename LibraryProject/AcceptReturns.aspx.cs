using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryProject
{
    public partial class AcceptReturns : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

       

        

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            GenelDataContext db = new GenelDataContext();
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                if (((CheckBox)GridView1.Rows[i].Cells[0].FindControl("CheckBox_Select")).Checked)
                {
                    var item = from o in db.tbl_orders
                               where o.OrderID == int.Parse(GridView1.Rows[i].Cells[1].Text)
                               select o;
                    foreach (var z in item)
                    {
                        z.State = "Done";
                        z.FinishDate = DateTime.Now;
                        db.SubmitChanges();
                        GridView1.DataBind();
                    }
                }
                    

            }
        }
    }
}