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
    public partial class dashboard_patient_myfamily : System.Web.UI.Page
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


        private void bindview()
        {
            string session_var = Session["user_id"].ToString();
            string connectionString = "Data Source=isys631.database.windows.net;Initial Catalog=\"isys 631\";Integrated Security=False;User ID=isys631;Password=CollegeMain-345;Connect Timeout=60;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False;";
            string sql = "select patient_id, account_id, concat(patient_first_name,' ',patient_last_name) as patient_name,cast(patient_DOB as varchar(11)) as Dob_cast from patient where account_id=(select account_id from patient where patient_id="+Session["user_id"].ToString()+")";
            SqlConnection connection = new SqlConnection(connectionString);
            SqlDataAdapter dataadapter = new SqlDataAdapter(sql, connection);
            DataSet ds = new DataSet();
            connection.Open();
            dataadapter.Fill(ds, "patient_table");
            connection.Close();
            GridView1.DataSource = ds;
            GridView1.DataBind();
            

            if (ds.Tables[0].Rows.Count != 0)
            {

                //Attribute to show the Plus Minus Button.
                GridView1.HeaderRow.Cells[1].Attributes["data-class"] = "expand";

                //Attribute to hide column in Phone.
                GridView1.HeaderRow.Cells[3].Attributes["data-hide"] = "phone";
               
               


                //Adds THEAD and TBODY to GridView.
                GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;

            }

        }
    }
}