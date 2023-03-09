<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Site1.Master" AutoEventWireup="true" CodeBehind="Altademateriaprima.aspx.cs" Inherits="UmbrellaCorpGestion.MaterialProveedores.Altademateriaprima" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%;">
        <tr>
            <td style="text-decoration: underline; width: 536px;">ALTA DE MATERIA PRIMA</td>
            <td style="text-decoration: underline">&nbsp;</td>
            <td style="text-decoration: underline">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 536px">NOMBRE:<asp:TextBox ID="textnombre" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="textnombre" ErrorMessage="OBLIGATORIO" ForeColor="#FF3300">OBLIGATORIO</asp:RequiredFieldValidator>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 536px">DESCRIPCIÓN:<asp:TextBox ID="textdesc" runat="server" Height="192px" Width="318px"></asp:TextBox>
                <table style="width:100%;">
                    <tr>
                        <td>PROVEEDOR:<asp:DropDownList ID="ddpro" runat="server" DataSourceID="SqlDataSource1" DataTextField="razonSocial" DataValueField="Id">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BD %>" SelectCommand="SELECT [razonSocial], [Id] FROM [Proveedores] WHERE (([activo] = @activo) AND ([certificado] = @certificado))">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="true" Name="activo" Type="Boolean" />
                                    <asp:Parameter DefaultValue="true" Name="certificado" Type="Boolean" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>PRECIO UNITARIO:<asp:TextBox ID="textpu" runat="server"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="textpu" ErrorMessage="SOLO NUMEROS" ForeColor="#FF3300" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>MONEDA:<asp:DropDownList ID="ddmoneda" runat="server">
                            <asp:ListItem>USD</asp:ListItem>
                            <asp:ListItem>ARS</asp:ListItem>
                            <asp:ListItem>LIBRA</asp:ListItem>
                            <asp:ListItem>EUR</asp:ListItem>
                            </asp:DropDownList>
                            <table style="width:100%;">
                                <tr>
                                    <td style="height: 23px">CANTIDAD:<asp:TextBox ID="textcantidad" runat="server"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="textcantidad" ErrorMessage="SOLO NUMEROS" ForeColor="Red" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                                    </td>
                                    <td style="height: 23px"></td>
                                    <td style="height: 23px"></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Button ID="btngenerar" runat="server" OnClick="btngenerar_Click" Text="GENERAR" />
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="LBerror" runat="server" ForeColor="#CC3300"></asp:Label>
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
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
