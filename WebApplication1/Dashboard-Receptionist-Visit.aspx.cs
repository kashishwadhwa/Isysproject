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
    public partial class Dashboard_Receptionist_Visit : System.Web.UI.Page
    {
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {



            GridView1.PageIndex = e.NewPageIndex;
            bindview(); //bindgridview will get the data source and bind it again
        }
        protected void Page_Load(object sender, EventArgs e)
        {

            linkLogout.ServerClick += new EventHandler(fnSetLogout_Click);


            if (Session["email"] == null)
            {
                Response.Redirect("WebForm4.aspx");
            }
            else
            {


                string ConnectString = "Data Source=isys631.database.windows.net;Initial Catalog=\"isys 631\";Integrated Security=False;User ID=isys631;Password=CollegeMain-345;Connect Timeout=60;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False;";
                string visit_id = null;
                SqlConnection myConnection = new SqlConnection(ConnectString);

                SqlDataReader myReader = null;
                SqlCommand myCommand2 = new SqlCommand("select top 1 (visit_id+1) as visit_id from visit order by visit_id desc",
                                                         myConnection);
                myConnection.Open();
                myReader = myCommand2.ExecuteReader();
                while (myReader.Read())
                {
                    visit_id = (myReader["visit_id"].ToString());
                }
                myConnection.Close();
                Visit.Attributes.Add("value", visit_id);
                if (!IsPostBack)
                {
                    


                    try
                    {


                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.ToString());
                    }



                    bindview();

                    string QueryString = "select concat(dentist_first_name,' ',dentist_last_name) as dentist_name, dentist_id from dentist";


                    SqlDataAdapter myCommand = new SqlDataAdapter(QueryString, myConnection);
                    DataSet ds = new DataSet();
                    myCommand.Fill(ds, "Dentists");

                    doctor.DataSource = ds;
                    doctor.DataTextField = "dentist_name";
                    doctor.DataValueField = "dentist_id";
                    doctor.DataBind();

                   

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


        private void bindview()
        {
            // SESSION STRING
            string session_patient_id = "1";

            string connectionString = "Data Source=isys631.database.windows.net;Initial Catalog=\"isys 631\";Integrated Security=False;User ID=isys631;Password=CollegeMain-345;Connect Timeout=60;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False;";
            string sql = "select appointment_id,concat(Patient_First_Name,' ',Patient_last_Name) as [Patient Name],concat(dentist_First_Name,' ',dentist_last_Name) as [Dentist Name] ,cast(appointment_date as varchar(10)) as appointment_date, appointment_time  from dentist d, patient p, appointment a where d.dentist_id = a.dentist_id and p.patient_id = a.patient_id and p.patient_id=" + session_patient_id + " and a.appointment_date>=getdate()";
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
                GridView1.HeaderRow.Cells[4].Attributes["data-hide"] = "phone";
                //Adds THEAD and TBODY to GridView.
                GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;

            }


        }



        protected void Buttonbook_Click_book(object sender, EventArgs e)
        {
            string connectionString = "Data Source=isys631.database.windows.net;Initial Catalog=\"isys 631\";Integrated Security=False;User ID=isys631;Password=CollegeMain-345;Connect Timeout=60;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False;";

            try
            {
                string Appointment_ID = Visit.Value;
                string Dentist_ID = doctor.Value;
                string email = emailId.Value;
                string visit_Date = date.Value;
                string visit_time = time.Value;


                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("INSERT INTO visit ( visit_id, Dentist_ID, Patient_ID, visit_Date,visit_Time) VALUES ( @visit_ID, @Dentist_ID, (select user_id from users where email=@email), @visit_Date, @visit_Time )");
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = connection;
                    cmd.Parameters.AddWithValue("@visit_ID", Appointment_ID);
                    cmd.Parameters.AddWithValue("@Dentist_ID", Dentist_ID);
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.Parameters.AddWithValue("@visit_Date", visit_Date);
                    cmd.Parameters.AddWithValue("@visit_Time", visit_time);

                    connection.Open();
                    cmd.ExecuteNonQuery();
                }

                //Response.Redirect("dashboard-patient.aspx");





            }
            catch (Exception ex)
            {
                Exception E = ex;
            }
        }


        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                System.Data.DataRowView drv = e.Row.DataItem as System.Data.DataRowView;
                e.Row.Attributes.Add("ondblclick", String.Format("window.location='default.aspx'"));
            }
        }


    }

}