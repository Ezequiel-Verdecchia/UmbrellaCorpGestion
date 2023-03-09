using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace UmbrellaCorpGestion.ClasesCustom
{
    public class Enviar
    {
        public static void Mail(  string mail, string nvaContrasenia, Label lbmsj)
        {
            System.Net.Mail.MailMessage mmsg = new System.Net.Mail.MailMessage();
            mmsg.To.Add(mail);
            mmsg.Subject = "La contraseña se esta restableciendo";
            mmsg.SubjectEncoding = System.Text.Encoding.UTF8;
            mmsg.Body = "Su nueva contraseña es>> " + nvaContrasenia;
            mmsg.SubjectEncoding = System.Text.Encoding.UTF8;
            mmsg.IsBodyHtml = false;

            mmsg.From = new System.Net.Mail.MailAddress("admin@gmail.com");
            System.Net.Mail.SmtpClient cliente = new System.Net.Mail.SmtpClient();
            cliente.Credentials = new System.Net.NetworkCredential("admin@gmail.com", "admin");
            cliente.Port = 587;
            cliente.EnableSsl = true;
            cliente.Host = "smtp.gamil.com";
            try
            {
                cliente.Send(mmsg);
            }

            catch (System.Net.Mail.SmtpException ex)
            {
                lbmsj.Text = ex.Message;

            }


        }
    }
}


          

          