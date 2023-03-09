<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Site1.Master" AutoEventWireup="true" CodeBehind="ConsultayModificacionProducto.aspx.cs" Inherits="UmbrellaCorpGestion.Productos.ConsultayModificacionProducto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" Width="873px">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:BoundField DataField="nombre" HeaderText="Producto" SortExpression="nombre" />
            <asp:BoundField DataField="cantidad" HeaderText="cantidad" SortExpression="cantidad" />
            <asp:BoundField DataField="PU" HeaderText="PU" SortExpression="PU" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BD %>" SelectCommand="SELECT [nombre], [cantidad], [PU] FROM [Producto]"></asp:SqlDataSource>
    <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">PRODUCTOS INACTIVOS</asp:LinkButton>
    <table style="width: 101%; height: 427px;">
        <tr>
            <td style="text-decoration: underline; height: 4px"><strong>BUSCAR PRODUCTO:<asp:TextBox ID="textnombre" runat="server" Height="20px" Width="312px"></asp:TextBox>
                </strong></td>
            <td class="auto-style18" style="height: 4px"></td>
            <td class="auto-style18" style="height: 4px"></td>
        </tr>
        <tr>
            <td style="height: 221px">
                <asp:GridView ID="GridView2" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="Id" ForeColor="Black" Height="215px" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" Visible="False" Width="871px">
                    <Columns>
                        <asp:CommandField SelectText="&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;" ShowSelectButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
            </td>
            <td style="height: 221px">
                <br />
            </td>
            <td style="height: 221px"></td>
        </tr>
        <tr>
            <td style="height: 133px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <table style="width: 88%;">
                    <tr>
                        <td style="height: 34px; width: 240px">
                            <asp:Button ID="btneditar" runat="server" OnClick="btneditar_Click" Text="EDITAR" Visible="False" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btninactivar" runat="server" OnClick="btninactivar_Click" Text="INACTIVAR" Visible="False" />
&nbsp;&nbsp; </td>
                        <td style="height: 34px; width: 225px">
                            <asp:Button ID="btnmodPU" runat="server" OnClick="btnmodPU_Click" Text="MODIFICAR.PU" Visible="False" />
                        </td>
                        <td style="height: 34px">
                            <asp:Button ID="btnmodcant" runat="server" OnClick="btnmodcant_Click" Text="MODIFICAR.CANT" Visible="False" />
&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 240px">
                            <asp:Label ID="lbn" runat="server" Text="NOMBRE:" Visible="False"></asp:Label>
                            <asp:TextBox ID="textnp" runat="server" Visible="False"></asp:TextBox>
                        </td>
                        <td style="width: 225px">
                            <asp:Label ID="lbp" runat="server" Text="PRECIO:" Visible="False"></asp:Label>
                            <asp:TextBox ID="textPU" runat="server" Visible="False"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="lbc" runat="server" Text="CANTIDAD:" Visible="False"></asp:Label>
                            <asp:TextBox ID="textcant" runat="server" Visible="False"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 240px">
                            <asp:Label ID="lbd" runat="server" Text="DESCRIPCIÓN:" Visible="False"></asp:Label>
                            <asp:TextBox ID="textdesc" runat="server" Visible="False"></asp:TextBox>
                            <br />
                            <asp:Button ID="btnaceptar1" runat="server" OnClick="btnaceptar1_Click" Text="ACEPTAR" Visible="False" />
                            <asp:Button ID="btncancelar1" runat="server" OnClick="btncancelar1_Click" Text="CANCELAR" Visible="False" />
                        </td>
                        <td style="width: 225px">
                            <br />
                            <asp:Button ID="btnaceptar2" runat="server" Text="ACEPTAR" Visible="False" OnClick="btnaceptar2_Click1" />
                            <asp:Button ID="btncancelar2" runat="server" Text="CANCELAR" Visible="False" OnClick="btncancelar2_Click1" />
                        </td>
                        <td>
                            <br />
                            <asp:Button ID="btnaceptar3" runat="server" Text="ACEPTAR" Visible="False" OnClick="btnaceptar3_Click1" />
                            <asp:Button ID="btncancelar3" runat="server" Text="CANCELAR" Visible="False" OnClick="btncancelar3_Click1" />
                        </td>
                    </tr>
                </table>
                <br />
                <asp:Button ID="btnbuscar" runat="server" OnClick="btnbuscar_Click" Text="BUSCAR" />
                <br />
                <asp:Label ID="lberror" runat="server"></asp:Label>
            </td>
            <td style="height: 133px"></td>
            <td style="height: 133px"></td>
        </tr>
    </table>
</asp:Content>
