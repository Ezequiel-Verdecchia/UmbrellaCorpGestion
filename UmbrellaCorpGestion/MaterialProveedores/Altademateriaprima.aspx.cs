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
    public partial class Altademateriaprima : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btngenerar_Click(object sender, EventArgs e)
        {
            LBerror.Text = "";
           

            string sqlCrear = @"INSERT INTO MateriaPrima (nombre,descripcion,activo,precioUnitario,cantidad,idpro) 
                                  VALUES (@nombre, @descripcion ,@activo,@precioUnitario,@cantidad,@idpro) ";
            string sqlValidar = @"SELECT *
                                   FROM MateriaPrima 
                                   WHERE nombre = @nombre";
            
            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BD"].ToString()))
                {

                    SqlCommand commandValidacion = new SqlCommand(sqlValidar, conn);
                    commandValidacion.Parameters.AddWithValue("nombre", textnombre.Text);
                    conn.Open();
                    SqlDataReader leerbd = commandValidacion.ExecuteReader();

                    if (leerbd.Read() == true)
                    {
                        LBerror.ForeColor = Color.Red;
                        LBerror.Text = "El nombre ya existe, elija otro";
                        conn.Close();
                        return;
                    }
                    else
                    {

                        conn.Close();
                        SqlCommand cmdinsetar = new SqlCommand(sqlCrear, conn);
                        cmdinsetar.Parameters.AddWithValue("idpro", ddpro.SelectedValue.ToString());
                        cmdinsetar.Parameters.AddWithValue("nombre", textnombre.Text);
                        cmdinsetar.Parameters.AddWithValue("descripcion",textdesc.Text);
                        cmdinsetar.Parameters.AddWithValue("cantidad", textcantidad.Text);
                        cmdinsetar.Parameters.AddWithValue("precioUnitario",textpu.Text);
                        cmdinsetar.Parameters.AddWithValue("activo", true);
                        conn.Open();
                        cmdinsetar.ExecuteNonQuery();
                        conn.Close();
                        LBerror.ForeColor = Color.Green;
                        LBerror.Text = "La Materia Prima:  "+textnombre.Text+" ha sido de alta exitosamente.";
                    }


                }
            }
            catch (Exception )
            {
                LBerror.ForeColor = Color.Red;
                LBerror.Text = "error,llame al administrador o pruebe mas tarde";

            }
        }

    }
}
