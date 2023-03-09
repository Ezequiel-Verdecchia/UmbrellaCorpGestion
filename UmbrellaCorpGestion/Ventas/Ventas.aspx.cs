using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UmbrellaCorpGestion.Ventas
{
    public partial class Ventas : System.Web.UI.Page
    {
        public int total = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime fecha = DateTime.Today;
            lbFecha.Text = "Fecha: " + fecha.ToShortDateString();
            lbVendedor.Text = "Vendedor:" + Thread.CurrentPrincipal.Identity.Name;
        }

        protected void btnAprod_Click(object sender, EventArgs e)
        {

            string crearVenta = @"INSERT INTO VentasCabecera (id_usuario,id_cliente,tituloVenta,id_estado,fechaVenta,descripcion,total )
                                  VALUES(@id_usuario,@id_cliente,@tituloVenta,@id_estado,@fechaVenta,@descripcion,@total ) SELECT SCOPE_IDENTITY() ";
            string crearDetalle = @"INSERT INTO VentasDetalle (id_cabecera,id_producto,PU,cantidad )
                                    VALUES(@id_cabecera,@id_producto,@PU,@cantidad ) SELECT SCOPE_IDENTITY() ";



            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BD"].ToString()))
                {







                    string traeriduser = "SELECT Id FROM Usuarios WHERE username = @username";

                    SqlCommand cmdTraerUser = new SqlCommand(traeriduser, conn);
                    cmdTraerUser.Parameters.AddWithValue("@username", Thread.CurrentPrincipal.Identity.Name);
                    conn.Open();
                    int Iduser = Convert.ToInt32(cmdTraerUser.ExecuteScalar());
                    conn.Close();

                    SqlCommand insertar = new SqlCommand(crearVenta, conn);

                    insertar.Parameters.AddWithValue("id_usuario", Iduser);
                    insertar.Parameters.AddWithValue("id_cliente", DDcliente.SelectedValue);
                    insertar.Parameters.AddWithValue("tituloVenta", textnombre.Text);
                    insertar.Parameters.AddWithValue("total", total);
                    insertar.Parameters.AddWithValue("fechaVenta", DateTime.Now);
                    insertar.Parameters.AddWithValue("descripcion", textdesc.Text);
                    insertar.Parameters.AddWithValue("id_estado", 1);
                    conn.Open();
                    insertar.ExecuteNonQuery();
                    string IDULTIMO = Convert.ToInt32(insertar.ExecuteScalar()).ToString();
                    conn.Close();

                   

                    
                        string traerPU = "SELECT PU FROM Producto WHERE Id= @Id";
                        SqlCommand cmdTraerPU = new SqlCommand(traerPU, conn);
                        cmdTraerPU.Parameters.AddWithValue("@Id", DDproducto.SelectedValue);
                        conn.Open();
                        int PU = Convert.ToInt32(cmdTraerPU.ExecuteScalar());


                        SqlCommand cmdinsertar = new SqlCommand(crearDetalle, conn);
                        cmdinsertar.Parameters.AddWithValue("Id_cabecera", IDULTIMO);
                        cmdinsertar.Parameters.AddWithValue("id_producto", DDproducto.SelectedValue);
                        cmdinsertar.Parameters.AddWithValue("PU", PU);
                        cmdinsertar.Parameters.AddWithValue("cantidad", 1);
                        string ID = Convert.ToInt32(cmdinsertar.ExecuteScalar()).ToString();
                        conn.Close();

                        total = total + PU;
                        lbTotal.Text = Convert.ToInt32(total).ToString();

                        string llenarDG = "Select Id_detalle, id_cabecera, id_producto, PU, cantidad FROM VentasDetalle";
                        SqlCommand cmdllenar = new SqlCommand(llenarDG, conn);

                        SqlDataAdapter da = new SqlDataAdapter(cmdllenar);
                        DataTable dt = new DataTable();
                        conn.Open();
                        da.Fill(dt);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                        conn.Close();
                        lberror.Text = "creado";


                    
                    

                }




            }
            catch (Exception ex)


            {
                lberror.Text = ex.Message;
            }

        }

        protected void DDproducto_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnAprod.Visible = true;
        }

        protected void LConfirmar_Click(object sender, EventArgs e)
        {

            try
            {
                String crearcliente = @"INSERT into Cliente(nombre,contacto) VALUES(@nombre,@contacto ) ";
                String validarCliente = @"SELECT nombre FROM Cliente WHERE nombre=(@nombre) ";
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BD"].ToString()))
                {


                    SqlCommand comdValidar = new SqlCommand(validarCliente, conn);
                    comdValidar.Parameters.AddWithValue("nombre", textNombreCliente.Text);
                    conn.Open();
                    SqlDataReader leerbd = comdValidar.ExecuteReader();

                    if (leerbd.Read() == true)
                    {
                        conn.Close();
                        lberror.ForeColor = Color.Red;
                        lberror.Text = "Usuario existente, elige otro nombre";


                    }
                    else

                    {
                        conn.Close();
                        SqlCommand insertCliente = new SqlCommand(crearcliente, conn);

                        insertCliente.Parameters.AddWithValue("nombre", textNombreCliente.Text);
                        insertCliente.Parameters.AddWithValue("contacto", textContacto.Text);
                        conn.Open();
                        insertCliente.ExecuteNonQuery();
                        conn.Close();
                        lberror.Text = "creado";

                    }

                }
            }catch(Exception ) 
            {
                lberror.Text = "ERORR!!llame al ADM!!";
            }
               
                   
                

            
            


        }
    }
}

