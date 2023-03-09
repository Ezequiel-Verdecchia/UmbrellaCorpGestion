<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecuperarPass.aspx.cs" Inherits="UmbrellaCorpGestion.RecuperarPass" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 46px;
        }
        .auto-style2 {
            text-align: center;
            width: 260px;
        }
        .auto-style3 {
            text-decoration: underline;
        }
        .auto-style4 {
            width: 260px;
            height: 57px;
        }
        .auto-style8 {
            width: 46px;
            height: 57px;
        }
        .auto-style9 {
            height: 57px;
        }
        .auto-style10 {
            width: 46px;
            height: 72px;
        }
        .auto-style11 {
            width: 260px;
            height: 72px;
        }
        .auto-style12 {
            height: 72px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="width:100%;">
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style2"><span class="auto-style3">RECUPERACIÓN</span><br class="auto-style3" />
                        <span class="auto-style3">DE</span><br class="auto-style3" />
                        <span class="auto-style3">CONTRASEÑA</span></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style8">
                        <asp:Label ID="Label1" runat="server" Text="INGRESE USUARIO:"></asp:Label>
                    </td>
                    <td class="auto-style4">
                        <asp:TextBox ID="textusuario" runat="server" Width="191px"></asp:TextBox>
                    </td>
                    <td class="auto-style9"></td>
                </tr>
                <tr>
                    <td class="auto-style10"></td>
                    <td class="auto-style11">
                        <asp:Button ID="BtnEnviar" runat="server" BackColor="Lime" BorderColor="Black" Text="ENVIAR" Width="194px" OnClick="BtnEnviar_Click" />
                        <br />
                        <asp:Button ID="BtnVolver" runat="server" Text="VOLVER" Width="194px" OnClick="BtnVolver_Click" />
                    </td>
                    <td class="auto-style12"></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
