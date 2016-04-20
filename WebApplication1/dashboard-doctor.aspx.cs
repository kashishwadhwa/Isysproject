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
    public partial class dashboard_doctor : System.Web.UI.Page
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
                    bindview();

            }
        }

        protected void fnSetLogout_Click(object sender, EventArgs e)
        {
            Session["email"] = null;
            Session["user_id"] = null;
            Session["user_type"] = null;
            Response.Redirect("default.aspx");
        }




        protected void Search(object sender, EventArgs e)
        {
            this.bindview();
        }

        private void bindview()
        {
            //Session variable
            int session_dentist_id = 1;

            string connectionString = "Data Source=isys631.database.windows.net;Initial Catalog=\"isys 631\";Integrated Security=False;User ID=isys631;Password=CollegeMain-345;Connect Timeout=60;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False;";
            string sql = "select appointment_id,concat(Patient_First_Name,' ',Patient_last_Name) as [Patient Name],concat(dentist_First_Name,' ',dentist_last_Name) as [Dentist Name] ,cast(appointment_date as varchar(10)) as appointment_date, appointment_time  from dentist d, patient p, appointment a where d.dentist_id = a.dentist_id and p.patient_id = a.patient_id and a.appointment_date between and a.dentist_id=" + session_dentist_id;
            //string sql = "select appointment_id,concat(Patient_First_Name,' ',Patient_last_Name) as [Patient Name],concat(dentist_First_Name,' ',dentist_last_Name) as [Dentist Name] ,cast(appointment_date as varchar(10)) as appointment_date, appointment_time  from dentist d, patient p, appointment a where d.dentist_id = a.dentist_id and p.patient_id = a.patient_id and a.appointment_date between " + from_date.Value + " and " + to_date.Value + " and a.dentist_id=" + session_dentist_id;

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
    }
}