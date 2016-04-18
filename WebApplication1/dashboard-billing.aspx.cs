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
    public partial class dashboard_billing : System.Web.UI.Page
    {
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            bindview(); //bindgridview will get the data source and bind it again
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            string balance = null;
            string amount = null;
            string lastVisit = null;
            string connString = "Data Source=isys631.database.windows.net;Initial Catalog=\"isys 631\";Integrated Security=False;User ID=isys631;Password=CollegeMain-345;Connect Timeout=60;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False;";
            SqlConnection myConnection = new SqlConnection(connString);
            try
            {
                SqlDataReader myReader = null;
                SqlCommand myCommand = new SqlCommand("select * from account where account_id=1",
                                                         myConnection);
                SqlCommand myCommand1 = new SqlCommand("select sum(payment_amount) as payment_sum from payment where account_id=1",
                                                         myConnection);
                SqlCommand myCommand2 = new SqlCommand("select top 1 visit_date from visit v, patient p where v.patient_id = p.patient_id and   p.account_id = 1 order by visit_date desc ",
                                                         myConnection);
                myConnection.Open();

                myReader = myCommand.ExecuteReader();
                while (myReader.Read())
                {
                    balance = (myReader["account_balance"].ToString());
                }
                myConnection.Close();

                myConnection.Open();
                myReader = myCommand1.ExecuteReader();
                while (myReader.Read())
                {
                    amount = (myReader["payment_sum"].ToString());
                }
                myConnection.Close();

                myConnection.Open();
                myReader = myCommand2.ExecuteReader();
                while (myReader.Read())
                {
                    lastVisit = (myReader["visit_date"].ToString());
                }

                myConnection.Close();
                lbl_balance.Text = "$"+balance.Remove(balance.Length - 2);
                lbl_amount.Text = "$"+amount.Remove(amount.Length - 2);
                lbl_lastVisit.Text = lastVisit.Remove(lastVisit.Length - 12);



            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }

            if (!IsPostBack)
                bindview();

        }
        private void bindview()
        {
            string connectionString = "Data Source=isys631.database.windows.net;Initial Catalog=\"isys 631\";Integrated Security=False;User ID=isys631;Password=CollegeMain-345;Connect Timeout=60;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False;";
            string sql = "select *,concat(patient_first_name,' ',patient_last_name) as patient_name, cast(visit_date as varchar(10)) as visit_date_cast from visit v, patient p, COMPLETED_SERVICE cs, service s where v.patient_id = p.patient_id and cs.visit_id = v.visit_id and cs.service_id = s.service_id and p.account_id = 1 order by visit_date_cast desc";
            SqlConnection connection = new SqlConnection(connectionString);
            SqlDataAdapter dataadapter = new SqlDataAdapter(sql, connection);
            DataSet ds = new DataSet();
            connection.Open();
            dataadapter.Fill(ds, "Visit_table");
            connection.Close();
            GridView1.DataSource = ds;
            GridView1.DataBind();
            //GridView1.DataMember = "Auppointments_table";

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
}