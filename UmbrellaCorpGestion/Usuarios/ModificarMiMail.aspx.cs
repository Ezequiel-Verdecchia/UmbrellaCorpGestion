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

namespace UmbrellaCorpGestion.Usuarios
{
    public partial class ModificarMiMail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnAceptar_Click(object sender, EventArgs e)
        {
            string username = Thread.CurrentPrincipal.Identity.Name;

            string Consulta = @"UPDATE Usuarios " +
                "SET mail=(@mail)" +
                "WHERE username=(@username) ";
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BD"].ToString()))

            {
                try
                {
                    SqlCommand comd = new SqlCommand(Consulta, conn);

                    comd.Parameters.AddWithValue("mail", NuevoMail.Text);
                    comd.Parameters.AddWithValue("username", username);
                    conn.Open();
                    comd.ExecuteNonQuery();
                    conn.Close();

                    Label1.ForeColor = Color.Green;
                    Label1.Text = "Se ha cambiado el mail exitosamente";
                }
                catch (Exception ex)
                {
                    Label1.ForeColor = Color.Red;
                    Label1.Text = "Error, volvé a intentarlo más tarde";
                    Label1.Text = ex.Message;

                }
            }
        }
    }
}