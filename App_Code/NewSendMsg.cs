using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Configuration;
using System.Net;
using System.IO;

/// <summary>
/// Summary description for SendMsg
/// </summary>
public class NewSendMsg
{
	public NewSendMsg()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public string SendMessageDetails(string mobile, string msg)
    {
        string strusername = ConfigurationSettings.AppSettings["smsusername"].ToString();
        string strpassword = ConfigurationSettings.AppSettings["smspassword"].ToString();
        string strsenderid = ConfigurationSettings.AppSettings["smssenderid"].ToString();
        string responseString = "";
        //Your authentication key
        //Multiple mobiles numbers seperated by comma
        string mobileNumber = mobile;
        //Sender ID,While using route4 sender id should be 6 characters long.
        //Your message to send, Add URL endcoding here.
        string message = HttpUtility.UrlEncode(msg);

        //Prepare you post parameters
        StringBuilder sbPostData = new StringBuilder();
        sbPostData.AppendFormat("username={0}", strusername);
        sbPostData.AppendFormat("&password={0}", strpassword);
        sbPostData.AppendFormat("&senderid={0}", strsenderid);
        sbPostData.AppendFormat("&to={0}", mobile);
        sbPostData.AppendFormat("&text={0}", message);
        sbPostData.AppendFormat("&route={0}", "Enterprise");
        sbPostData.AppendFormat("&type={0}", "text");
        //sbPostData.AppendFormat("&datetime={0}", String.Format("{0:u}", System.DateTime.Now));
        try
        {
            //Call Send SMS API
            string sendSMSUri = "http://sms.techbizbuzz.com/api/api_http.php";
            //Create HTTPWebrequest
            HttpWebRequest httpWReq = (HttpWebRequest)WebRequest.Create(sendSMSUri);
            //Prepare and Add URL Encoded data
            UTF8Encoding encoding = new UTF8Encoding();
            byte[] data = encoding.GetBytes(sbPostData.ToString());
            //Specify post method
            httpWReq.Method = "POST";
            httpWReq.ContentType = "application/x-www-form-urlencoded";
            httpWReq.ContentLength = data.Length;
            using (Stream stream = httpWReq.GetRequestStream())
            {
                stream.Write(data, 0, data.Length);
            }
            //Get the response
            HttpWebResponse response = (HttpWebResponse)httpWReq.GetResponse();
            StreamReader reader = new StreamReader(response.GetResponseStream());
            responseString = reader.ReadToEnd();

            //Close the response
            reader.Close();
            response.Close();
        }
        catch (SystemException ex)
        {
            responseString = ex.Message.ToString();
        }
        return responseString;
    }

}