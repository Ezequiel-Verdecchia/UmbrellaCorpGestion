using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UmbrellaCorpGestion.MaterialProveedores
{
    public partial class AltaProveedores : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnRegistrar_Click(object sender, EventArgs e)
        {
            Label1.Text = " ";


             string sqlCrear = @"INSERT INTO Proveedores(razonSocial,certificado,CUIT,activo) 
                              VALUES (@razonSocial,@certificado,@CUIT,@activo)";
            string sqlValidar = @"SELECT * FROM Proveedores 
                                WHERE razonSocial = @razonSocial";

                       
            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BD"].ToString()))
                {

                    SqlCommand commandValidacion = new SqlCommand(sqlValidar, conn);
                    commandValidacion.Parameters.AddWithValue("razonSocial", TextBoxRazonSocial.Text);
                    conn.Open();
                    SqlDataReader leerbd = commandValidacion.ExecuteReader();

                    if (leerbd.Read() == true)
                    {
                        Label1.ForeColor = Color.Red;
                        Label1.Text = "La Razon Social ya existe, elija otro";
                        conn.Close();
                        return;
                    }
                    else
                    {
                       
                        conn.Close();
                        SqlCommand cmdinsetar = new SqlCommand(sqlCrear, conn);
                        cmdinsetar.Parameters.AddWithValue("razonSocial", TextBoxRazonSocial.Text);
                        cmdinsetar.Parameters.AddWithValue("CUIT", TextBoxCUIT.Text);
                        cmdinsetar.Parameters.AddWithValue("certificado", CheckBoxCertificado.Checked);
                        cmdinsetar.Parameters.AddWithValue("activo", true);
                        conn.Open();
                        cmdinsetar.ExecuteNonQuery();
                        conn.Close();
                        Label1.ForeColor = Color.Green;
                        Label1.Text = "El Proveedor: " + TextBoxRazonSocial.Text + " ha sido de alta exitosamente.";


                    }

                   
                }
                
            }
           
            catch (Exception )
            {
                Label1.ForeColor = Color.Red;
                Label1.Text = "error,llame al administrador o pruebe mas tarde";
                
            }
        }


    }
}
    
        