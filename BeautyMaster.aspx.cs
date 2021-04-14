using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DataAccessLayer;

public partial class BeautyMaster : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            showBankDetails();
        }
    }

    void save()
    {
        if (txtBeauty.Text == "")
        {
            txtBeauty.Text = "";
            lblsucess.Text = "Please Enter Symptoms.";
            lblsucess.ForeColor = System.Drawing.Color.Red;
            lblsucess.Visible = true;
            lblsucess.Focus();
        }
        else
        {
            SqlParameter p_e1 = new SqlParameter("@BeautyName", txtBeauty.Text.Trim().ToString());
            SqlParameter p_e2 = new SqlParameter("@Flag", "2");
            int res = DataAccessLayer.clsDataAccess.ExecuteNonQuery(CommandType.StoredProcedure, "Sp_BeautyRegister", p_e1, p_e2);
            if (res > 0)
            {
                txtBeauty.Text = "";
                lblsucess.Text = "Data Inserted Sucessfully.";
                lblsucess.ForeColor = System.Drawing.Color.Green;
                lblsucess.Visible = true;
                lblsucess.Focus();
            }
            else if (res == -1)
            {
                lblsucess.Text = "Symptoms Name Already Exits.";
                lblsucess.ForeColor = System.Drawing.Color.Red;
                lblsucess.Visible = true;
                lblsucess.Focus();
            }
            else
            {
                lblsucess.Text = "Data Not Inserted.";
                lblsucess.ForeColor = System.Drawing.Color.Red;
                lblsucess.Visible = true;
                lblsucess.Focus();
            }
        }
    }

    protected void SaveButton_Click(object sender, EventArgs e)
    {
        if (hdnField.Value == "")
        {
            save();
            showBankDetails();
        }
        else
        {
            updateBankDetails();
        }
    }


    void updateBankDetails()
    {
        try
        {
            DataTable dataTable = new DataTable();
            SqlParameter sp1 = new SqlParameter("@BeautyName", txtBeauty.Text.ToString());
            SqlParameter sp2 = new SqlParameter("@flag", "1");

            dataTable = clsDataAccess.ExecuteDataTable(CommandType.StoredProcedure, "Sp_BeautyRegister", sp1, sp2);
            if (dataTable.Rows.Count > 0 && dataTable != null)
            {
                lblsucess.Text = txtBeauty.Text + " already exists.";
            }
            else
            {
                SqlParameter sp3 = new SqlParameter("@id", hdnField.Value.ToString());
                SqlParameter sp4 = new SqlParameter("@flag", "5");
                int result = clsDataAccess.ExecuteNonQuery(CommandType.StoredProcedure, "Sp_BeautyRegister", sp1, sp3, sp4);
                if (result > 0)
                {
                    hdnField.Value = "";
                    showBankDetails();
                    lblsucess.Text = "Record Updated Successfully.";
                    lblsucess.ForeColor = System.Drawing.Color.Green;
                    lblsucess.Visible = true;
                    lblsucess.Focus();
                }
                else
                {
                    lblsucess.Text = "Record Not Updated.";
                    lblsucess.ForeColor = System.Drawing.Color.Red;
                    lblsucess.Visible = true;
                    lblsucess.Focus();
                }
            }
        }
        catch (Exception ex)
        {

        }
    }

    void showBankDetails()
    {
        try
        {
            DataTable dataTable = new DataTable();
            SqlParameter sp1 = new SqlParameter("@flag", "3");

            dataTable = clsDataAccess.ExecuteDataTable(CommandType.StoredProcedure, "Sp_BeautyRegister", sp1);
            if (dataTable.Rows.Count > 0 || dataTable != null)
            {
                gvBtyDetails.Visible = true;
                gvBtyDetails.DataSource = dataTable;
                gvBtyDetails.DataBind();
            }
            else
            {
                gvBtyDetails.Visible = false;
            }
        }
        catch (Exception ex)
        {

        }
    }
    protected void gvBtyDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvBtyDetails.PageIndex = e.NewPageIndex;
        showBankDetails();
    }
    protected void gvBtyDetails_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        #region Edit Method
        if (e.CommandName == "Edit")
        {
            string lblBankId = null;
            Control ctrl = e.CommandSource as Control;
            if (ctrl != null)
            {
                GridViewRow row = ctrl.Parent.NamingContainer as GridViewRow;
                Label lbl_BankId = (Label)row.FindControl("lblBankId");
                lblBankId = lbl_BankId.Text.ToString();
            }
            SqlParameter p1 = new SqlParameter("@flag", "4");
            SqlParameter p2 = new SqlParameter("@Id", lblBankId);
            DataTable dt = new DataTable();

            dt = clsDataAccess.ExecuteDataTable(CommandType.StoredProcedure, "Sp_BeautyRegister", p1, p2);
            if (dt.Rows.Count > 0)
            {
                txtBeauty.Text = dt.Rows[0]["BeautyName"].ToString();
                hdnField.Value = dt.Rows[0]["Id"].ToString();
            }
        }
        #endregion
        #region Delete method
        try
        {
            if (e.CommandName == "Delete")
            {
                string lblBankId = null;
                Control ctrl = e.CommandSource as Control;
                if (ctrl != null)
                {
                    GridViewRow row = ctrl.Parent.NamingContainer as GridViewRow;
                    Label lbl_BankId = (Label)row.FindControl("lblBankId");
                    lblBankId = lbl_BankId.Text.ToString();
                }
                SqlParameter sp1 = new SqlParameter("@flag", "6");
                SqlParameter sp2 = new SqlParameter("@Id", lblBankId);
                int res = clsDataAccess.ExecuteNonQuery(CommandType.StoredProcedure, "Sp_BeautyRegister", sp1, sp2);
                if (res > 0)
                {
                    showBankDetails();
                    txtBeauty.Text = "";
                    lblsucess.Text = "Data Deleted Successfully.";
                    lblsucess.ForeColor = System.Drawing.Color.Red;
                    lblsucess.Visible = true;
                    lblsucess.Focus();

                }
            }
        }
        catch (Exception ex)
        {
        }
        #endregion
    }
    protected void gvBtyDetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void gvBtyDetails_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }
    protected void gvBtyDetails_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }
}