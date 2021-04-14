using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Text;


/// <summary>
/// Summary description for ADO
/// </summary>
public class ADONew
{
	public ADONew()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    private string ConStr
    {
        get
        {
            string constr = ConfigurationSettings.AppSettings["ConnectionString"].ToString();
            return constr;
        }
    }
    public SqlConnection GetCon
    {
        get { return new SqlConnection(ConStr); }
    }
    public int ExecuteDML(string sql)
    {
        int no_of_affected_rows = -1;

        SqlConnection con = GetCon;
        SqlCommand cmd = new SqlCommand();
        try
        {

            cmd.Connection = con;
            cmd.CommandText = sql;
            con.Open();
            no_of_affected_rows = cmd.ExecuteNonQuery();
        }
        catch (Exception err)
        {
            throw err;
        }
        finally
        {
            con.Close();
            con.Dispose();
            cmd.Dispose();
        }
        return no_of_affected_rows;
    }
    public string GetCurrentFinancialYear()
    {
        int CurrentYear = DateTime.Today.Year;
        int PreviousYear = DateTime.Today.Year - 1;
        int NextYear = DateTime.Today.Year + 1;
        string PreYear = PreviousYear.ToString();
        string NexYear = NextYear.ToString();
        string CurYear = CurrentYear.ToString();
        string FinYear = null;
        string mnth = System.Configuration.ConfigurationManager.AppSettings["month"].ToString();
        int month = Convert.ToInt32(mnth);
        if (DateTime.Today.Month >= month)
            FinYear = CurYear + "-" + NexYear;
        else
            FinYear = PreYear + "-" + CurYear;
        return FinYear.Trim();
    }
    public int ExecuteDML_Parameters(string sql, params SqlParameter[] parameters)
    {
        int no_of_affected_rows = -1;

        SqlConnection con = GetCon;
        SqlCommand cmd = new SqlCommand();
        try
        {
            cmd.Connection = con;
            cmd.CommandText = sql;
            cmd.Parameters.AddRange(parameters);
            con.Open();
            no_of_affected_rows = cmd.ExecuteNonQuery();
        }
        catch (Exception err)
        {
            throw err;
        }
        finally
        {
            cmd.Parameters.Clear();
            con.Close();
            con.Dispose();
            cmd.Dispose();

        }
        return no_of_affected_rows;

    }
    public bool ExecuteDML_InTRansaction(params string[] sqls)
    {
        bool is_success = false;

        int no_of_affected_rows = -1;

        SqlConnection con = GetCon;
        SqlCommand cmd = new SqlCommand();
        SqlTransaction T = null;
        try
        {

            cmd.Connection = con;
            con.Open();
            T = con.BeginTransaction();
            cmd.Transaction = T;

            foreach (var sql in sqls)
            {
                cmd.CommandText = sql;
                no_of_affected_rows = cmd.ExecuteNonQuery();
                if (no_of_affected_rows <= 0)
                {
                    throw new NullReferenceException();

                }
            }
            T.Commit();
            is_success = true;


        }
        catch (Exception err)
        {
            T.Rollback();
        }
        finally
        {
            con.Close();
            con.Dispose();
            cmd.Dispose();
            if (T != null)
            {
                T.Dispose();

            }

        }
        return is_success;

    }
    public static string MMDDYYYYstr(string dd)
    {
        string rstring = "";
        try
        {
            string[] dt = dd.Split('/');
            if (dt.Length == 3)
            {
                rstring = dt[1] + "/" + dt[0] + "/" + dt[2];
            }
            return rstring;
        }
        catch (Exception ex)
        {
            return rstring;
        }
    }
    public bool ExecuteDML_InMultiSQL(params string[] sqls)
    {
        bool is_success = false;

        int no_of_affected_rows = -1;

        SqlConnection con = GetCon;
        SqlCommand cmd = new SqlCommand();
        //SqlTransaction T = null;
        try
        {

            cmd.Connection = con;
            con.Open();
          //  T = con.BeginTransaction();
           // cmd.Transaction = T;

            foreach (var sql in sqls)
            {
                cmd.CommandText = sql;
                no_of_affected_rows = cmd.ExecuteNonQuery();
                //if (no_of_affected_rows <= 0)
                //{
                //    throw new NullReferenceException();

                //}
            }
            //T.Commit();
            is_success = true;


        }
        catch (Exception err)
        {
            //T.Rollback();
        }
        finally
        {
            con.Close();
            con.Dispose();
            cmd.Dispose();
            //if (T != null)
            //{
            //    T.Dispose();

            //}

        }
        return is_success;

    }
    public SqlDataReader ExecuteReader(string sql)
    {
        SqlDataReader dr = null;
        SqlConnection con = GetCon;
        SqlCommand cmd = new SqlCommand();
        try
        {

            cmd.Connection = con;
            cmd.CommandText = sql;
            con.Open();
            dr = cmd.ExecuteReader();
        }
        catch (Exception err)
        {
            throw err;
        }
        finally
        {
            con.Close();
            con.Dispose();
            cmd.Dispose();
        }
        return dr;
    }
    public SqlDataReader ExecuteReader(string sql, params SqlParameter[] parameters)
    {
        SqlDataReader dr = null;
        SqlConnection con = GetCon;
        SqlCommand cmd = new SqlCommand();
        try
        {

            cmd.Connection = con;
            cmd.CommandText = sql;
            cmd.Parameters.AddRange(parameters);
            con.Open();
            dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        }
        catch (Exception err)
        {
            throw err;
        }
        finally
        {
            //cmd.Parameters.Clear();
            con.Close();
            con.Dispose();
            cmd.Dispose();

        }
        return dr;

    }
    public SqlDataReader ExecuteReader(string sql, CommandType cmdtype, params SqlParameter[] parameters)
    {
        SqlDataReader dr = null;
        SqlConnection con = GetCon;
        SqlCommand cmd = new SqlCommand();

        try
        {

            cmd.Connection = con;
            cmd.CommandText = sql;
            cmd.CommandType = cmdtype;
            cmd.Parameters.AddRange(parameters);

            con.Open();

            dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        }
        catch (Exception err)
        {
            throw err;
        }
        finally
        {
            //cmd.Parameters.Clear();
            con.Close();
            con.Dispose();
            cmd.Dispose();

        }
        return dr;

    }
    public object ExecuteScalor(string sql)
    {
        object result = null;
        SqlConnection con = GetCon;
        SqlCommand cmd = new SqlCommand();
        try
        {

            cmd.Connection = con;
            cmd.CommandText = sql;
            con.Open();
            result = cmd.ExecuteScalar();
        }
        catch (Exception err)
        {
            throw err;
        }
        finally
        {
            con.Close();
            con.Dispose();
            cmd.Dispose();

        }
        return result;

    }
    public DataTable GetDataByDataTable_Parameter(string sql, params SqlParameter[] parameters)
    {
        SqlConnection con = GetCon;
        SqlCommand cmd = new SqlCommand();
        DataTable dt = new DataTable();
        cmd.Connection = con;
        cmd.CommandText = sql;
        cmd.Parameters.AddRange(parameters);
        try
        {
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            
        }
        catch (Exception err)
        {
            throw err;
        }
       
         finally
        {
            con.Close();
            con.Dispose();
            cmd.Dispose();

        }
        return dt;
        
    }
    public DataSet GetDataSet_Parameter(string sql, params SqlParameter[] parameters)
    {
        SqlConnection con = GetCon;
        SqlCommand cmd = new SqlCommand();
        DataSet ds = new DataSet();
        cmd.Connection = con;
        cmd.CommandText = sql;
        cmd.Parameters.AddRange(parameters);
        try
        {
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            da.Fill(ds);
        }
        catch (Exception err)
        {
            throw err;
        }
        finally
        {
            con.Close();
            con.Dispose();
            cmd.Dispose();
        }
        return ds;
    }
   
