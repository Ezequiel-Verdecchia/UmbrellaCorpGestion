using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using UmbrellaCorpGestion.ClasesCustom;

namespace UmbrellaCorpGestion
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnAceptar_Click(object sender, EventArgs e)
        {
            Label1.Text = " ";

            string sqlValidarUser = @"SELECT COUNT(*)
                      FROM Usuarios
                      WHERE username = @username
                      AND pass = @pass
                      AND activo = 'true'";

            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BD"].ToString()))
                {
                    conn.Open();
                    SqlCommand command = new SqlCommand(sqlValidarUser, conn);
                    command.Parameters.AddWithValue("@username", TBNU.Text);
                    command.Parameters.AddWithValue("@pass", Encriptado.ConvertirHash(TBPASS.Text));

                    int Count = Convert.ToInt32(command.ExecuteScalar());

                    if (Count == 0)
                    {
                        Label1.ForeColor = Color.Red;
                        Label1.Text = "Usuario o contraseña incorrecta";
                    }
                    else
                    {
                        FormsAuthentication.RedirectFromLoginPage(TBNU.Text, true);
                        Response.Redirect("Bienvenidos.aspx");
                    }
                }

            }
            catch(Exception)
            {
                Label1.ForeColor = Color.Red;
                Label1.Text = "Error,intente mas tarde o llame al administrador ";
            }

         }   
    }   
            
}