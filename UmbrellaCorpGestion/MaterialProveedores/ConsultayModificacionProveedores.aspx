<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Site1.Master" AutoEventWireup="true" CodeBehind="ConsultayModificacionProveedores.aspx.cs" Inherits="UmbrellaCorpGestion.MaterialProveedores.ConsultayModificacionProveedores" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%;">
        <tr>
            <td style="width: 485px">
                <table style="width:137%; height: 340px;">
                    <tr>
                        <td style="width: 507px">
                            <asp:GridView ID="GridView2" runat="server" DataKeyNames="Id" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" Width="311px">
                                <AlternatingRowStyle BackColor="#F7F7F7" />
                                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                                <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                                <SortedDescendingHeaderStyle BackColor="#3E3277" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BD %>" SelectCommand="SELECT * FROM [Proveedores]"></asp:SqlDataSource>
                            <br />
                            <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">ProveedoresInactivos</asp:LinkButton>
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 507px">
                            INGRESE BUSQUEDA:<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem>NombreDePro.</asp:ListItem>
                    <asp:ListItem>CUIT</asp:ListItem>
                </asp:DropDownList>
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 507px">
                <asp:RadioButton ID="RadioButton1" runat="server" Text="CERTIFIACOS" Checked="True" GroupName="status" />
                <asp:RadioButton ID="RadioButton2" runat="server" Text="NO CERTIFIACOS" Checked="false" GroupName="status" />
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
                <asp:GridView ID="GridView1" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="Id" ForeColor="Black" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField SelectText="&gt;&gt;&gt;&gt;&gt;&gt;&gt;" ShowSelectButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="Gray" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                <asp:Button ID="BtnInactivar" runat="server" Height="27px" OnClick="BtnInactivar_Click" Text="INACTIVAR" Width="94px" Visible="False" />
                <asp:Button ID="BtnEditar" runat="server" Height="29px" Text="EDITAR" Visible="False" Width="88px" OnClick="BtnEditar_Click" />
                <br />
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 485px">
                <asp:RadioButton ID="RadioButton3" runat="server" Text="CERTIFICADO" Visible="False" />
                <asp:RadioButton ID="RadioButton4" runat="server" Text="NO CERTIFICADO" Visible="False" />
                <br />
                <asp:TextBox ID="textcuit" runat="server" Visible="False"></asp:TextBox>
                <asp:Button ID="btnaceptarcuit" runat="server" OnClick="btnaceptarcuit_Click" Text="ACEPTAR" Visible="False" />
                <asp:Button ID="btncancelarcuit" runat="server" OnClick="btncancelarcuit_Click" Text="CANCELAR" Visible="False" />
                <br />
                <br />
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 485px">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="BUSCAR" />
                <br />
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
