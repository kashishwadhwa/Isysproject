using System;
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
    public partial class dashboard_user_profile : System.Web.UI.Page
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
                String patient_id = "1";
                String account_Id = null;
                String f_name = null;
                String m_name = null;
                String l_name = null;
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
                SqlCommand myCommand = new SqlCommand("select *,cast(Patient_DOB as varchar(14)) as dob_format from patient where Patient_ID='" + patient_id + "'", myConnection);
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
                SqlCommand myCommand1 = new SqlCommand("select * from users where user_id='" + patient_id +"'", myConnection);
                myConnection.Open();
                myReader1 = myCommand1.ExecuteReader();

                while (myReader1.Read())
                {
                    uname = (myReader1["email"].ToString());
                 }
                myConnection.Close();

                patientId.Text =  patient_id;
                accountId.Text =  account_Id;
                fname.Text =  f_name;
                mname.Text =  m_name;
                lname.Text =  l_name;
                dob.Text =  DOB;
                ssn.Text =  SSN;
                city.Text =  cty;
                ph.Text =  phone;
                street.Text =  st;
                state.Text = stat;
                zip.Text =  zi;
                allergies.Text = allergy;
                username.Text =  uname;
            }
        }
        protected void Button_edit_profile(object sender, EventArgs e) 
        {
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