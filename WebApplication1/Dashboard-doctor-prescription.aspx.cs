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
    public partial class Dashboard_doctor_prescription : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string ConnectString = "Data Source=isys631.database.windows.net;Initial Catalog=\"isys 631\";Integrated Security=False;User ID=isys631;Password=CollegeMain-345;Connect Timeout=60;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False;";
                string visit_id = null;
                SqlConnection myConnection = new SqlConnection(ConnectString);

                string QueryString = "select top 3 * from service";


                SqlDataAdapter myCommand = new SqlDataAdapter(QueryString, myConnection);
                DataSet ds = new DataSet();
                myCommand.Fill(ds, "Service");

                service_list.DataSource = ds;
                service_list.DataTextField = "service_description";
                service_list.DataValueField = "service_id";
                service_list.DataBind();
            }

        }

        protected void Buttonbook_Click_visit(object sender, EventArgs e)
        {
            int count = 0;
            int countl = 0;
            foreach (ListItem listItem in service_list.Items)
            {
                countl=countl+1;
                if (listItem.Selected==true)
                {
                    string listitemm = listItem.Value;
                    string connectionString = "Data Source=isys631.database.windows.net;Initial Catalog=\"isys 631\";Integrated Security=False;User ID=isys631;Password=CollegeMain-345;Connect Timeout=60;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False;";

                    try
                    {
                        string visit_ID = Visit.Value;
                        string service_id = listitemm;

                        string ConnectString = "Data Source=isys631.database.windows.net;Initial Catalog=\"isys 631\";Integrated Security=False;User ID=isys631;Password=CollegeMain-345;Connect Timeout=60;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False;";
                        string completed_service_id = null;
                        SqlConnection myConnection = new SqlConnection(ConnectString);

                        SqlDataReader myReader = null;
                        SqlCommand myCommand2 = new SqlCommand("select top 1 (Completed_Service_ID+1) as Completed_Service_ID from Completed_Service order by Completed_Service_ID desc",
                                                                 myConnection);
                        myConnection.Open();
                        myReader = myCommand2.ExecuteReader();
                        while (myReader.Read())
                        {
                            completed_service_id = (myReader["Completed_Service_ID"].ToString());
                        }
                        myConnection.Close();
                      

                        using (SqlConnection connection = new SqlConnection(connectionString))
                        {
                            SqlCommand cmd = new SqlCommand("INSERT INTO completed_service ( visit_id, service_id, completed_service_id) VALUES ( @visit_ID, @service_ID, @completed_service_id )");
                            cmd.CommandType = CommandType.Text;
                            cmd.Connection = connection;
                            cmd.Parameters.AddWithValue("@visit_ID", visit_ID);
                            cmd.Parameters.AddWithValue("@service_ID", service_id);
                            cmd.Parameters.AddWithValue("@completed_service_id", completed_service_id);
                          

                            connection.Open();
                            cmd.ExecuteNonQuery();
                        }

                        Response.Redirect("dashboard-doctor.aspx");





                    }
                    catch (Exception ex)
                    {
                        Exception E = ex;
                        lbl_visitId_validate.Text = "Please check the visit id";
                    }

                }
            }
}
    }
}