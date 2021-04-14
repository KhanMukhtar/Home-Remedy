using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DataAccessLayer;
using System.Collections;

public partial class productforadmin : System.Web.UI.Page
{
    ADONew objADO = new ADONew();
    DataTable tempdt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindProName();
            BindGridData();
        }
    }

    void BindProName()
    {
        DataTable dt = new DataTable();
        string str = "select Id,ProductName from ProductRegister where Flag='1'";


        dt = objADO.GetDataByDataTable(str);
        if (dt.Rows.Count > 0 && dt != null)
        {
            ddlProduct.DataSource = dt;
            ddlProduct.DataTextField = "ProductName";
            ddlProduct.DataValueField = "Id";
            ddlProduct.DataBind();
            ddlProduct.Items.Insert(0, "--Select Product--");
        }
        else
        {
            ddlProduct.Items.Clear();
            ddlProduct.Items.Insert(0, "");
        }
    }

    void Save()
    {
        if (fileuploadEmpImage.HasFile)
        {
            int length = fileuploadEmpImage.PostedFile.ContentLength;
            byte[] imgbyte = new byte[length];
            HttpPostedFile img = fileuploadEmpImage.PostedFile;
            img.InputStream.Read(imgbyte, 0, length);

            SqlParameter p_e1 = new SqlParameter("@ProductID", ddlProduct.SelectedValue.Trim().ToString());
            SqlParameter p_e2 = new SqlParameter("@ProductImage", imgbyte);
            SqlParameter p_e3 = new SqlParameter("@ProductName", txtProductName.Text.Trim().ToString());
            SqlParameter p_e4 = new SqlParameter("@CompanyName", txtCompany.Text.Trim().ToString());
            SqlParameter p_e5 = new SqlParameter("@SDescription", txtdes.Text.Trim().ToString());
            SqlParameter p_e6 = new SqlParameter("@Shopdt", txtshop.Text.Trim().ToString());
            SqlParameter p_e7 = new SqlParameter("@Flag", "1");
            int res = DataAccessLayer.clsDataAccess.ExecuteNonQuery(CommandType.StoredProcedure, "Sp_Productforuser", p_e1, p_e2, p_e3, p_e4, p_e5, p_e6, p_e7);
            if (res > 0)
            {
                ddlProduct.Items.Clear();
                txtProductName.Text = "";
                txtCompany.Text = "";
                txtdes.Text = "";
                lblsucess.Text = "Data insert Successfully.";
                lblsucess.ForeColor = System.Drawing.Color.Green;
                lblsucess.Visible = true;
                lblsucess.Focus();
            }
            else
            {
                lblsucess.Text = "Data Not inserted .Please Try Again.";
                lblsucess.ForeColor = System.Drawing.Color.Red;
                lblsucess.Visible = true;
                lblsucess.Focus();
            }
        }
    }
    protected void SaveButton_Click(object sender, EventArgs e)
    {
        Save();
        BindGridData();
    }
    private void BindGridData()
    {
        DataTable dt = new DataTable();
        SqlParameter p_e1 = new SqlParameter("@flag", "2");
        dt = DataAccessLayer.clsDataAccess.ExecuteDataTable(CommandType.StoredProcedure, "Sp_Productforuser", p_e1);
        if (dt != null && dt.Rows.Count > 0)
        {
            grdpro.DataSource = dt;
            grdpro.DataBind();
            grdpro.Visible = true;
        }
        else
        {
            grdpro.Visible = false;
        }
    }

    protected void grdpro_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdpro.PageIndex = e.NewPageIndex;
        BindGridData();
    }
    protected void grdpro_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        #region Delete method
        try
        {
            if (e.CommandName == "Delete")
            {
                string lblproId = null;
                Control ctrl = e.CommandSource as Control;
                if (ctrl != null)
                {
                    GridViewRow row = ctrl.Parent.NamingContainer as GridViewRow;
                    Label lbl_lblproId = (Label)row.FindControl("lblproId");
                    lblproId = lbl_lblproId.Text.ToString();
                }
                SqlParameter sp1 = new SqlParameter("@flag", "4");
                SqlParameter sp2 = new SqlParameter("@Id", lblproId);
                int res = clsDataAccess.ExecuteNonQuery(CommandType.StoredProcedure, "Sp_Productforuser", sp1, sp2);
                if (res > 0)
                {
                    lblsucess.Text = "Data Deleted Successfully.";
                    lblsucess.ForeColor = System.Drawing.Color.Red;
                    lblsucess.Visible = true;
                    lblsucess.Focus();
                    txtProductName.Text = "";
                    txtCompany.Text = "";
                    txtdes.Text = "";
                    BindGridData();

                }
            }
        }
        catch (Exception ex)
        {
        }
        #endregion
    }
    protected void grdpro_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void grdpro_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }
    protected void grdpro_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }
}