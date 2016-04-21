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
    public partial class dashboard_doctor_appointments : System.Web.UI.Page
    {
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            bindview(); //bindgridview will get the data source and bind it again
        }

        protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView2.PageIndex = e.NewPageIndex;
            bindview(); //bindgridview will get the data source and bind it again
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            //if (Session["email"] == null)
            //{
            //    Response.Redirect("WebForm4.aspx");
            //}
            //else
            //{

                linkLogout.ServerClick += new EventHandler(fnSetLogout_Click);
                if (!IsPostBack)
                    bindview();

            }

        //}
        protected void fnSetLogout_Click(object sender, EventArgs e)
        {
            Session["email"] = null;
            Session["user_id"] = null;
            Session["user_type"] = null;
            Response.Redirect("default.aspx");
        }


        private void bindview()
        {
           // string d_id = Session["user_id"].ToString();
            String d_id = "1";
            string connectionString = "Data Source=isys631.database.windows.net;Initial Catalog=\"isys 631\";Integrated Security=False;User ID=isys631;Password=CollegeMain-345;Connect Timeout=60;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False;";
            string sql = "select concat(patient_first_name,' ',patient_last_name) as patient_name, a.appointment_id, cast(appointment_date as varchar(10)) as appointment_date_cast, a.appointment_time from patient p, appointment a where p.account_id = (select account_id from patient where patient_id=1)and a.dentist_id=1 and a.appointment_date>getdate() order by a.appointment_date desc";
            string sql2 = "select concat(patient_first_name,' ',patient_last_name) as patient_name, v.visit_id as visit_id, s.service_description, cast(visit_date as varchar(10)) as visit_date_cast, v.visit_time from visit v, patient p, COMPLETED_SERVICE cs, appointment a ,service s where v.patient_id = p.patient_id and cs.visit_id = v.visit_id and cs.service_id = s.service_id and p.account_id = (select account_id from patient where patient_id=1)and a.dentist_id=" +d_id+ " order by visit_date_cast desc";
            SqlConnection connection = new SqlConnection(connectionString);
            SqlDataAdapter dataadapter = new SqlDataAdapter(sql, connection);
            DataSet ds = new DataSet();
            connection.Open();
            dataadapter.Fill(ds, "Auppointments_table");
            
            
            //GridView1.DataMember = "Auppointments_table";
            
            SqlDataAdapter dataadapter2 = new SqlDataAdapter(sql2, connection);
            DataSet ds2 = new DataSet();
           
            dataadapter.Fill(ds2, "Auppointments_table2");
            connection.Close();
            GridView1.DataSource = ds;
            GridView1.DataBind();
            GridView2.DataSource = ds2;
            GridView2.DataBind();

            //Attribute to show the Plus Minus Button.
            GridView1.HeaderRow.Cells[1].Attributes["data-class"] = "expand";
            GridView2.HeaderRow.Cells[0].Attributes["data-class"] = "expand";

            //Attribute to hide column in Phone.
            GridView1.HeaderRow.Cells[2].Attributes["data-hide"] = "phone";
            GridView1.HeaderRow.Cells[3].Attributes["data-hide"] = "phone";
            //GridView1.HeaderRow.Cells[4].Attributes["data-hide"] = "phone";
            //GridView2.HeaderRow.Cells[2].Attributes["data-hide"] = "phone";
            //GridView2.HeaderRow.Cells[3].Attributes["data-hide"] = "phone";
            //GridView2.HeaderRow.Cells[4].Attributes["data-hide"] = "phone";

            //Adds THEAD and TBODY to GridView.
            GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
            GridView2.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
    }
}