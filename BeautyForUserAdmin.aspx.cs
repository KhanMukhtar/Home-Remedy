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

public partial class BeautyForUserAdmin : System.Web.UI.Page
{
    ADONew objADO = new ADONew();
    DataTable tempdt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindBtyName();
            BindGridData();
        }
    }

    void BindBtyName()
    {
        DataTable dt = new DataTable();
        string str = "select Id,BeautyName from BeautyRegister where Flag='1'";


        dt = objADO.GetDataByDataTable(str);
        if (dt.Rows.Count > 0 && dt != null)
        {
            ddlBeauty.DataSource = dt;
            ddlBeauty.DataTextField = "BeautyName";
            ddlBeauty.DataValueField = "Id";
            ddlBeauty.DataBind();
            ddlBeauty.Items.Insert(0, "--Select Beauty--");
        }
        else
        {
            ddlBeauty.Items.Clear();
            ddlBeauty.Items.Insert(0, "");
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

            SqlParameter p_e1 = new SqlParameter("@BeautyID", ddlBeauty.SelectedValue.Trim().ToString());
            SqlParameter p_e2 = new SqlParameter("@BeautyImage", imgbyte);
            SqlParameter p_e3 = new SqlParameter("@IngredientName", txtingname.Text.Trim().ToString());
            SqlParameter p_e4 = new SqlParameter("@Quantity", txtquntity.Text.Trim().ToString());
            SqlParameter p_e5 = new SqlParameter("@SDescription", txtdes.Text.Trim().ToString());
            SqlParameter p_e6 = new SqlParameter("@Flag", "1");
            int res = DataAccessLayer.clsDataAccess.ExecuteNonQuery(CommandType.StoredProcedure, "Sp_Beautyforuser", p_e1, p_e2, p_e3, p_e4, p_e5, p_e6);
            if (res > 0)
            {
                ddlBeauty.Items.Clear();
                txtingname.Text = "";
                txtquntity.Text = "";
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
        dt = DataAccessLayer.clsDataAccess.ExecuteDataTable(CommandType.StoredProcedure, "Sp_Beautyforuser", p_e1);
        if (dt != null && dt.Rows.Count > 0)
        {
            grdbty.DataSource = dt;
            grdbty.DataBind();
            grdbty.Visible = true;
        }
        else
        {
            grdbty.Visible = false;
        }
    }

    protected void grdbty_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdbty.PageIndex = e.NewPageIndex;
        BindGridData();
    }
    protected void grdbty_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        #region Delete method
        try
        {
            if (e.CommandName == "Delete")
            {
                string lblbtyId = null;
                Control ctrl = e.CommandSource as Control;
                if (ctrl != null)
                {
                    GridViewRow row = ctrl.Parent.NamingContainer as GridViewRow;
                    Label lbl_btyId = (Label)row.FindControl("lblbtyId");
                    lblbtyId = lbl_btyId.Text.ToString();
                }
                SqlParameter sp1 = new SqlParameter("@flag", "4");
                SqlParameter sp2 = new SqlParameter("@Id", lblbtyId);
                int res = clsDataAccess.ExecuteNonQuery(CommandType.StoredProcedure, "Sp_Beautyforuser", sp1, sp2);
                if (res > 0)
                {
                    lblsucess.Text = "Data Deleted Successfully.";
                    lblsucess.ForeColor = System.Drawing.Color.Red;
                    lblsucess.Visible = true;
                    lblsucess.Focus();
                    txtingname.Text = "";
                    txtquntity.Text = "";
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
    protected void grdbty_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void grdbty_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }
    protected void grdbty_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }
}