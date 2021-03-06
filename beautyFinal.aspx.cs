﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DataAccessLayer;
using System.IO;

public partial class beautyFinal : System.Web.UI.Page
{
    ADONew objADO = new ADONew();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindbeauty();
        }
    }

    void bindbeauty()
    {
        try
        {
            string sql = "select Id,BeautyName from BeautyRegister where flag='1' order by BeautyName";
            DataTable dt = new DataTable();
            dt = objADO.GetDataByDataTable(sql);
            if (dt != null && dt.Rows.Count > 0)
            {
                ddlbeauty.DataSource = dt;
                ddlbeauty.DataTextField = "BeautyName";
                ddlbeauty.DataValueField = "Id";
                ddlbeauty.DataBind();
                ddlbeauty.Items.Insert(0, "--Select Beauty Name--");
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
        SqlParameter p_e1 = new SqlParameter("@BeautyID", ddlbeauty.SelectedValue);
        SqlParameter p_e2 = new SqlParameter("@Flag", "3");
        dt = clsDataAccess.ExecuteDataset(CommandType.StoredProcedure, "Sp_Beautyforuser", p_e1, p_e2);
        if (dt.Tables[0] != null && dt.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow dr in dt.Tables[0].Rows)
            {
                GridView2.DataSource = dt.Tables[0];
                GridView2.DataBind();
                GridView2.Visible = true;
            }
            foreach (DataRow dr in dt.Tables[1].Rows)
            {
                gvDetails.DataSource = dt.Tables[1];
                gvDetails.DataBind();
                gvDetails.Visible = true;
            }
            foreach (DataRow dr in dt.Tables[2].Rows)
            {
                GridView1.DataSource = dt.Tables[2];
                GridView1.DataBind();
                GridView1.Visible = true;
            }
        }
        else
        {
            lblsucess.Text = "Data Not Found";
            lblsucess.ForeColor = System.Drawing.Color.Red;
            lblsucess.Visible = true;
            lblsucess.Focus();
            GridView2.Visible = false;
            gvDetails.Visible = false;
            GridView1.Visible = false;
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Search();
    }
}