<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="UmbrellaCorpGestion.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            font-size: xx-large;
            width: 459px;
        }
        .auto-style2 {
            width: 459px;
        }
        .auto-style3 {
            text-align: center;
            font-size: xx-large;
            width: 793px;
        }
        .auto-style4 {
            width: 793px;
        }
        .auto-style5 {
            margin-left: 2px;
        }
        .auto-style6 {
            width: 455px;
        }
        .auto-style7 {
            font-size: large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table style="width:100%;">
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style3">Iniciar Sesión</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style4">
                    <asp:TextBox ID="TBNU" runat="server" Width="205px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style4">
                    <asp:TextBox ID="TBPASS" runat="server" Width="207px"></asp:TextBox>
                    <br />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <div>
            <table style="width:100%;">
                <tr>
                    <td class="auto-style6">&nbsp;</td>
                    <td>
                        <asp:Button ID="BtnAceptar" runat="server" CssClass="auto-style5" Height="35px" OnClick="BtnAceptar_Click" Text="Aceptar" Width="216px" />
&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style6">&nbsp;</td>
                    <td>
                        <asp:LinkButton ID="LinkButton1" runat="server">¿Olvido la Contraseña?</asp:LinkButton>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style6">&nbsp;</td>
                    <td>
                        <strong>
                        <asp:Label ID="Label1" runat="server" CssClass="auto-style7"></asp:Label>
                        </strong>
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
