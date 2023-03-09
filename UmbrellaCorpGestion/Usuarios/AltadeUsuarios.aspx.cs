using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UmbrellaCorpGestion.ClasesCustom;

namespace UmbrellaCorpGestion.Usuarios
{
    public partial class AltadeUsuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
       
        protected void Baguegar_Click(object sender, EventArgs e)
        {

            LBerror.Text = "";
            string sqlPermisos = @"INSERT INTO PermisoUsuarios(idUsuario,idPermiso)
                                                                VALUES(@idUsuario,2)";
              string sqlCrear = @"INSERT INTO Usuarios (username,pass,mail,fechaIngreso,activo) 
                                  VALUES (@username, @pass, @mail,@fechaIngreso,@activo) SELECT SCOPE_IDENTITY()";
                string sqlValidar = @"SELECT *
                                   FROM Usuarios 
                                   WHERE username = @username";
            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BD"].ToString()))
                {

                    SqlCommand commandValidacion = new SqlCommand(sqlValidar, conn);
                    commandValidacion.Parameters.AddWithValue("username", NU.Text);
                    conn.Open();
                    SqlDataReader leerbd = commandValidacion.ExecuteReader();

                    if (leerbd.Read() == true)
                    {
                        LBerror.ForeColor= Color.Red;
                        LBerror.Text = "El nombre ya existe, elija otro";
                        conn.Close();
                        return;
                    }
                    else
                    {

                        conn.Close();
                        SqlCommand cmdinsetar = new SqlCommand(sqlCrear, conn);
                        cmdinsetar.Parameters.AddWithValue("username", NU.Text);
                        cmdinsetar.Parameters.AddWithValue("pass", Encriptado.ConvertirHash(PASS.Text));
                        cmdinsetar.Parameters.AddWithValue("mail", EMAIL.Text);
                        cmdinsetar.Parameters.AddWithValue("fechaIngreso", DateTime.Now);
                        cmdinsetar.Parameters.AddWithValue("activo", true);
                        SqlCommand cmdPermisos = new SqlCommand(sqlPermisos, conn);
                        
                        conn.Open();
                        
                        string IDULTIMO = Convert.ToInt32(cmdinsetar.ExecuteScalar()).ToString();

                        LBerror.ForeColor = Color.Green;
                        LBerror.Text = "El usuario '" + NU.Text + "' ha sido de alta exitosamente.";
                        cmdPermisos.Parameters.AddWithValue("idUsuario", IDULTIMO);
                       
                        
                        cmdPermisos.ExecuteNonQuery();
                        conn.Close();
                    }


                }
            }
            catch(Exception )
            {
                LBerror.ForeColor= Color.Red;
                LBerror.Text = "error,llame al administrador o pruebe mas tarde";
                
            }
        }


    }
}
    