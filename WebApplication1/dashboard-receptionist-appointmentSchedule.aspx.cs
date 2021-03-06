﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class dashboard_receptionist_appointmentSchedule : System.Web.UI.Page
    {

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            bindview(); //bindgridview will get the data source and bind it again
        }
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["email"] == null)
            {
                Response.Redirect("WebForm4.aspx");
            }
            else
            {
                lbl_warning.Visible = false;
                string abc = Request.QueryString["record_updated"];
                if (abc != null)
                {
                    lbl_warning.Visible = true;
                    lbl_warning.Text = Request.QueryString["record_updated"];
                }

                linkLogout.ServerClick += new EventHandler(fnSetLogout_Click);
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
            string connectionString = "Data Source=isys631.database.windows.net;Initial Catalog=\"isys 631\";Integrated Security=False;User ID=isys631;Password=CollegeMain-345;Connect Timeout=60;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False;";
            string sql = "select appointment_id,concat(Patient_First_Name,' ',Patient_last_Name) as [Patient Name],concat(dentist_First_Name,' ',dentist_last_Name) as [Dentist Name] ,cast(appointment_date as varchar(10)) as appointment_date, appointment_time  from dentist d, patient p, appointment a where d.dentist_id = a.dentist_id and p.patient_id = a.patient_id order by appointment_date desc";
            SqlConnection connection = new SqlConnection(connectionString);
            SqlDataAdapter dataadapter = new SqlDataAdapter(sql, connection);
            DataSet ds = new DataSet();
            connection.Open();
            dataadapter.Fill(ds, "Auppointments_table");
            connection.Close();
            GridView1.DataSource = ds;
            GridView1.DataBind();
            //GridView1.DataMember = "Auppointments_table";

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