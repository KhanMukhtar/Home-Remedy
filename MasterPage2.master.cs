using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage2 : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["LoginUserName"] == null)
        {
            Response.Redirect("~/LoginPage.aspx");
        }
        if (!IsPostBack)
        {
            usrname.Text = Session["LoginUserName"].ToString();
        }
    }
}
