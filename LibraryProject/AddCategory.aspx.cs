using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryProject
{
    public partial class AddCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        GenelDataContext db = new GenelDataContext();
        protected void btn_addCategory_Click(object sender, EventArgs e)
        {
            if (TextBoxCategoryName.Text == "" || TextBoxCategoryName.Text.Length > 20)
            {
                lbl_intro.ForeColor = Color.Red;
                lbl_intro.Text = "Please Enter The Category Name That Length is Shorter Than 20!";
                return;
            }

            var item = from u in db.tbl_Categories
                       where u.CategoryName == TextBoxCategoryName.Text
                       select u;
            foreach (var z in item)
            {
                lbl_intro.ForeColor = Color.Red;
                lbl_intro.Text = TextBoxCategoryName.Text+" Has Been Added Allready!";
                return;
            }

           
            tbl_Category a = new tbl_Category();
            a.CategoryName = TextBoxCategoryName.Text;

            db.tbl_Categories.InsertOnSubmit(a);
            db.SubmitChanges();
            lbl_intro.ForeColor = Color.Green;
            lbl_intro.Text = TextBoxCategoryName.Text+" Has Added Successfuly!";
            DropDownList1.DataBind();
            
        }

     
        protected void btn_Update_Click(object sender, EventArgs e)
        {
            DropDownList1.Enabled = false;
            btn_delete.Enabled = false;
            btn_Update.Enabled = false;
            btn_addCategory.Enabled = false;
            TextBoxCategoryName.Enabled = false;
            TextBoxEdit.Visible = true;
            btn_finish.Visible = true;

            var item = from c in db.tbl_Categories
                       where c.CategoryId == int.Parse(DropDownList1.SelectedValue)
                       select c;
            foreach (var z in item)
                TextBoxEdit.Text = z.CategoryName;
        }

        protected void btn_finish_Click(object sender, EventArgs e)
        {
            if (TextBoxEdit.Text == "" || TextBoxEdit.Text.Length > 20)
            {
                lbl_intro0.ForeColor = Color.Red;
                lbl_intro0.Text = "Please Enter The Category Name That Length is Shorter Than 20!";
                return;
            }

            var item = from u in db.tbl_Categories
                       where u.CategoryName == TextBoxCategoryName.Text
                       select u;
            foreach (var z in item)
            {
                lbl_intro0.ForeColor = Color.Red;
                lbl_intro0.Text = TextBoxEdit.Text + " Has Been Added Allready!";
                return;
            }

            item = from c in db.tbl_Categories
                       where c.CategoryId == int.Parse(DropDownList1.SelectedValue)
                       select c;
            foreach (var z in item)
            {
                z.CategoryName = TextBoxEdit.Text;
                db.SubmitChanges();
                lbl_intro0.ForeColor = Color.Green;
                lbl_intro0.Text = TextBoxEdit.Text + " Has Editted Successfuly!";

                DropDownList1.Enabled = true;
                btn_delete.Enabled = true;
                btn_Update.Enabled = true;
                btn_addCategory.Enabled = true;
                TextBoxCategoryName.Enabled = true;
                TextBoxEdit.Visible = false;
                btn_finish.Visible = false;
                TextBoxEdit.Text = "";
                DropDownList1.DataBind();

            }
        }

        protected void btn_delete_Click(object sender, EventArgs e)
        {
            var item = from b in db.tbl_Books
                       where b.CategoryID == int.Parse(DropDownList1.SelectedValue)
                       select b;
            foreach (var z in item)
            {
                lbl_intro0.ForeColor = Color.Red;
                lbl_intro0.Text = " You cannot delete this category, Because There are books in this category!";
                return;
            }

            var item1=from c in db.tbl_Categories
                     where c.CategoryId == int.Parse(DropDownList1.SelectedValue)
                     select c;
            foreach (var z in item1)
            {
                string x = z.CategoryName;
                db.tbl_Categories.DeleteOnSubmit(z);
                db.SubmitChanges();
                DropDownList1.DataBind();

                lbl_intro0.ForeColor = Color.Green;
                lbl_intro0.Text = x + " Has Deleted Successfuly!";
            }
            
        }
    }
}