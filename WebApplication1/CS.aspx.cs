using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.Web.Services;
using System.Data.SqlClient;
using System.Configuration;


public partial class CS : System.Web.UI.Page
{
[WebMethod]
public static string GetChart(string country)
{
        string constr = "Server=isys631.database.windows.net;Database=\"isys 631\";User Id=isys631;Password=CollegeMain-345;";
        using (SqlConnection con = new SqlConnection(constr))
    {
        string query = string.Format("select DATEPART(month,appointment_date) as appointment_month, count(appointment_id) as cnt_appointment  from appointment where DATEPART(year,appointment_date)={0} and DATEPART(month,appointment_date)<>9 group by DATEPART(month,appointment_date) order by 1", country);
        using (SqlCommand cmd = new SqlCommand())
        {
            cmd.CommandText = query;
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            con.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                StringBuilder sb = new StringBuilder();
                sb.Append("[");
                while (sdr.Read())
                {
                    sb.Append("{");
                    System.Threading.Thread.Sleep(50);
                    string color = String.Format("#{0:X6}", new Random().Next(0x1000000)); 
                    sb.Append(string.Format("text :'{0}', value:{1}, color: '{2}'", sdr[0], sdr[1], color));
                    sb.Append("},");
                }
                sb = sb.Remove(sb.Length - 1, 1);
                sb.Append("]");
                con.Close();
                return sb.ToString();
            }
        }
    }
}
}