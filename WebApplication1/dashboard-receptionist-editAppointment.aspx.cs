using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class dashboard_receptionist_editAppointment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            linkLogout.ServerClick += new EventHandler(fnSetLogout_Click);


            if (Session["email"] == null)
            {
                Response.Redirect("WebForm4.aspx");
            }
            else
            {


                lbl_warning.Visible = false;
                if (!IsPostBack)
                {
                    // SESSION STRING
                    string appointment_id= Request.QueryString["appointment_id"];
                    string session_patient_id = Session["user_id"].ToString();
                    string dentist_id = null;
                    string patient_id = null;
                    DateTime date=DateTime.Now;
                    string time = null;

                    string ConnectString = "Data Source=isys631.database.windows.net;Initial Catalog=\"isys 631\";Integrated Security=False;User ID=isys631;Password=CollegeMain-345;Connect Timeout=60;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False;";
                    
                    SqlConnection myConnection = new SqlConnection(ConnectString);
                    try
                    {
                        SqlDataReader myReader = null;
                        SqlCommand myCommand2 = new SqlCommand("select top 1 * from appointment where appointment_id="+ appointment_id,
                                                                 myConnection);
                        myConnection.Open();
                        myReader = myCommand2.ExecuteReader();
                        while (myReader.Read())
                        {
                            appointment_id = (myReader["appointment_id"].ToString());
                            dentist_id = (myReader["dentist_id"].ToString());
                            patient_id = (myReader["patient_id"].ToString());
                            date = Convert.ToDateTime((myReader["appointment_date"].ToString()));
                            time = (myReader["appointment_time"].ToString());
                        }

                        myConnection.Close();
                        if (!IsPostBack)
                        {
                            string date_1 = date.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);
                            Appointment.Attributes.Add("value", appointment_id);
                            pat_id.Attributes.Add("value", patient_id);
                            txt_dentist_id.Attributes.Add("value", dentist_id);
                            txt_date.Attributes.Add("value", date_1);
                            txt_time.Attributes.Add("value", time);
                        }
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.ToString());
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





        protected void Buttonbook_Click_book(object sender, EventArgs e)
        {
            string connectionString = "Data Source=isys631.database.windows.net;Initial Catalog=\"isys 631\";Integrated Security=False;User ID=isys631;Password=CollegeMain-345;Connect Timeout=60;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False;";
            try
            {

                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd =
                        new SqlCommand("UPDATE appointment SET Dentist_ID=@dentist_id, patient_id=@patient_id, appointment_date=@appointment_date, appointment_time=@appointment_time" +
                            " WHERE appointment_id=@Id", conn))
                    {
                        cmd.Parameters.AddWithValue("@Id", Appointment.Value);
                        cmd.Parameters.AddWithValue("@dentist_id", txt_dentist_id.Value);
                        cmd.Parameters.AddWithValue("@patient_id", pat_id.Value);
                        cmd.Parameters.AddWithValue("@appointment_date", txt_date.Value);
                        cmd.Parameters.AddWithValue("@appointment_time", txt_time.Value);

                        int rows = cmd.ExecuteNonQuery();
                        Response.Redirect("dashboard-receptionist-appointmentSchedule.aspx?record_updated="+rows+" record updated");
                        //rows number of record got updated
                    }
                }
            }
            catch (SqlException ex)
            {
                //Log exception
                //Display Error message
            }
        }
    }
}