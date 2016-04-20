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
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] != null)
            {
                if (Session["user_type"].ToString() == "r")
                {
                    Response.Redirect("dashboard.aspx");
                }

                else if(Session["user_type"].ToString() == "d")
                {
                    Response.Redirect("dashboard-doctor.aspx");
                }

                else if (Session["user_type"].ToString() == "p")
                {
                    Response.Redirect("dashboard-patient.aspx");
                }
            }

            else
            {
                
            }

        }
        string connectionString = "Server=isys631.database.windows.net;Database=\"isys 631\";User Id=isys631;Password=CollegeMain-345;";
  
        protected void ButtonRegister_Click(object sender, EventArgs e)
        {


            string frname = fname.Value;
            string ltname = lname.Value;
            string emailid = email.Value;
            string pass = passwrd.Value;
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
                com.CommandText = "INSERT INTO account ( account_id,account_balance) VALUES ( (select top 1 (account_id+1) as account_id from account order by account_id desc) , 0)";
                com.Connection = db;
                com.Transaction = tran;
                com.ExecuteNonQuery();



                com3.CommandText = "INSERT INTO patient ( Patient_First_Name, Patient_Last_Name, passint, patient_minor,account_id) VALUES ( @fname, @lname, @pass, 0,(select top 1 (account_id) as account_id from account order by account_id desc))";
                com3.Connection = db;
                com3.Transaction = tran;
                com3.Parameters.AddWithValue("@fname", frname);
                com3.Parameters.AddWithValue("@lname", ltname);
                com3.Parameters.AddWithValue("@pass", pass);
                com2.Transaction = tran;
                com3.ExecuteNonQuery();

                com2.CommandText = "INSERT INTO users ( user_id,passwrd,user_type,email) VALUES ( (select top 1 (patient_id+1) as patient_id from patient order by patient_id desc) , @pass, 'p',@email)";
                com2.Connection = db;
                com2.Transaction = tran;
                com2.Parameters.AddWithValue("@email", emailid);
                com2.Parameters.AddWithValue("@pass", pass);
                com2.ExecuteNonQuery();


                tran.Commit();
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



        protected void ButtonRegister_Click_login(object sender, EventArgs e)
        {
            try
            {
                string email_login_string = email_login.Value;
                string email_psswrd_string = psswrd_login.Value;
                string user_type = null;
                string user_id = null;

                
                SqlConnection myConnection = new SqlConnection(connectionString);

                    SqlDataReader myReader = null;
                    SqlCommand myCommand = new SqlCommand("select * from users where email='" + email_login_string + "' and passwrd='" + email_psswrd_string + "'", myConnection);
                    myConnection.Open();
                    myReader = myCommand.ExecuteReader();
                    if (myReader==null)
                    {
                        Response.Redirect("#");
                    }
                    while (myReader.Read())
                    {
                        user_type = (myReader["user_type"].ToString());
                        user_id = (myReader["user_id"].ToString());
                }
                    myConnection.Close();

                    Session["email"] = email_login_string;
                    Session["user_id"] = user_id;
                    Session["user_type"] = user_type;

                    if (user_type=="R" || user_type == "r")
                    {
                        Response.Redirect("dashboard.aspx");
                    }
                    else if (user_type == "D" || user_type == "d")
                    {
                        Response.Redirect("dashboard-doctor.aspx");
                    }
                    else if (user_type == "P" || user_type == "p")
                    {
                        Response.Redirect("dashboard-patient.aspx");
                    }
                    else
                    {
                    lbl_invalidId.Text = "Please check credentials";
                    }

                
            }
            catch (Exception ex)
            {
                Exception E = ex;
            }
        }


    }
    }

