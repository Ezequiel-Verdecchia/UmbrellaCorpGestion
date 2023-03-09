using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UmbrellaCorpGestion.Productos
{
    public partial class AltaProducto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            string consulta = @"SELECT *
                               FROM MateriaPrima
                               WHERE Id=(@Id)  ";


            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BD"].ToString()))
            {
                try
                {
                    SqlCommand sqlCommand = new SqlCommand(consulta, conn);
                    sqlCommand.Parameters.AddWithValue("Id", DropDownList1.SelectedValue.ToString());
                    
                    conn.Open();
                    SqlDataReader leerbd = sqlCommand.ExecuteReader();
                    if (leerbd.Read())
                    {

                        lbPU.Text = "PRECIO UNITARIO: " + leerbd["precioUnitario"].ToString();
                        lbcantidad.Text = "CANTIDAD: " + leerbd["cantidad"].ToString();
                        lbPRO.Text = "ID DEL PROVEEDOR: " + leerbd["idpro"].ToString();
                        leerbd.Close();
                        


                    }
                    else
                    {
                        leerbd.Close();
                        lbPU.Text = " SIN DATOS DEFINIDOS ";
                        lbcantidad.Text = " SIN DATOS DEFINIDOS ";
                        lbPRO.Text = " SIN DATOS DEFINIDOS ";
                    }


                }
                catch (Exception ex)
                {
                    lberror.ForeColor = Color.Red;
                    lberror.Text = ex.Message;//"Error,Intente mas Tarde";
                }
                
            }
            Button1.Visible = true;
            
        }
        
        public void validar()
        {
            string consulta = @"SELECT *
                               FROM MateriaPrima
                               WHERE Id=(@Id)  ";
            string validarcant = @"SELECT cantidad 
                                  FROM MateriaPrima 
                                   WHERE Id = @Id ";
             

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BD"].ToString()))
            {
                try
                {
                    conn.Open();
                    SqlCommand sqlCommand = new SqlCommand(consulta, conn);
                    sqlCommand.Parameters.AddWithValue("Id", DropDownList1.SelectedValue.ToString());
                    int Idmp = Convert.ToInt32(sqlCommand.ExecuteScalar());
       
                    SqlCommand cmdValidarcant = new SqlCommand(validarcant, conn);
                    cmdValidarcant.Parameters.AddWithValue("@Id", Idmp);
                    int Cantmp = Convert.ToInt32(cmdValidarcant.ExecuteScalar());
                    int cant = int.Parse(textcantS.Text);

                    if (cant > Cantmp)
                    {
                        Label1.ForeColor = Color.Red;
                        Label1.Text = "la cantidad no puede ser mayor";

                    }
                    else
                    {
                        conn.Close();

                        string Acant = "UPDATE MateriaPrima " +
                            "SET cantidad=cantidad-" + cant.ToString() + 
                            " WHERE Id= @Id";
                        conn.Open();
                        SqlCommand act = new SqlCommand(Acant, conn);
                        act.Parameters.AddWithValue("@Id", Idmp);
                        act.ExecuteNonQuery();
                        conn.Close();
                        Label1.ForeColor = Color.Green;
                        Label1.Text = " cantidad actualizada";
                        btngenerar.Visible = true;

                    }




                }
                catch (Exception )
                {
                    Label1.ForeColor = Color.Red;
                    Label1.Text = "error,llame al administrador o pruebe mas tarde";
                 }
                  
            }
            
        }


        protected void btngenerar_Click(object sender, EventArgs e)
        {
            lberror.Text = "";


            string sqlCrear = @"INSERT INTO Producto (nombre,descripcion,PU,cantidad,activo) 
                                  VALUES (@nombre, @descripcion ,@PU,@cantidad,@activo) ";
             string sqlValidar = @"SELECT *
                                   FROM Producto
                                   WHERE nombre = @nombre ";
         


            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BD"].ToString()))
                {


                    SqlCommand commandValidacion = new SqlCommand(sqlValidar, conn);
                    commandValidacion.Parameters.AddWithValue("nombre ", textnombre.Text);
                    conn.Open();
                    SqlDataReader leerbd = commandValidacion.ExecuteReader();

                    if (leerbd.Read() == true)
                    {
                       
                        lberror.ForeColor = Color.Red;
                        lberror.Text = "El nombre ya existe, elija otro";
                        conn.Close();
                        return;
                    }
                    else 
                    { 

                        conn.Close();
                            SqlCommand cmdinsetar = new SqlCommand(sqlCrear, conn);

                            cmdinsetar.Parameters.AddWithValue("nombre", textnombre.Text);
                            cmdinsetar.Parameters.AddWithValue("descripcion", textdesc.Text);
                            cmdinsetar.Parameters.AddWithValue("cantidad", textcantP.Text);
                            cmdinsetar.Parameters.AddWithValue("PU ", textPU.Text);
                            cmdinsetar.Parameters.AddWithValue("activo", true);
                            conn.Open();
                            cmdinsetar.ExecuteNonQuery();
                            conn.Close();
                            lberror.ForeColor = Color.Green;
                            lberror.Text = "EL PRODUCTO:  " + textnombre.Text + " ha sido de alta exitosamente.";
                        

                    }

                     
                }
               
            }
            catch (Exception ex)
            {
                
                lberror.ForeColor = Color.Red;
                lberror.Text = ex.Message;//"error,llame al administrador o pruebe mas tarde";

            }
         
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            validar();
        }
    }
}

    
