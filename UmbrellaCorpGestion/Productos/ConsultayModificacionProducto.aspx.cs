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

namespace UmbrellaCorpGestion.Productos
{
    public partial class ConsultayModificacionProducto : System.Web.UI.Page
    {
        protected void BotonesOn()
        {
            btneditar.Visible = true;
            btninactivar.Visible = true;
            btnmodcant.Visible = true;
            btnmodPU.Visible = true;


        }
        protected void BotonesOff()
        {
            btneditar.Visible = false;
            btninactivar.Visible = false;
            btnmodcant.Visible = false;
            btnmodPU.Visible = false;


        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnbuscar_Click(object sender, EventArgs e)
        {
            lberror.Text = "";
            GridView2.Visible = true;
            string Consulta = @"SELECT *
                             FROM Producto
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
                    GridView2.DataSource = dt;
                    GridView2.DataBind();
                    conn.Close();
                }
                catch (Exception)
                {

                    lberror.ForeColor = Color.Red;
                    lberror.Text = "Error,Intente mas Tarde";


                }
            }
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            BotonesOn();
        }

        protected void btneditar_Click(object sender, EventArgs e)
        {
            lberror.Text = " ";
            textnp.Visible = true;
            textdesc.Visible = true;
            btnaceptar1.Visible = true;
            btncancelar1.Visible = true;
            lbn.Visible = true;
            lbd.Visible = true;

           
        }
        protected void btnaceptar1_Click(object sender, EventArgs e)
        {
            string consulta = @"UPDATE Producto " +
                          "SET nombre= (@nombre ), descripcion=(@descripcion) " +
                          "WHERE Id=(@Id) ";
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BD"].ToString()))
            {

                try

                {
                    SqlCommand comd = new SqlCommand(consulta, conn);


                    comd.Parameters.AddWithValue("nombre", textnp.Text);
                    comd.Parameters.AddWithValue("descripcion", textdesc.Text);
                    comd.Parameters.AddWithValue("Id", GridView2.SelectedDataKey.Value.ToString());
                    conn.Open();
                    lberror.ForeColor = Color.Green;
                    lberror.Text = "Se ha cambiado EDITADO al PRODUCTO exitosamente";

                }
                catch (Exception )
                {

                    lberror.ForeColor = Color.Red;
                    lberror.Text = "Error,Intente mas Tarde";


                }
                BotonesOff();
                textnp.Visible = false;
                textdesc.Visible = false;
                btnaceptar1.Visible =false;
                btncancelar1.Visible = false;
                lbn.Visible = false;
                lbd.Visible = false;



            }
        }
         protected void btncancelar1_Click(object sender, EventArgs e)
        {
            textnp.Visible = false;
            textdesc.Visible = false;
            lbn.Visible = false;
            lbd.Visible = false;
            btncancelar1.Visible = false;
            btnaceptar1.Visible = false;
            BotonesOff();
        }   
        protected void btninactivar_Click(object sender, EventArgs e)
            {

                string consulta = @"UPDATE Producto " +
                                     "SET activo=(@activo)" +
                                     "WHERE Id=(@Id) ";

                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BD"].ToString()))
                {

                    try

                    {
                        SqlCommand comd = new SqlCommand(consulta, conn);

                        comd.Parameters.AddWithValue("activo", false);
                        comd.Parameters.AddWithValue("Id", GridView2.SelectedDataKey.Value.ToString());

                        conn.Open();
                        comd.ExecuteNonQuery();
                        conn.Close();

                        lberror.ForeColor = Color.Green;
                        lberror.Text = "Se ha cambiado INACTIVADO al PRODUCTO exitosamente";

                    }
                    catch (Exception)
                    {

                        lberror.ForeColor = Color.Red;
                        lberror.Text = "Error,Intente mas Tarde";


                    }
                    BotonesOff();

                }
            }

        protected void btnmodPU_Click(object sender, EventArgs e)
        {
            textPU.Visible = true;
            btnaceptar2.Visible = true;
            btncancelar2.Visible = true;
            lbp.Visible = true;
        }

        protected void btnmodcant_Click(object sender, EventArgs e)
        {
            textcant.Visible = true;
            btnaceptar3.Visible = true;
            btncancelar3.Visible = true;
            lbc.Visible = true;
        }

        protected void btnaceptar2_Click1(object sender, EventArgs e)
        {
            string consulta = @"UPDATE Producto " +
                                          "SET PU = (@PU) " +
                                          "WHERE Id=(@Id) ";
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BD"].ToString()))
            {

                try

                {
                    SqlCommand comd = new SqlCommand(consulta, conn);



                    comd.Parameters.AddWithValue("PU", textPU.Text);
                    comd.Parameters.AddWithValue("Id", GridView2.SelectedDataKey.Value.ToString());

                    conn.Open();
                    comd.ExecuteNonQuery();
                    conn.Close();

                    lberror.ForeColor = Color.Green;
                    lberror.Text = "Se ha cambiado MODIFICADO el precio  exitosamente";

                }
                catch (Exception)
                {

                    lberror.ForeColor = Color.Red;
                    lberror.Text = "Error,Intente mas Tarde";


                }
                BotonesOff();
                textPU.Visible = false;
                btncancelar2.Visible = false;
                btnaceptar2.Visible = false;
                lbp.Visible = false;

            }
        }

        protected void btncancelar2_Click1(object sender, EventArgs e)
        {
            textPU.Visible = false;
            btnaceptar2.Visible = false;
            btncancelar2.Visible = false;
            lbp.Visible = false;
            BotonesOff();

        }

        protected void btnaceptar3_Click1(object sender, EventArgs e)
        {
            string consulta = @"UPDATE Producto " +
                                         "SET cantidad=(@cantidad) " +
                                         "WHERE Id=(@Id) ";
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BD"].ToString()))
            {

                try

                {
                    SqlCommand comd = new SqlCommand(consulta, conn);



                    comd.Parameters.AddWithValue("cantidad", textcant.Text);
                    comd.Parameters.AddWithValue("Id", GridView2.SelectedDataKey.Value.ToString());

                    conn.Open();
                    comd.ExecuteNonQuery();
                    conn.Close();

                    lberror.ForeColor = Color.Green;
                    lberror.Text = "Se ha cambiado MODIFICADO la cantidad exitosamente";

                }
                catch (Exception)
                {

                    lberror.ForeColor = Color.Red;
                    lberror.Text = "Error,Intente mas Tarde";


                }
                BotonesOff();
                textcant.Visible = false;
                btnaceptar3.Visible = false;
                btncancelar3.Visible = false;
                lbc.Visible = false;

            }
        }

        protected void btncancelar3_Click1(object sender, EventArgs e)
        {
            textcant.Visible = false;
            btnaceptar3.Visible = false;
            btncancelar3.Visible = false;
            lbc.Visible = false;
            BotonesOff();
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProductosInactivos.aspx");
        }
    }
}