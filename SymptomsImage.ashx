<%@ WebHandler Language="C#" Class="SymptomsImage" %>

using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Data.SqlClient;

public class SymptomsImage : IHttpHandler {

    public void ProcessRequest(HttpContext context)
    {
        string dbcon = ConfigurationManager.ConnectionStrings[@"Data Source=DESKTOP-00EE45A;Initial Catalog=MuktharProjectDB;Integrated Security=True;"].ConnectionString;
        SqlConnection con = new SqlConnection(dbcon);
        con.Open();
        SqlCommand cmd = new SqlCommand("select SymptomsImage from Symptomsforuser where Id=@empid");
        cmd.Parameters.AddWithValue("@empid", context.Request.QueryString["id"].ToString());
        SqlDataReader dr = cmd.ExecuteReader();
        dr.Read();
        context.Response.BinaryWrite((byte[])dr["SymptomsImage"]);
        dr.Close();
        con.Close();
    }  
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}