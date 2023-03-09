<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Site1.Master" AutoEventWireup="true" CodeBehind="AltaProveedores.aspx.cs" Inherits="UmbrellaCorpGestion.MaterialProveedores.AltaProveedores" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%;">
    <tr>
        <td style="text-decoration: underline"><strong>Alta de Proveedores</strong></td>
        <td style="text-decoration: underline"><strong></strong></td>
        <td style="text-decoration: underline"><strong></strong></td>
    </tr>
    <tr>
        <td>Razon Social:<asp:TextBox ID="TextBoxRazonSocial" runat="server"></asp:TextBox>
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CUIT:<asp:TextBox ID="TextBoxCUIT" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxCUIT" ErrorMessage="Campo OBLIGATORIO" ForeColor="Red"></asp:RequiredFieldValidator>
            <table style="width:100%;">
            <tr>
                <td>
                    <asp:CheckBox ID="CheckBoxCertificado" runat="server" Checked="True" />
                    Esta Certificado?</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="BtnRegistrar" runat="server" Text="Registrar" OnClick="BtnRegistrar_Click" />
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            </table>
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
</table>
</asp:Content>
