using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UmbrellaCorpGestion.MaterialProveedores
{
    public partial class ConsultayModificacionProveedores : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            Label1.Text = "";
            GridView1.Visible = true;
            string Consulta = @"SELECT *
                             FROM Proveedores
                             WHERE activo= ('true') ";

            if (DropDownList1.SelectedValue.ToString() == "NombreDePro.")
            {
                Consulta += " AND razonSocial = @razonSocial";
            }
            if (DropDownList1.SelectedValue.ToString() == "CUIT")
            {
                Consulta += " AND CUIT = @CUIT";
            }
            if (RadioButton1.Checked == true)
            {
                Consulta += " AND certificado = 'true' ";
            }
            
            if (RadioButton2.Checked == true)
            {
                Consulta += " AND certificado = 'false' ";
            }
            

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BD"].ToString()))
            {



                try

                {
                    SqlCommand cmd = new SqlCommand(Consulta, conn);
                    cmd.Parameters.AddWithValue("razonSocial", TextBox1.Text);
                    cmd.Parameters.AddWithValue("CUIT", TextBox1.Text);

                    conn.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    conn.Close();
                }
                catch (Exception )
                {

                    Label1.ForeColor = Color.Red;
                    Label1.Text = "Error,Intente mas Tarde";


                }


            }
           

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label1.Text = "";
            BtnInactivar.Visible = true;
            BtnEditar.Visible = true;
        }

       

        protected void BtnInactivar_Click (object sender, EventArgs e)
        {
            Label1.Text = "";
            string Consulta = @"UPDATE Proveedores " +
               "SET activo=(@activo)" +
               "WHERE Id=(@Id)";

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BD"].ToString()))
            {
                try
                {
                    SqlCommand comd = new SqlCommand(Consulta, conn);

                    comd.Parameters.AddWithValue( "activo" , false);
                    comd.Parameters.AddWithValue("Id" , GridView1.SelectedDataKey.Value.ToString());
                    conn.Open();
                    comd.ExecuteNonQuery();
                    conn.Close();

                    Label1.ForeColor = Color.Green;
                    Label1.Text = "Sea INACTIVADO al proveedor exitosamente";
                }
                catch (Exception )
                {
                    Label1.ForeColor = Color.Red;
                    Label1.Text = "Error, volvé a intentarlo más tarde";


                }
            }

            GridView1.Visible = false;
            BtnInactivar.Visible = false;
            BtnEditar.Visible = false;
            TextBox1.Text = "";

        }

        protected void BtnEditar_Click(object sender, EventArgs e)
        {
            
            textcuit.Visible = true;
            btnaceptarcuit.Visible = true;
            btncancelarcuit.Visible = true;
            RadioButton3.Visible = true;
            RadioButton4.Visible = true;
        }
       protected void btncancelarcuit_Click(object sender, EventArgs e)
        {
            textcuit.Visible = false;
            btnaceptarcuit.Visible = false;
            btncancelarcuit.Visible = false;
            RadioButton3.Visible = false;
            RadioButton4.Visible = false;
        }

        protected void btnaceptarcuit_Click(object sender, EventArgs e)
        {
            Label1.Text = "";
            textcuit.Visible = true;
            string Consulta = @"UPDATE Proveedores " +
               "SET CUIT=(@CUIT),certificado=(@certificado)"+
               "WHERE Id=(@Id)";
  
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BD"].ToString()))
            {
                bool certificado=true;
                try
                {
                    SqlCommand comd = new SqlCommand(Consulta, conn);

                    comd.Parameters.AddWithValue("CUIT", textcuit.Text);
                    if (RadioButton3.Checked == true)
                    {
                        certificado =  true;
                    }
                    if(RadioButton4.Checked== true)
                    {
                        certificado = false;
                    }
                    comd.Parameters.AddWithValue("certificado", certificado);
                    comd.Parameters.AddWithValue("Id", GridView1.SelectedDataKey.Value.ToString());
                    conn.Open();
                    comd.ExecuteNonQuery();
                    conn.Close();

                    Label1.ForeColor = Color.Green;
                    Label1.Text = "Sea MODIFICADO el CUIT del proveedor exitosamente";
                }
                catch (Exception )
                {
                    Label1.ForeColor = Color.Red;
                    Label1.Text =  "Error, volvé a intentarlo más tarde";


                }
            }

            GridView1.Visible = false;
            BtnInactivar.Visible = false;
            BtnEditar.Visible = false;
            textcuit.Visible = false;
            TextBox1.Text = "";
            btnaceptarcuit.Visible = false;
            btncancelarcuit.Visible = false;
            RadioButton3.Visible = false;
            RadioButton4.Visible = false;

        }
       

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProveedoresInactivos.aspx");
        }

        
    }
 }
