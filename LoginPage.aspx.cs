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

public partial class LoginPage : System.Web.UI.Page
{
    ADONew objado = new ADONew();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        SqlParameter p_e1 = new SqlParameter("@Userid", UserId.Text);
        SqlParameter p_e2 = new SqlParameter("@Password", Password.Text);
        string str = "select * from RegisterPage where Email=@Userid and Password=@Password and flag='1'";
        dt = objado.GetDataByDataTable_Parameter(str, p_e1, p_e2);
        if (dt.Rows.Count > 0)
        {
            Session["LoginUserName"] = dt.Rows[0]["Name"].ToString();
            string name = dt.Rows[0]["Name"].ToString();
            if (name == "admin")
            {
                Response.Redirect("Dasboardforadmin.aspx");
            }
            else
            {
                Response.Redirect("HomepageFinal.aspx");
            }
            
        }
        else
        {
            lblworngpass.Text = "Password or Email Is Incorrect.";
            lblworngpass.Visible = true;
            lblworngpass.Focus();
        }

    }
}