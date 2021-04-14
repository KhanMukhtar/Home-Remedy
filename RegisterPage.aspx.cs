using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Data;
using System.Collections;
using System.Xml.Linq;

public partial class RegisterPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void SaveButton_Click(object sender, EventArgs e)
    {
        SqlParameter p_e1 = new SqlParameter("@Name", Name.Text.Trim().ToString());
        SqlParameter p_e2 = new SqlParameter("@Gender", SelectGender.Value.Trim().ToString());
        SqlParameter p_e3 = new SqlParameter("@Email", Email.Text.Trim().ToString());
        SqlParameter p_e4 = new SqlParameter("@Contact", Contact.Text.Trim().ToString());
        SqlParameter p_e5 = new SqlParameter("@Password", Password1.Text.Trim().ToString());
        int res = DataAccessLayer.clsDataAccess.ExecuteNonQuery(CommandType.StoredProcedure, "Sp_RegisterPage", p_e1, p_e2, p_e3, p_e4, p_e5);
        if (res > 0)
        {
            Name.Text = "";
            SelectGender.Value = "";
            Email.Text = "";
            Contact.Text = "";
            Password1.Text = "";
            Password2.Text = "";
            lblsucess.Text = "Registerion Successfully.Please Go Back.";
            lblsucess.ForeColor = System.Drawing.Color.Green;
            lblsucess.Visible = true;
            lblsucess.Focus();
        }
        else if (res == -1)
        {
            lblsucess.Text = "E-Mail Already Exits.";
            lblsucess.ForeColor = System.Drawing.Color.Red;
            lblsucess.Visible = true;
            lblsucess.Focus();
        }
        else
        {
            lblsucess.Text = "Registerion Not Done.Please Try Again.";
            lblsucess.ForeColor = System.Drawing.Color.Red;
            lblsucess.Visible = true;
            lblsucess.Focus();
        }
    }
    protected void Email_TextChanged(object sender, EventArgs e)
    {
    }
}