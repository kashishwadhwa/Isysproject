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
    public partial class add_user : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string dateres = DateTime.Now.ToString("yyyy-MM-dd");
            dob1.Attributes.Add("max", dateres);
            dob1.Attributes.Add("min", "1930-01-01");

            linkLogout.ServerClick += new EventHandler(fnSetLogout_Click);
            if (Session["email"] == null)
            {
                Response.Redirect("WebForm4.aspx");
            }

            string ConnectString = "Data Source=isys631.database.windows.net;Initial Catalog=\"isys 631\";Integrated Security=False;User ID=isys631;Password=CollegeMain-345;Connect Timeout=60;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False;";
            string patient_id = null;
            SqlConnection myConnection = new SqlConnection(ConnectString);

            SqlDataReader myReader = null;
            SqlCommand myCommand2 = new SqlCommand("select top 1 (patient_id+1) as patient_id from patient order by patient_id desc",
                                                     myConnection);
            myConnection.Open();
            myReader = myCommand2.ExecuteReader();
            while (myReader.Read())
            {
                patient_id = (myReader["patient_id"].ToString());
            }
            myConnection.Close();
            patientId1.Text = patient_id;


        }

        protected void fnSetLogout_Click(object sender, EventArgs e)
        {
            Session["email"] = null;
            Session["user_id"] = null;
            Session["user_type"] = null;
            Response.Redirect("default.aspx");
        }

        protected void Button_add_user(object sender, EventArgs e)
        {

            string connectionString = "Server=isys631.database.windows.net;Database=\"isys 631\";User Id=isys631;Password=CollegeMain-345;";
            SqlConnection db = new SqlConnection(connectionString);
            SqlCommand com = new SqlCommand();
            SqlCommand com2 = new SqlCommand();
            SqlCommand com3 = new SqlCommand();
            SqlTransaction tran;
            db.Open();
            tran = db.BeginTransaction();
            try
            {
                //Run all your insert statements here here
                //com.CommandText = "INSERT INTO account ( account_id,account_balance) VALUES ( (select top 1 (account_id+1) as account_id from account order by account_id desc) , 0)";
                //com.Connection = db;
                //com.Transaction = tran;
                //com.ExecuteNonQuery();
                com3.CommandText = "INSERT INTO patient ( Patient_First_Name, Patient_Middle_Name, Patient_Last_Name, passint, patient_minor,account_id,Patient_Street, Patient_City, Patient_State,Patient_Zip,Patient_Phone_Primary,Patient_SSN, Patient_DOB,Patient_Allergies) VALUES ( @fname, @mname, @lname, @pass, 0,@acc_id, @pstreet, @pcity, @pstate, @pzip, @phone, @pssn, @pdob, @pallergy)";
                com3.Connection = db;
                com3.Transaction = tran;
                com3.Parameters.AddWithValue("@fname", fname.Text);
                com3.Parameters.AddWithValue("@mname", mname.Text);
                com3.Parameters.AddWithValue("@lname", lname.Text);
                com3.Parameters.AddWithValue("@pass", password.Text);
                com3.Parameters.AddWithValue("@acc_id", accountId.Text);
                com3.Parameters.AddWithValue("@pstreet", street.Text);
                com3.Parameters.AddWithValue("@pcity", city.Text);
                com3.Parameters.AddWithValue("@pstate", state.Text);
                com3.Parameters.AddWithValue("@pzip", zip.Text);
                com3.Parameters.AddWithValue("@phone", ph.Text);
                com3.Parameters.AddWithValue("@pssn", ssn.Text);
                com3.Parameters.AddWithValue("@pdob", dob1.Value);
                com3.Parameters.AddWithValue("@pallergy", allergies.Text);
               
                com3.ExecuteNonQuery();

                com2.CommandText = "INSERT INTO users ( user_id,passwrd,user_type,email) VALUES ( (select top 1 (patient_id) as patient_id from patient order by patient_id desc) , @pass, 'p',@email)";
                com2.Connection = db;
                com2.Transaction = tran;
                com2.Parameters.AddWithValue("@email", username.Text);
                com2.Parameters.AddWithValue("@pass", password.Text);
                com2.ExecuteNonQuery();


                tran.Commit();
                db.Close();
                Response.Redirect("dashboard.aspx?message= New User Added");

            }
            catch (SqlException sqlex)
            {
                tran.Rollback();
                lbl_invalidId.Text = "Please check email";
            }
            finally
            {
                db.Close();
            }
        }
    }
}