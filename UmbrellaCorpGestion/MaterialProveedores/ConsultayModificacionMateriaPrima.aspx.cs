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
    public partial class ConsultayModificacionMateriaPrima : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Label1.Text = "";
            GridView1.Visible = true;
            string Consulta = @"SELECT *
                             FROM MateriaPrima
                             WHERE nombre = (@nombre) AND activo= ('true')";
              

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BD"].ToString()))
            {

                try

                {
                    SqlCommand comd = new SqlCommand(Consulta, conn);
                    comd.Parameters.AddWithValue("nombre", textnombre.Text);
                    conn.Open();
                    SqlDataAdapter da = new SqlDataAdapter(comd);
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
            btninactivar.Visible = true;
            btneditar.Visible = true;
            btnmodcantidad.Visible = true;
            btnmodprecio.Visible = true;
        }
        protected void btninactivar_Click(object sender, EventArgs e)
        {

            string consulta = @"UPDATE MateriaPrima " +
                             "SET activo=(@activo)" +
                             "WHERE Id=(@Id) ";

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BD"].ToString()))
            {

                try

                {
                    SqlCommand comd = new SqlCommand(consulta, conn);

                    comd.Parameters.AddWithValue("activo", false );
                    comd.Parameters.AddWithValue("Id", GridView1.SelectedDataKey.Value.ToString());
                  
                    conn.Open();
                    comd.ExecuteNonQuery();
                    conn.Close();

                    Label1.ForeColor = Color.Green;
                    Label1.Text = "Se ha cambiado INACTIVADO al usuario exitosamente";

                }
                catch (Exception )
                {

                    Label1.ForeColor = Color.Red;
                    Label1.Text = "Error,Intente mas Tarde";


                }
                
            }
            btninactivar.Visible = false;
            btneditar.Visible = false;
            btnmodcantidad.Visible = false;
            btnmodprecio.Visible = false;

        }

        protected void btneditar_Click(object sender, EventArgs e)
        {
            lbnombre.Visible = true;
            lbdescripcion.Visible = true;
            lbidpro.Visible = true;
            textidpro.Visible = true;
            textednombre.Visible = true;
            texteddescripcion.Visible = true;
            btnaceptar.Visible = true;
            btncancelar.Visible = true;

            
        }

        protected void btnaceptar_Click(object sender, EventArgs e)
        {
            string consulta = @"UPDATE MateriaPrima " +
                            "SET nombre=(@nombre), descripcion=(@descripcion), idpro=(@idpro) " +
                            "WHERE Id=(@Id) ";
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BD"].ToString()))
            {

                try

                {
                    SqlCommand comd = new SqlCommand(consulta, conn);


                    comd.Parameters.AddWithValue("nombre", textednombre.Text);
                    comd.Parameters.AddWithValue("descripcion", texteddescripcion.Text);
                    comd.Parameters.AddWithValue("idpro", textidpro.Text);
                    comd.Parameters.AddWithValue("Id", GridView1.SelectedDataKey.Value.ToString());

                    conn.Open();
                    comd.ExecuteNonQuery();
                    conn.Close();

                    Label1.ForeColor = Color.Green;
                    Label1.Text = "Se ha cambiado EDITADO al usuario exitosamente";

                }
                catch (Exception )
                {

                    Label1.ForeColor = Color.Red;
                    Label1.Text = "Error,Intente mas Tarde";


                }

            }
            lbidpro.Visible = false;
            lbnombre.Visible = false;
            lbdescripcion.Visible = false;
            textidpro.Visible = false;
            textednombre.Visible = false;
            texteddescripcion.Visible = false;
            btninactivar.Visible = false;
            btneditar.Visible = false;
            btnmodcantidad.Visible = false;
            btnmodprecio.Visible = false;
            btnaceptar.Visible = false;
            btncancelar.Visible = false;

        }

        protected void btnmodprecio_Click(object sender, EventArgs e)
        {
            lbPU.Visible = true;
            textPU.Visible = true;
            btnaceptar2.Visible = true;
            btncancelar2.Visible = true;

        }

        protected void btnaceptar2_Click(object sender, EventArgs e)
        {
            string consulta = @"UPDATE MateriaPrima " +
                              "SET precioUnitario = (@precioUnitario) " +
                              "WHERE Id=(@Id) ";
            using(SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BD"].ToString()))
            {

                try

                {
                    SqlCommand comd = new SqlCommand(consulta, conn);


                    
                    comd.Parameters.AddWithValue("precioUnitario", textPU.Text);
                    comd.Parameters.AddWithValue("Id", GridView1.SelectedDataKey.Value.ToString());

                    conn.Open();
                    comd.ExecuteNonQuery();
                    conn.Close();

                    Label1.ForeColor = Color.Green;
                    Label1.Text = "Se ha cambiado MODIFICADO el precio  exitosamente";

                }
                catch (Exception )
                {

                    Label1.ForeColor = Color.Red;
                    Label1.Text =  "Error,Intente mas Tarde";


                }

            }
            lbPU.Visible = false;
            textPU.Visible = false;
            btninactivar.Visible = false;
            btneditar.Visible = false;
            btnmodcantidad.Visible = false;
            btnmodprecio.Visible = false;
            btnaceptar2.Visible = false;
            btncancelar2.Visible = false;

        }

        protected void btnmodcantidad_Click(object sender, EventArgs e)
        {
            lbcant.Visible = true;
            textcant.Visible = true;
            btnaceptar3.Visible = true;
            btncancelar3.Visible = true;

        }

        protected void btnaceptar3_Click(object sender, EventArgs e)
        {
            string consulta = @"UPDATE MateriaPrima " +
                             "SET cantidad=(@cantidad) " +
                             "WHERE Id=(@Id) ";
            using(SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BD"].ToString()))
            {

                try

                {
                    SqlCommand comd = new SqlCommand(consulta, conn);



                    comd.Parameters.AddWithValue("cantidad", textcant.Text);
                    comd.Parameters.AddWithValue("Id", GridView1.SelectedDataKey.Value.ToString());

                    conn.Open();
                    comd.ExecuteNonQuery();
                    conn.Close();

                    Label1.ForeColor = Color.Green;
                    Label1.Text = "Se ha cambiado MODIFICADO la cantidad exitosamente";

                }
                catch (Exception )
                {

                    Label1.ForeColor = Color.Red;
                    Label1.Text =  "Error,Intente mas Tarde";


                }

            }
            lbcant.Visible = false;
            textcant.Visible = false;
            btninactivar.Visible = false;
            btneditar.Visible = false;
            btnmodcantidad.Visible = false;
            btnmodprecio.Visible = false;
            btnaceptar3.Visible = false;
            btncancelar3.Visible = false;

        }

        protected void btncancelar_Click(object sender, EventArgs e)
        {
            lbnombre.Visible = false;
            lbdescripcion.Visible = false;
            lbidpro.Visible = false;
            textidpro.Visible = false;
            textednombre.Visible = false;
            texteddescripcion.Visible = false;
            btninactivar.Visible = false;
            btneditar.Visible = false;
            btnmodcantidad.Visible = false;
            btnmodprecio.Visible = false;
            btnaceptar.Visible = false;
            btncancelar.Visible = false;
        }

        protected void btncancelar2_Click(object sender, EventArgs e)
        {
            lbPU.Visible = false;
            textPU.Visible = false;
            btninactivar.Visible = false;
            btneditar.Visible = false;
            btnmodcantidad.Visible = false;
            btnmodprecio.Visible = false;
            btnaceptar2.Visible = false;
            btncancelar2.Visible = false;
        }

        protected void btncancelar3_Click(object sender, EventArgs e)
        {
            lbcant.Visible = false;
            textcant.Visible = false;
            btninactivar.Visible = false;
            btneditar.Visible = false;
            btnmodcantidad.Visible = false;
            btnmodprecio.Visible = false;
            btnaceptar3.Visible = false;
            btncancelar3.Visible = false;

        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Materiasinactivos.aspx");
        }
    }
 }
 