    public DataTable GetDataByDataTable(string sql)
    {
        DataTable dt = new DataTable();
        SqlConnection con = GetCon;
        try
        {
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(sql, ConStr);
            da.Fill(dt);
        }
        catch (Exception err)
        {
            throw err;
        }
        finally
        {
            con.Close();
            con.Dispose();
           // cmd.Dispose();
        }

        return dt;
    }
    public void UpdateDbWIthDatatable(string sql, DataTable dt)
    {
        SqlDataAdapter da = new SqlDataAdapter(sql, ConStr);
        SqlCommandBuilder cb = new SqlCommandBuilder(da);
        da.Update(dt);
    }

    /// <summary>
    /// Function is used to Encrypt the password
    /// </summary>
    /// <param name="password"></param>
    /// <returns></returns>
    
    public string Encryptdata(string password)
    {
        string strmsg = string.Empty;
        byte[] encode = new byte[password.Length];
        encode = Encoding.UTF8.GetBytes(password);
        strmsg = Convert.ToBase64String(encode);
        return strmsg;
    }

    /// <summary>
    /// Function is used to Decrypt the password
    /// </summary>
    /// <param name="encryptpwd"></param>
    /// <returns></returns>
    
    public string Decryptdata(string encryptpwd)
    {
        string decryptpwd = string.Empty;
        UTF8Encoding encodepwd = new UTF8Encoding();
        Decoder Decode = encodepwd.GetDecoder();
        byte[] todecode_byte = Convert.FromBase64String(encryptpwd);
        int charCount = Decode.GetCharCount(todecode_byte, 0, todecode_byte.Length);
        char[] decoded_char = new char[charCount];
        Decode.GetChars(todecode_byte, 0, todecode_byte.Length, decoded_char, 0);
        decryptpwd = new String(decoded_char);
        return decryptpwd;
    }    
}
