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
            string ConnectString = "Data Source=isys631.database.windows.net;Initial Catalog=\"isys 631\";Integrated Security=False;User ID=isys631;Password=CollegeMain-345;Connect Timeout=60;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False;";
            string visit_id = null;
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

        protected void Buttonbook_Click_visit(object sender, EventArgs e)
        {
            foreach (ListItem listItem in service_list.Items)
            {
                if (listItem.Selected)
                {
                    var val = listItem.Value;
                    var txt = listItem.Text;
                }
            }
}
    }
}