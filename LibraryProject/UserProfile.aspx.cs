using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace LibraryProject
{
    public partial class UserProfile : System.Web.UI.Page
    {
        GenelDataContext db = new GenelDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var item = from u in db.tbl_users
                           where u.UserID == int.Parse(Session["userID"].ToString())
                           select u;
                foreach (var z in item)
                {
                    TextBoxUsername.Text = z.UserName;
                    TextBoxName.Text = z.Name;
                    TextBoxSurname.Text = z.Surname;
                    TextBoxEmail.Text = z.Email;
                    Calendar1.VisibleDate = z.Birthday;
                    Calendar1.SelectedDate = z.Birthday;
                } 
            }

        }


        protected void lnkbtn_changePassword_Click(object sender, EventArgs e)
        {
            lnkbtn_changePassword.Visible = false;

            lbl_passwordAgain.Visible = true;
            lbl_passwordOld.Visible = true;
            TextBoxPassagain.Visible = true;
            TextBoxPasswordOld.Visible = true;
            TextBoxPassword.Visible = true;
            btn_savePassword.Visible = true;
            lbl_introPass.ForeColor = Color.Red;
            lbl_introPass.Text = "";
        }

        protected void btn_savePassword_Click(object sender, EventArgs e)
        {
            var item = from u in db.tbl_users
                       where u.UserID == int.Parse(Session["userID"].ToString())
                       select u;

            foreach (var z in item)
            {
                if (TextBoxPasswordOld.Text!=z.Password)
                {
                    lbl_introPass.Text = "Please enter old password correctly!";
                    return;
                }
            }
            if (isCorrectPassword())
            {
                foreach (var z in item)
                {
                    z.Password = TextBoxPassword.Text;
                    db.SubmitChanges();
                }

                lnkbtn_changePassword.Visible = true;

                lbl_passwordAgain.Visible = false;
                lbl_passwordOld.Visible = false;
                TextBoxPassagain.Visible = false;
                TextBoxPasswordOld.Visible = false;
                TextBoxPassword.Visible = false;
                btn_savePassword.Visible = false;

                lbl_introPass.ForeColor = Color.Green;
                lbl_introPass.Text = "Your password has been changed successfully!";
            }
        }

        private bool isCorrectPassword()
        {
            string pass = TextBoxPassword.Text;
            string digit = "0123456789";
            int x;
            if (pass != TextBoxPassagain.Text)
            {
                lbl_introPass.Text = "Passwords are not same. Please write again!";
                return false;
            }
            if (int.TryParse(pass, out x))
            {
                lbl_introPass.Text = "Password should include digits(0-9) and characters(a-z), and The length of password should be 8-15 !";
                return false;
            }
            if (pass.Length < 8 || pass.Length > 15)
            {
                lbl_introPass.Text = "Password should include digits(0-9) and characters(a-z), and The length of password should be 8-15 !";
                return false;
            }
            for (int i = 0; i < pass.Length; i++)
            {
                for (int j = 0; j < 10; j++)
                {
                    if (pass[i] == digit[j])
                    {
                        return true;
                    }
                }
            }
            lbl_introPass.Text = "Password should include digits(0-9) and characters(a-z), and The length of password should be 8-15 !";
            return false;
        }

       

        protected void lnkbtn_edit_Click(object sender, EventArgs e)
        {
            TextBoxName.Enabled = true;
            TextBoxSurname.Enabled = true;
            TextBoxEmail.Enabled = true;
            Calendar1.Enabled = true;
            lnkbtn_edit.Visible = false;
            btn_Finish.Visible = true;
            lbl_intro.Text = "";
            lbl_intro.ForeColor = Color.Red;
        }

        protected void btn_Finish_Click(object sender, EventArgs e)
        {
            if (TextBoxEmail.Text == "" || TextBoxName.Text == "" ||   TextBoxSurname.Text == "" )
            {
                lbl_intro.Text = "Please fill empty places!";
                return;
            } 

            if (TextBoxEmail.Text.IndexOf('@') == -1 || TextBoxEmail.Text.IndexOf('.', TextBoxEmail.Text.IndexOf('@')) == -1)
            {
                lbl_intro.Text = "Please enter correct E-mail adress!";
                return;
            }

            if (Calendar1.SelectedDate.Year == 1)
            {
                lbl_intro.Text = "Please choose your birthday!";
                return;
            }

            var item = from u in db.tbl_users
                       where u.UserID == int.Parse(Session["userID"].ToString())
                       select u;
            foreach (var z in item)
            {
                z.Name = TextBoxName.Text;
                z.Surname = TextBoxSurname.Text;
                z.Email = TextBoxEmail.Text;
                z.Birthday = Calendar1.SelectedDate;
                db.SubmitChanges();
            }

            lbl_intro.ForeColor = Color.Green;
            lbl_intro.Text = "Your Informations Has Been Edited Successfully!";

            TextBoxName.Enabled = false;
            TextBoxSurname.Enabled = false;
            TextBoxEmail.Enabled = false;
            Calendar1.Enabled = false;
            lnkbtn_edit.Visible = true;
            btn_Finish.Visible = false;

            
        }
    }
}