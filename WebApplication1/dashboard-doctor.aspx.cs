using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class dashboard_doctor : System.Web.UI.Page
    {
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            bindview(); //bindgridview will get the data source and bind it again
        }
        protected void Page_Load(object sender, EventArgs e)
        {

            linkLogout_responsive.ServerClick += new EventHandler(fnSetLogout_Click);
            linkLogout.ServerClick += new EventHandler(fnSetLogout_Click);


            if (Session["email"] == null)
            {
                Response.Redirect("WebForm4.aspx");
            }
            else
            {

                string connectionString = "Data Source=isys631.database.windows.net;Initial Catalog=\"isys 631\";Integrated Security=False;User ID=isys631;Password=CollegeMain-345;Connect Timeout=60;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False;";
                SqlConnection myConnection = new SqlConnection(connectionString);

                SqlDataReader myReader = null;
                SqlCommand myCommand = new SqlCommand("select dentist_first_name from dentist where dentist_id=" + Session["user_id"].ToString(), myConnection);
                myConnection.Open();
                myReader = myCommand.ExecuteReader();
                string user_name = null;
                while (myReader.Read())
                {
                    user_name = (myReader["dentist_first_name"].ToString());

                }
                myConnection.Close();
                lbl_doctorName.Text = " " + user_name + " !";


                if (!IsPostBack)
                    bindview();

            }
        }




        [WebMethod(EnableSession = true)]

        public static string GetChart(string country)
        {

            string constr = "Server=isys631.database.windows.net;Database=\"isys 631\";User Id=isys631;Password=CollegeMain-345;";
            using (SqlConnection con = new SqlConnection(constr))
            {
                string dentist_id = HttpContext.Current.Session["user_id"].ToString();

                string query = string.Format("select CASE WHEN DATEPART(month,appointment_date)=1 THEN 'Jan' WHEN DATEPART(month,appointment_date)=2 THEN 'feb' WHEN DATEPART(month,appointment_date)=3 THEN 'Mar' WHEN DATEPART(month,appointment_date)=4 THEN 'Apr' WHEN DATEPART(month,appointment_date)=5 THEN 'May' WHEN DATEPART(month,appointment_date)=6 THEN 'Jun' WHEN DATEPART(month,appointment_date)=7 THEN 'Jul' WHEN DATEPART(month,appointment_date)=8 THEN 'Aug' WHEN DATEPART(month,appointment_date)=9 THEN 'Sep' WHEN DATEPART(month,appointment_date)=10 THEN 'Oct' WHEN DATEPART(month,appointment_date)=11 THEN 'Nov' WHEN DATEPART(month,appointment_date)=12 THEN 'Dec' END  as appointment_month ,count(appointment_id) as cnt_appointment  from appointment where DATEPART(year,appointment_date)={0} and dentist_id=" + dentist_id + " group by DATEPART(month,appointment_date) order by DATEPART(month,appointment_date)", country);
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



        protected void fnSetLogout_Click(object sender, EventArgs e)
        {
            Session["email"] = null;
            Session["user_id"] = null;
            Session["user_type"] = null;
            Response.Redirect("default.aspx");
        }




        protected void Search(object sender, EventArgs e)
        {
            this.bindview();
        }

        private void bindview()
        {
            //Session variable
            int session_dentist_id = 1;

            string connectionString = "Data Source=isys631.database.windows.net;Initial Catalog=\"isys 631\";Integrated Security=False;User ID=isys631;Password=CollegeMain-345;Connect Timeout=60;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False;";
            string sql = "select appointment_id,concat(Patient_First_Name,' ',Patient_last_Name) as [Patient Name],concat(dentist_First_Name,' ',dentist_last_Name) as [Dentist Name] ,cast(appointment_date as varchar(10)) as appointment_date, appointment_time  from dentist d, patient p, appointment a where d.dentist_id = a.dentist_id and p.patient_id = a.patient_id and a.dentist_id=" + session_dentist_id+"order by a.appointment_date desc";
            //string sql = "select appointment_id,concat(Patient_First_Name,' ',Patient_last_Name) as [Patient Name],concat(dentist_First_Name,' ',dentist_last_Name) as [Dentist Name] ,cast(appointment_date as varchar(10)) as appointment_date, appointment_time  from dentist d, patient p, appointment a where d.dentist_id = a.dentist_id and p.patient_id = a.patient_id and a.appointment_date between " + from_date.Value + " and " + to_date.Value + " and a.dentist_id=" + session_dentist_id;

            SqlConnection connection = new SqlConnection(connectionString);
            SqlDataAdapter dataadapter = new SqlDataAdapter(sql, connection);
            DataSet ds = new DataSet();
            connection.Open();
            dataadapter.Fill(ds, "Auppointments_table");
            connection.Close();
            GridView1.DataSource = ds;
            GridView1.DataBind();
            //GridView1.DataMember = "Auppointments_table";

            if (ds.Tables[0].Rows.Count != 0)
            {
                //Attribute to show the Plus Minus Button.
                GridView1.HeaderRow.Cells[1].Attributes["data-class"] = "expand";

                //Attribute to hide column in Phone.
                GridView1.HeaderRow.Cells[2].Attributes["data-hide"] = "phone";
                GridView1.HeaderRow.Cells[3].Attributes["data-hide"] = "phone";
             
                //Adds THEAD and TBODY to GridView.
                GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;

            }

        }
    }
}