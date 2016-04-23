using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class dashboard_receptionist_dentistEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string dateres = DateTime.Now.ToString("yyyy-MM-dd");
            txt_date.Attributes.Add("max", dateres);
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
                    string dentist_id = Request.QueryString["dentist_id"];
                    string session_patient_id = Session["user_id"].ToString();
                    string fname = null;
                    string mname = null;
                    string lname = null;
                    DateTime date = DateTime.Now;

                    string ConnectString = "Data Source=isys631.database.windows.net;Initial Catalog=\"isys 631\";Integrated Security=False;User ID=isys631;Password=CollegeMain-345;Connect Timeout=60;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False;";

                    SqlConnection myConnection = new SqlConnection(ConnectString);
                    try
                    {
                        SqlDataReader myReader = null;
                        SqlCommand myCommand2 = new SqlCommand("select top 1 * from dentist where dentist_id=" + dentist_id,
                                                                 myConnection);
                        myConnection.Open();
                        myReader = myCommand2.ExecuteReader();
                        while (myReader.Read())
                        {
                            dentist_id = (myReader["dentist_id"].ToString());
                            fname = (myReader["Dentist_First_Name"].ToString());
                            mname = (myReader["Dentist_Middle_Name"].ToString());
                            lname = (myReader["Dentist_Last_Name"].ToString());
                            date = Convert.ToDateTime((myReader["Dentist_Join_Date"].ToString()));
                            
                        }

                        myConnection.Close();
                        if (!IsPostBack)
                        {
                            string date_1 = date.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);

                            txt_dentist_id.Attributes.Add("value", dentist_id);
                            txt_fname.Attributes.Add("value", fname);
                            txt_lname.Attributes.Add("value", lname);
                            txt_mname.Attributes.Add("value", mname);
                            txt_date.Attributes.Add("value", date_1);
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
                        new SqlCommand("UPDATE dentist SET Dentist_First_Name=@Dentist_First_Name, Dentist_Middle_Name=@Dentist_Middle_Name, Dentist_Last_Name=@Dentist_Last_Name, Dentist_Join_Date=@Dentist_Join_Date" +
                            " WHERE dentist_id=@Id", conn))
                    {
                        cmd.Parameters.AddWithValue("@Id", txt_dentist_id.Value);
                        cmd.Parameters.AddWithValue("@Dentist_First_Name", txt_fname.Value);
                        cmd.Parameters.AddWithValue("@Dentist_Middle_Name", txt_mname.Value);
                        cmd.Parameters.AddWithValue("@Dentist_Last_Name", txt_lname.Value);
                        cmd.Parameters.AddWithValue("@Dentist_Join_Date", txt_date.Value);

                        int rows = cmd.ExecuteNonQuery();
                        Response.Redirect("dashboard-receptionist-doctors.aspx?record_updated=" + rows + " record updated");
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