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
    public partial class User_Profile : System.Web.UI.Page
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


                String f_name = null;
                String m_name = null;
                String l_name = null;


                string abc = Request.QueryString["patient_id"];
                string patient_id = null;
                if (abc != null)
                {
                     patient_id = abc;
                }
                else
                {
                     patient_id = Session["user_id"].ToString();
                }
                


                String account_Id = null;
                
                String st = null;
                String cty = null;
                String stat = null;
                String zi = null;
                String phone = null;
                String DOB = null;
                String SSN = null;
                String uname = null;
                String pass = null;
                String allergy = null;

                string connectionString = "Data Source=isys631.database.windows.net;Initial Catalog=\"isys 631\";Integrated Security=False;User ID=isys631;Password=CollegeMain-345;Connect Timeout=60;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False;";
                SqlConnection myConnection = new SqlConnection(connectionString);

                SqlDataReader myReader = null;
                SqlCommand myCommand = new SqlCommand("select *,cast(Patient_DOB as varchar(12)) as dob_format from patient where Patient_ID='" + patient_id + "'", myConnection);
                myConnection.Open();
                myReader = myCommand.ExecuteReader();

                while (myReader.Read())
                {
                    account_Id = (myReader["Account_ID"].ToString());
                    f_name = (myReader["Patient_First_Name"].ToString());
                    l_name = (myReader["Patient_Last_Name"].ToString());
                    m_name = (myReader["Patient_Middle_Name"].ToString());
                    cty = (myReader["Patient_City"].ToString());
                    st = (myReader["Patient_Street"].ToString());
                    stat = (myReader["Patient_State"].ToString());
                    zi = (myReader["Patient_Zip"].ToString());
                    phone = (myReader["Patient_Phone_Primary"].ToString());
                    SSN = (myReader["Patient_SSN"].ToString());
                    DOB = (myReader["dob_format"].ToString());
                    allergy = (myReader["Patient_Allergies"].ToString());

                }
                myConnection.Close();
                SqlDataReader myReader1 = null;
                SqlCommand myCommand1 = new SqlCommand("select * from users where user_id='" + patient_id + "'", myConnection);
                myConnection.Open();
                myReader1 = myCommand1.ExecuteReader();

                while (myReader1.Read())
                {
                    uname = (myReader1["email"].ToString());
                    pass = (myReader1["passwrd"].ToString());
                }
                myConnection.Close();
                if (!IsPostBack)
                {
                    patientId.Text = patient_id;
                    accountId.Text = account_Id;
                    fname.Text = f_name;
                    mname.Text = m_name;
                    lname.Text = l_name;
                    dob.Text = DOB;
                    ssn.Text = SSN;
                    city.Text = cty;
                    ph.Text = phone;
                    street.Text = st;
                    state.Text = stat;
                    zip.Text = zi;
                    allergies.Text = allergy;
                    username.Text = uname;
                    password.Text = pass;
                }
            }
        }
        protected void Button_edit_profile(object sender, EventArgs e)
        {
            string connectionString = "Data Source=isys631.database.windows.net;Initial Catalog=\"isys 631\";Integrated Security=False;User ID=isys631;Password=CollegeMain-345;Connect Timeout=60;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False;";
            try
            {

                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {

                    conn.Open();
                    using (SqlCommand cmd =
                        new SqlCommand("update patient set Account_ID = @Account_ID, Patient_First_Name = @Patient_First_Name, Patient_Middle_Name = @Patient_Middle_Name, Patient_Last_Name = @Patient_Last_Name, Patient_Street = @Patient_Street, Patient_City = @Patient_City, Patient_State = @Patient_State, Patient_Zip = @Patient_Zip, Patient_Phone_Primary = @Patient_Phone_Primary, Patient_SSN = @Patient_SSN, Patient_DOB = @Patient_DOB, Patient_Minor = 0, Patient_Head_Of_House = null, Patient_Allergies = @Patient_Allergies where Patient_ID = @Patient_ID", conn))
                    {

                        cmd.Parameters.AddWithValue("@Account_ID", accountId.Text);
                        cmd.Parameters.AddWithValue("@Patient_First_Name", fname.Text);
                        cmd.Parameters.AddWithValue("@Patient_Middle_Name", mname.Text);
                        cmd.Parameters.AddWithValue("@Patient_Last_Name", lname.Text);
                        cmd.Parameters.AddWithValue("@Patient_Street", street.Text);
                        cmd.Parameters.AddWithValue("@Patient_City", city.Text);
                        cmd.Parameters.AddWithValue("@Patient_State", state.Text);
                        cmd.Parameters.AddWithValue("@Patient_Zip", zip.Text);
                        cmd.Parameters.AddWithValue("@Patient_Phone_Primary", ph.Text);
                        cmd.Parameters.AddWithValue("@Patient_SSN", ssn.Text);
                        cmd.Parameters.AddWithValue("@Patient_DOB", dob.Text);
                        cmd.Parameters.AddWithValue("@Patient_Allergies", allergies.Text);
                        cmd.Parameters.AddWithValue("@Patient_ID", patientId.Text);

                        //cmd.Parameters.AddWithValue("@Patient_Minor", username.Text);
                        //cmd.Parameters.AddWithValue("@Patient_Head_Of_House", password.Text);
                        int rows = cmd.ExecuteNonQuery();
                    }

                    using (SqlCommand cmd =
    new SqlCommand("update users set passwrd=@pass,email=@email where user_id=@Patient_ID and user_type='p'", conn))
                    {

                        
                        cmd.Parameters.AddWithValue("@email", username.Text);
                        cmd.Parameters.AddWithValue("@pass", password.Text);
                        cmd.Parameters.AddWithValue("@Patient_ID", patientId.Text);

                        int rows = cmd.ExecuteNonQuery();

                        string abc = Request.QueryString["patient_id"];
                        
                        if (abc != null)
                        {
                            Response.Redirect("dashboard-receptionist-doctors.aspx?record_updated=" + rows + " record updated");
                        }
                        else
                        {
                            Response.Redirect("dashboard-user_profile.aspx");
                        }

                       
                        
                    }


                }
            }
            catch (SqlException ex)
            {
                //Log exception
                //Display Error message
            }

        }
        protected void fnSetLogout_Click(object sender, EventArgs e)
        {
            Session["email"] = null;
            Session["user_id"] = null;
            Session["user_type"] = null;
            Response.Redirect("default.aspx");
        }
    }
}