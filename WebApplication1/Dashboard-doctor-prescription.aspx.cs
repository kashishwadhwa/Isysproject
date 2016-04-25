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
                if (!IsPostBack)
                {
                    string ConnectString = "Data Source=isys631.database.windows.net;Initial Catalog=\"isys 631\";Integrated Security=False;User ID=isys631;Password=CollegeMain-345;Connect Timeout=60;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False;";

                    SqlConnection myConnection = new SqlConnection(ConnectString);

                    string QueryString = "select * from service";


                    SqlDataAdapter myCommand = new SqlDataAdapter(QueryString, myConnection);
                    DataSet ds = new DataSet();
                    myCommand.Fill(ds, "Service");

                    service_list.DataSource = ds;
                    service_list.DataTextField = "service_description";
                    service_list.DataValueField = "service_id";
                    service_list.DataBind();
                }

                if (!IsPostBack)
                    bindview();

            }
        }

        private void bindview()
        {
            string session_var = Session["user_id"].ToString();
            string connectionString = "Data Source=isys631.database.windows.net;Initial Catalog=\"isys 631\";Integrated Security=False;User ID=isys631;Password=CollegeMain-345;Connect Timeout=60;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False;";
            string sql = "select concat(p.patient_first_name,' ',p.patient_last_name) as patient_name, visit_id, cast(visit_date as varchar(10)) as visit_date from visit v, patient p where visit_date>=(getdate()-1) and v.patient_id=p.patient_id and dentist_id=" + Session["user_id"].ToString() + "order by visit_date desc";
            SqlConnection connection = new SqlConnection(connectionString);
            SqlDataAdapter dataadapter = new SqlDataAdapter(sql, connection);
            DataSet ds = new DataSet();
            connection.Open();
            dataadapter.Fill(ds, "Visit_table");
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
                //GridView1.HeaderRow.Cells[3].Attributes["data-hide"] = "phone";
                //GridView1.HeaderRow.Cells[4].Attributes["data-hide"] = "phone";


                //Adds THEAD and TBODY to GridView.
                GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;

            }

        }

        protected void fnSetLogout_Click(object sender, EventArgs e)
        {
            Session["email"] = null;
            Session["user_id"] = null;
            Session["user_type"] = null;
            Response.Redirect("default.aspx");
        }


        protected void Buttonbook_Click_visit(object sender, EventArgs e)
        {
              try
                    {
            foreach (ListItem listItem in service_list.Items)
            {
           
                if (listItem.Selected==true)
                {
                    string listitemm = listItem.Value;
                    string connectionString = "Data Source=isys631.database.windows.net;Initial Catalog=\"isys 631\";Integrated Security=False;User ID=isys631;Password=CollegeMain-345;Connect Timeout=60;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False;";

                  
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

                      
                    }
               
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