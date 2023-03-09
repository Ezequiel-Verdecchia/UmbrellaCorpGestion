using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UmbrellaCorpGestion.ClasesCustom;

namespace UmbrellaCorpGestion
{
    public partial class RecuperarPass : System.Web.UI.Page
    {
        private string Random()
        {
            Random obj = new Random();
            string posibles = "0123456789";
            int longitud = posibles.Length;
            char letra;
            int longitudnuevacadena = 6;
            string nuevacadena = "";
            for (int i = 0; i < longitudnuevacadena; i++)
            {
                letra = posibles[obj.Next(longitud)];
                nuevacadena += letra.ToString();
            }
            return nuevacadena;
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
  
        protected void BtnEnviar_Click(object sender, EventArgs e)
        { 
            string consulta = @"select mail FROM Usuarios WHERE username=(@username)";
            string mod = @"UPDATE usuarios " +
            "SET pass=(@pass)" +
             "WHERE username=(@username)";

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BD"].ToString());

            try
            {
                SqlCommand cmd = new SqlCommand(consulta, conn);
                cmd.Parameters.AddWithValue("username", textusuario.Text);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                SqlCommand command = new SqlCommand(mod, conn);

                string passwordRandom = Random();

                Enviar.Mail(consulta, passwordRandom, Label1);

                passwordRandom = Encriptado.ConvertirHash(passwordRandom);

                command.Parameters.AddWithValue("pass", passwordRandom);
                command.Parameters.AddWithValue("username", textusuario.Text);
                conn.Open();
                command.ExecuteNonQuery();
                conn.Close();

            }
            catch (Exception ex)
            {
                Label1.ForeColor = Color.Red;
                Label1.Text = ex.Message;

            }
        }

        protected void BtnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}        
    
