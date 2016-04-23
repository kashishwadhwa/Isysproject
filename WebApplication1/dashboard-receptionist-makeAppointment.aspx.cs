using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class dashboard_receptionist_makeAppointment : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            linkLogout.ServerClick += new EventHandler(fnSetLogout_Click);
            string dateres = DateTime.Now.ToString("yyyy-MM-dd");
            date.Attributes.Add("min", dateres);

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
                    string session_patient_id = Session["user_id"].ToString();


                    string ConnectString = "Data Source=isys631.database.windows.net;Initial Catalog=\"isys 631\";Integrated Security=False;User ID=isys631;Password=CollegeMain-345;Connect Timeout=60;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False;";
                    string appointment_id = null;
                    SqlConnection myConnection = new SqlConnection(ConnectString);
                    try
                    {
                        SqlDataReader myReader = null;
                        SqlCommand myCommand2 = new SqlCommand("select top 1 (appointment_id+1) as appointment_id from appointment order by appointment_id desc",
                                                                 myConnection);
                        myConnection.Open();
                        myReader = myCommand2.ExecuteReader();
                        while (myReader.Read())
                        {
                            appointment_id = (myReader["appointment_id"].ToString());
                        }
                        myConnection.Close();
                        Appointment.Attributes.Add("value", appointment_id);

                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.ToString());
                    }



           

                    string QueryString = "select concat(dentist_first_name,' ',dentist_last_name) as dentist_name, dentist_id from dentist";


                    SqlDataAdapter myCommand = new SqlDataAdapter(QueryString, myConnection);
                    DataSet ds = new DataSet();
                    myCommand.Fill(ds, "Dentists");

                    doctor.DataSource = ds;
                    doctor.DataTextField = "dentist_name";
                    doctor.DataValueField = "dentist_id";
                    doctor.DataBind();

                    QueryString = "select concat(patient_first_name,' ',patient_last_name) as patient_name, patient_id from patient where account_id=(select account_id from patient where patient_id=" + session_patient_id + ")";


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
                string Appointment_ID = Appointment.Value;
                string Patient_ID = pat_id.Value;
                string Dentist_ID = doctor.Value;
                string Appointment_Date = date.Value;
                string Appointment_Time = time.Value;


                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("INSERT INTO appointment ( Appointment_ID, Dentist_ID, Patient_ID, Appointment_Date,Appointment_Time) VALUES ( @Appointment_ID, @Dentist_ID, @Patient_ID, @Appointment_Date,@Appointment_Time )");
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = connection;
                    cmd.Parameters.AddWithValue("@Appointment_ID", Appointment_ID);
                    cmd.Parameters.AddWithValue("@Dentist_ID", Dentist_ID);
                    cmd.Parameters.AddWithValue("@Patient_ID", Patient_ID);
                    cmd.Parameters.AddWithValue("@Appointment_Date", Appointment_Date);
                    cmd.Parameters.AddWithValue("@Appointment_Time", Appointment_Time);

                    connection.Open();
                    cmd.ExecuteNonQuery();
                }

                Response.Redirect("dashboard.aspx?message=appointment created");





            }
            catch (Exception ex)
            {
                Exception E = ex;
                lbl_warning.Visible = true;
                if (E.Message== "The INSERT statement conflicted with the FOREIGN KEY constraint \"FK_APPOINTMENT_PATIENT\". The conflict occurred in database \"isys 631\", table \"dbo.patient\", column 'Patient_ID'.\r\nThe statement has been terminated.")
                lbl_warning.Text = "check patient id";
            }
        }
    }
}