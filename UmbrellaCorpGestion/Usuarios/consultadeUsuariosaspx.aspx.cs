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
using UmbrellaCorpGestion.ClasesCustom;





namespace UmbrellaCorpGestion.Usuarios
{
    public partial class consultadeUsuariosaspx : System.Web.UI.Page
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
            return  nuevacadena;
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void botonesEnOn()
        {
            BtnModificarMail.Visible = true;
            BtnDesvincular.Visible = true;
            BtnRestablecerCont.Visible = true;

        }
        protected void botonesEnOff()
        {
            BtnModificarMail.Visible = false;
            BtnDesvincular.Visible = false;
            BtnRestablecerCont.Visible = false;
        }
        protected void Button4_Click(object sender, EventArgs e)
        {
            Label1.Text = " ";

            string Consulta = @"SELECT *
                             FROM Usuarios 
                             WHERE";

            if (DropDownList1.SelectedValue.ToString() == "Username")
            {
                Consulta += " username = @username";
            }
            if (DropDownList1.SelectedValue.ToString() == "Id")
            {
                Consulta += " Id = @Id";
            }
            if (RadioButton1.Checked == true)
            {
                Consulta += " AND activo = 'true' ";
            }
            if (RadioButton2.Checked == true)
            {
                Consulta += " AND activo = 'false' ";
            }
            if (RadioButton3.Checked == true)
            {
                Consulta += "AND activo = 'true' OR activo = 'false' ";
            }

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BD"].ToString()))
            {



                try

                {
                    SqlCommand cmd = new SqlCommand(Consulta, conn);
                    cmd.Parameters.AddWithValue("username", TextBox1.Text);
                    cmd.Parameters.AddWithValue("Id", TextBox1.Text);

                    conn.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    conn.Close();
                }
                catch (Exception) {

                    Label1.ForeColor = Color.Red;
                    Label1.Text = "Error,Intente mas Tarde";


                }

            }

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {


            botonesEnOn();

        }

        protected void BtnModificarMail_Click(object sender, EventArgs e)
        {
            TextBoxMailMod.Visible = true;
            BtnSiDeModMail.Visible = true;
            BtnNoDeModMail.Visible = true;

        }

        protected void BtnSiDeModMail_Click(object sender, EventArgs e)
        {

            Label1.Text = " ";
            string Consulta = @"UPDATE usuarios " +
                "SET mail=(@mail)" +
                "WHERE username=(@username)";


            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BD"].ToString()))

            {
                try
                {
                    SqlCommand comd = new SqlCommand(Consulta, conn);

                    comd.Parameters.AddWithValue("mail", TextBoxMailMod.Text);
                    comd.Parameters.AddWithValue("username", GridView1.SelectedDataKey.Value.ToString());
                    conn.Open();
                    comd.ExecuteNonQuery();
                    conn.Close();

                    Label1.ForeColor = Color.Green;
                    Label1.Text = "Se ha cambiado el mail exitosamente";
                }
                catch (Exception)
                {
                    Label1.ForeColor = Color.Red;
                    Label1.Text = "Error, volvé a intentarlo más tarde";


                }
            }

            TextBoxMailMod.Visible = false;
            BtnSiDeModMail.Visible = false;
            BtnNoDeModMail.Visible = false;
            botonesEnOff();
        }

        protected void BtnNoDeModMail_Click(object sender, EventArgs e)
        {
            TextBoxMailMod.Visible = false;
            BtnSiDeModMail.Visible = false;
            BtnNoDeModMail.Visible = false;
            botonesEnOff();

        }
        protected void BtnDesvincular_Click(object sender, EventArgs e)
        {
            BtnSiDesvinvular.Visible = true;
            BtnNoDesvincular.Visible = true;
            LabelDeDesvincular.Text = "¿Estas seguro de desvincular al usuario?";
        }

        protected void BtnSiDesvinvular_Click(object sender, EventArgs e)
        {
            Label1.Text = " ";
            string Consulta = @"UPDATE usuarios " +
                "SET activo=(@activo)" +
                "WHERE username=(@username)";


            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BD"].ToString()))

            {
                try
                {
                    SqlCommand comd = new SqlCommand(Consulta, conn);

                    comd.Parameters.AddWithValue("activo", false);
                    comd.Parameters.AddWithValue("username", GridView1.SelectedDataKey.Value.ToString());

                    conn.Open();
                    comd.ExecuteNonQuery();
                    conn.Close();

                    Label1.ForeColor = Color.Green;
                    Label1.Text = "Se ha Desvinculado el Usuario";
                }
                catch (Exception)
                {
                    Label1.ForeColor = Color.Red;
                    Label1.Text = "Error, volvé a intentarlo más tarde";


                }
            }


            LabelDeDesvincular.Visible = false;
            BtnSiDesvinvular.Visible = false;
            BtnNoDesvincular.Visible = false;
            botonesEnOff();
        }
        protected void BtnNoDesvincular_Click(object sender, EventArgs e)
        {

            LabelDeDesvincular.Visible = false;
            BtnSiDesvinvular.Visible = false;
            BtnNoDesvincular.Visible = false;
            botonesEnOff();
        }

        protected void BtnRestablecerCont_Click(object sender, EventArgs e)
        {
            LabelDeContraseña.Text = "¿Estas Seguro De Restablecer la Contraseña?";
            BtnSiContraseña.Visible = true;
            BtnNoContraseña.Visible = true;
        }

        protected void BtnSiContraseña_Click(object sender, EventArgs e)
        {
            string username = GridView1.SelectedRow.Cells[1].Text;
            string mail = GridView1.SelectedRow.Cells[2].Text;


            string mod = @"UPDATE usuarios " +
                "SET pass=(@pass)" +
                "WHERE username=(@username)";

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BD"].ToString());

            try
            {
                SqlCommand command = new SqlCommand(mod, conn);

                string passwordRandom = Random();

                Enviar.Mail(mail, passwordRandom, Label1);

                passwordRandom = Encriptado.ConvertirHash(passwordRandom);

                command.Parameters.AddWithValue("pass", passwordRandom);
                command.Parameters.AddWithValue("username", username);
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
        protected void BtnNoContraseña_Click(object sender, EventArgs e)
            {
                LabelDeContraseña.Visible = false;
                BtnSiContraseña.Visible = false;
                BtnNoContraseña.Visible = false;
                botonesEnOff();
            }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
            {

            }

           
        
    }
    

}