using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace CRUD_Test
{
    public partial class CRUD_Test : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        
        public void DataLoad()
        {
            try
            {
                DataTable dt = new DataTable();
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                con.Open();
                string query = "SELECT * FROM CRUD_Test";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                con.Close();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    seendata.DataSource = dt;
                    seendata.DataBind();
                }
            }
            catch (Exception ex)
            {
                check.Text = ex.Message;
            }
        }

        public void ClearAllData()
        {
            txtname.Text = "";
            txtEmail.Text = "";
            txtdob.Text = DateTime.Today.Date.ToString();
            txtbox.SelectedValue = txtbox.Items[0].ToString();
            chkboxagree.Checked = false;


        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                DataLoad();
            }
        }

        protected void seendata_SelectedIndexChanged(object sender, EventArgs e)
        {
            iblsid.Text = seendata.SelectedRow.Cells[1].Text;
            txtname.Text = seendata.SelectedRow.Cells[2].Text;
            txtEmail.Text = seendata.SelectedRow.Cells[3].Text;
            txtbox.Text = seendata.SelectedRow.Cells[4].Text;
            txtdob.Text = seendata.SelectedRow.Cells[5].Text;
        }

        protected void addbtn_Click(object sender, EventArgs e)
        {
            try
            { 
            if(txtname.Text != "" && txtEmail.Text != "" && chkboxagree.Checked)
            {
                    using (con = new SqlConnection(cs))
                    {
                        DataTable dt = new DataTable();
                        con.Open();
                        cmd = new SqlCommand("insert into CRUD_Test(Name, Email,Gender, BirthDate) values(@name, @email, @gender, @birthdate)", con);
                        cmd.Parameters.AddWithValue("@name", txtname.Text);
                        cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                        cmd.Parameters.AddWithValue("@gender", txtbox.SelectedValue);
                        cmd.Parameters.AddWithValue("@birthdate", txtdob.Text);
                        cmd.ExecuteNonQuery();
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        con.Close();
                        da.Fill(dt);
                        con.Close();
                        DataLoad();
                        ClearAllData();
                    }

                }
            }
            catch (Exception)
            {

            }

        }
         
        protected void updatebtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtname.Text != "" && txtEmail.Text != "" && chkboxagree.Checked)
                {
                    using (con = new SqlConnection(cs))
                    {
                        DataTable dt = new DataTable();
                        con.Open();
                        cmd = new SqlCommand("update CRUD_Test Set Name=@name, Email=@email,Gender=@gender, BirthDate=@birthdate where StdentID = @stdentid", con);
                        cmd.Parameters.AddWithValue("@name", txtname.Text);
                        cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                        cmd.Parameters.AddWithValue("@gender", txtbox.SelectedValue);
                        cmd.Parameters.AddWithValue("@birthdate", txtdob.Text);
                        cmd.Parameters.AddWithValue("@stdentid", iblsid.Text);
                        cmd.ExecuteNonQuery();
                        con.Close();
                        DataLoad();
                        ClearAllData();

                    }
                }

            }
            catch (Exception ex)
            {
                check.Text = ex.Message;
            }
        }

        protected void deletebtn_Click(object sender, EventArgs e)
        {
            try
            {
                using (con = new SqlConnection(cs))
                {
                    con.Open();
                    cmd = new SqlCommand("Delete From CRUD_Test where StdentID = @stdentid", con);
                    cmd.Parameters.AddWithValue("@stdentid", iblsid.Text);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    DataLoad();
                    ClearAllData();
                }
            }
            catch (Exception)
            {

            }
        }
        protected void cancelbtn_Click(object sender, EventArgs e)
        {
            ClearAllData();
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = new DataTable();
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                con.Open();
                string query = "SELECT * FROM CRUD_Test WHERE Name LIKE '%"+ search.Text +"%' ";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                con.Close();
                da.Fill(dt);
                if(dt.Rows.Count> 0)
                {
                    seendata.DataSource = dt;
                    seendata.DataBind();
                }
            }
            catch (Exception ex)
            {
                check.Text = ex.Message;
            }

        }
    }
}