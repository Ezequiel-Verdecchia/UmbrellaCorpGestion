using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;

namespace UmbrellaCorpGestion.ClasesCustom
{
    public partial class Bienvenidos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = "Bienvenido Usuario: " + Thread.CurrentPrincipal.Identity.Name;
        }
    }
}