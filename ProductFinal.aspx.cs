using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DataAccessLayer;
using System.IO;

public partial class ProductFinal : System.Web.UI.Page
{
    ADONew objADO = new ADONew();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindproduct();
        }

    }
    void bindproduct()
    {
        try
        {
            string sql = "select Id,ProductName from ProductRegister where flag='1' order by ProductName";
            DataTable dt = new DataTable();
            dt = objADO.GetDataByDataTable(sql);
            if (dt != null && dt.Rows.Count > 0)
            {
                ddlproduct.DataSource = dt;
                ddlproduct.DataTextField = "ProductName";
                ddlproduct.DataValueField = "Id";
                ddlproduct.DataBind();
                ddlproduct.Items.Insert(0, "--Select Product Name --");
            }
            else
            {

            }
        }
        catch (Exception ex)
        {

        }
    }
    void Search()
    {
        DataSet dt = new DataSet();
        SqlParameter p_e1 = new SqlParameter("@ProductID", ddlproduct.SelectedValue);
        SqlParameter p_e2 = new SqlParameter("@Flag", "3");
        dt = clsDataAccess.ExecuteDataset(CommandType.StoredProcedure, "Sp_Productforuser", p_e1, p_e2);
        if (dt.Tables[0] != null && dt.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow dr in dt.Tables[0].Rows)
            {
                grdprodetails.DataSource = dt.Tables[0];
                grdprodetails.DataBind();
                grdprodetails.Visible = true;
            }
        }
        else
        {
            lblsucess.Text = "Data Not Found";
            lblsucess.ForeColor = System.Drawing.Color.Red;
            lblsucess.Visible = true;
            lblsucess.Focus();
            grdprodetails.Visible = false;
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Search();
    }
}