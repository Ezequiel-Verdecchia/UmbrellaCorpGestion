<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Site1.Master" AutoEventWireup="true" CodeBehind="AltadeUsuarios.aspx.cs" Inherits="UmbrellaCorpGestion.Usuarios.AltadeUsuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%;">
    <tr>
        <td style="height: 144px; width: 621px; font-size: xx-large">ALTA DE USUARIOS</td>
        <td class="auto-style14" style="text-align: center; height: 144px; font-size: xx-large">&nbsp;</td>
        <td class="auto-style14" style="height: 144px"></td>
    </tr>
    <tr>
        <td style="width: 621px">completa los campos obligatorios para crear un nuevo usuario:<hr />
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td style="width: 621px; height: 88px">
            <table style="width:100%;">
                <tr>
                    <td>Nombre<strong>:</strong></td>
                    <td>
                        <asp:TextBox ID="NU"  runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="NU" ErrorMessage="OBLIGATORIO" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>Contraseña<strong>:</strong></td>
                    <td>
                        <asp:TextBox ID="PASS" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="PASS" ErrorMessage="OBLIGATORIO" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style11" style="height: 28px">Email<strong>:</strong></td>
                    <td class="auto-style11" style="height: 28px">
                        <asp:TextBox ID="EMAIL" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="EMAIL" ErrorMessage="OBLIGATORIO" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style11" style="height: 28px"></td>
                </tr>
            </table>
        </td>
        <td style="height: 88px"></td>
        <td style="height: 88px">
            <br />
        </td>
    </tr>
</table>
<asp:Label ID="LBerror" runat="server"></asp:Label>
<br />
<asp:Button ID="Baguegar" runat="server" OnClick="Baguegar_Click" Text="Aceptar" />
<br />
</asp:Content>
