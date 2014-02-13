using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryProject
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        GenelDataContext db = new GenelDataContext();

        protected void btn_Register_Click(object sender, EventArgs e)
        {
            if (TextBoxEmail.Text=="" || TextBoxName.Text=="" || TextBoxPassagain.Text=="" || TextBoxPassword.Text==""
                || TextBoxSurname.Text=="" || TextBoxUsername.Text=="" || Calendar1.SelectedDate==null)
            {
                lbl_intro.Text = "Please fill empty places!";
                return;
            }

            if (isThereUsername())
            {
                lbl_intro.Text = "This username has already registered!";
                return;
            }

            if (TextBoxUsername.Text.Length<8 || TextBoxUsername.Text.Length>15)
            {
                lbl_intro.Text = "The length of password should be 8-15 !";
                return;
            }

            if (!isCorrectPassword())
            {
                return;
            }

            if (TextBoxEmail.Text.IndexOf('@')==-1 || TextBoxEmail.Text.IndexOf('.',TextBoxEmail.Text.IndexOf('@'))==-1)
            {
                lbl_intro.Text = "Please enter correct E-mail adress!";
                return;
            }

            if (Calendar1.SelectedDate.Year==1)
            {
                lbl_intro.Text = "Please choose your birthday!";
                return;
            }

            tbl_user newUser = new tbl_user();

            newUser.UserName = TextBoxUsername.Text;
            newUser.Password = TextBoxPassword.Text;
            newUser.Name = TextBoxName.Text;
            newUser.Surname = TextBoxSurname.Text;
            newUser.Email = TextBoxEmail.Text;
            newUser.Birthday = Calendar1.SelectedDate;
            newUser.Type = 1;

            db.tbl_users.InsertOnSubmit(newUser);
            db.SubmitChanges();

            Response.Redirect("Login.aspx");
        }

        private bool isCorrectPassword()
        {
            string pass = TextBoxPassword.Text;
            string digit = "0123456789";
            int x;
            if (pass!=TextBoxPassagain.Text)
            {
                lbl_intro.Text = "Passwords are not same. Please write again!";
                return false;
            }
            if (int.TryParse(pass,out x))
            {
                lbl_intro.Text = "Password should include digits(0-9) and characters(a-z), and The length of password should be 8-15 !";
                return false;
            }
            if (pass.Length<8 || pass.Length>15)
            {
                lbl_intro.Text = "Password should include digits(0-9) and characters(a-z), and The length of password should be 8-15 !";
                return false;
            }
            for (int i = 0; i < pass.Length; i++)
            {
                for (int j = 0; j < 10; j++)
                {
                    if (pass[i]==digit[j])
                    {
                        return true;
                    }
                }
            }
            lbl_intro.Text = "Password should include digits(0-9) and characters(a-z), and The length of password should be 8-15 !";
            return false;
        }

        private bool isThereUsername()
        {
            var item = from u in db.tbl_users
                       where u.UserName == TextBoxUsername.Text
                       select u;
            foreach (var z in item)
            {
                return true;
            }
            return false;
        }
    }
}