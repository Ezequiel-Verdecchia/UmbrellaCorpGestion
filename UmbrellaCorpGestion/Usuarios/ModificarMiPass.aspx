<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Site1.Master" AutoEventWireup="true" CodeBehind="ModificarMiPass.aspx.cs" Inherits="UmbrellaCorpGestion.Usuarios.ModificarMiPass" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="auto-style16" style="text-decoration: underline; width: 481px"><strong>CAMBIO DE CONTRASEÑA</strong></td>
            <td><strong></strong></td>
            <td><strong></strong></td>
        </tr>
        <tr>
            <td style="width: 481px; height: 64px"><strong>Ingrese<br />
&nbsp;contraseña actual:</strong><asp:TextBox ID="textICA" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="textICA" ErrorMessage="OBLIGATORIO" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td style="height: 64px"></td>
            <td style="height: 64px"></td>
        </tr>
        <tr>
            <td style="width: 481px">
                <table style="width: 100%; height: 269px;">
                    <tr>
                        <td class="auto-style18" style="height: 11px; width: 127px"><strong>Nueva contraseña:</strong></td>
                        <td class="auto-style18" style="height: 11px">
                            <asp:TextBox ID="textNC" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="textNC" ErrorMessage="OBLIGATORIO" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                        <td class="auto-style18" style="height: 11px"></td>
                    </tr>
                    <tr>
                        <td style="width: 127px; height: 18px"><strong>Repertir contraseña:</strong></td>
                        <td style="height: 18px">
                            <asp:TextBox ID="textRC" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="textRC" ErrorMessage="OBLIGATORIO" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                        <td style="height: 18px"><strong></strong></td>
                    </tr>
                    <tr>
                        <td style="height: 15px; width: 127px">&nbsp;</td>
                        <td style="height: 15px">
                            <asp:Button ID="btnaceptar" runat="server" OnClick="btnaceptar_Click" Text="ACEPTAR" />
                            <br />
                            <asp:Label ID="lberror" runat="server"></asp:Label>
                        </td>
                        <td style="height: 15px"></td>
                    </tr>
                </table>
            </td>
            <td><strong></strong></td>
            <td><strong></strong></td>
        </tr>
    </table>
</asp:Content>
