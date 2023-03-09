using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UmbrellaCorpGestion.ClasesCustom;

namespace UmbrellaCorpGestion.Usuarios
{
    public partial class ModificarMiPass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnaceptar_Click(object sender, EventArgs e)
        {
            string validar = @"SELECT * FROM Usuarios WHERE username= (@username) AND pass= (@pass)   ";
            string modContra = @"UPDATE Usuarios " +
                                "SET pass= (@pass)" +
                                "WHERE username= (@username) ";
            string username = Thread.CurrentPrincipal.Identity.Name;
            string pass = textICA.Text;
            string passActualEncriptada = Encriptado.ConvertirHash(pass);
            string newPass = textNC.Text;
            string repePass = textRC.Text;
            
            
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BD"].ToString()))
                {
                    if (newPass == repePass)
                    {
                        try
                        {
                            SqlCommand commandValidation = new SqlCommand(validar, conn);
                            commandValidation.Parameters.AddWithValue("username", username);
                            commandValidation.Parameters.AddWithValue("pass", passActualEncriptada);
                            conn.Open();
                            SqlDataReader leerbd = commandValidation.ExecuteReader();
                            if (leerbd.Read() == true)
                            {
                                conn.Close();

                                try
                                {

                                    SqlConnection conn2 = new SqlConnection(ConfigurationManager.ConnectionStrings["BD"].ToString());

                                    SqlCommand command = new SqlCommand(modContra, conn2);

                                    newPass = Encriptado.ConvertirHash(newPass);

                                    command.Parameters.AddWithValue("pass", newPass);
                                    command.Parameters.AddWithValue("username", username);
                                    conn2.Open();
                                    command.ExecuteNonQuery();
                                    conn2.Close();

                                    lberror.ForeColor = Color.Green;
                                    lberror.Text = "Se ha cambiado la contraseña exitosamente";

                                }
                                catch (Exception )
                                {
                                    lberror.ForeColor = Color.Red;
                                lberror.Text =  "error";
                                }


                            }
                            else
                            {
                                lberror.ForeColor = Color.Red;
                                lberror.Text = "Contraseña  incorrecta";
                            }
                        }
                        catch(Exception )
                        {
                            lberror.ForeColor = Color.Red;
                            lberror.Text = "error";
                        }
                    }
                    else
                    {
                        lberror.ForeColor = Color.Red;
                        lberror.Text = "verificar las contraseñas";
                    }

                }
          
            

        }
    }
}