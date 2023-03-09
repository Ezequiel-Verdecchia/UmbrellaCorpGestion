<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Site1.Master" AutoEventWireup="true" CodeBehind="ConsultayModificacionMateriaPrima.aspx.cs" Inherits="UmbrellaCorpGestion.MaterialProveedores.ConsultayModificacionMateriaPrima" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%;">
        <tr>
            <td>
                <table style="width:100%;">
                    <tr>
                        <td>
                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1" GridLines="Horizontal" Height="233px" Width="491px" AllowSorting="True">
                                <AlternatingRowStyle BackColor="#F7F7F7" />
                                <Columns>
                                    <asp:BoundField DataField="cantidad" HeaderText="cantidad" SortExpression="cantidad" />
                                    <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
                                    <asp:BoundField DataField="precioUnitario" HeaderText="precioUnitario" SortExpression="precioUnitario" />
                                    <asp:BoundField DataField="idpro" HeaderText="idpro" SortExpression="idpro" />
                                </Columns>
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
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BD %>" SelectCommand="SELECT [nombre], [precioUnitario], [cantidad], [idpro] FROM [MateriaPrima] ORDER BY [cantidad] DESC"></asp:SqlDataSource>
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>INGRESE EL NOMBRE DE LA MATERIA:<asp:TextBox ID="textnombre" runat="server"></asp:TextBox>
                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="BUSCAR" />
                            </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">Materias inactivos</asp:LinkButton>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="487px" DataKeyNames="Id">
                    <Columns>
                        <asp:CommandField SelectText="&gt;&gt;&gt;&gt;&gt;&gt;" ShowSelectButton="True" />
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
                <table style="width:100%;">
                    <tr>
                        <td>
                            <asp:Button ID="btninactivar" runat="server" Text="INACTIVAR" Visible="False" Width="94px" OnClick="btninactivar_Click" />
                            <asp:Button ID="btneditar" runat="server" Text="EDITAR" Visible="False" Width="79px" OnClick="btneditar_Click" />
                            <asp:Button ID="btnmodprecio" runat="server" Text="MODIFICAR PRECIO" Visible="False" Width="162px" OnClick="btnmodprecio_Click" />
                            <asp:Button ID="btnmodcantidad" runat="server" Text="MODIFICAR CANTIDAD" Visible="False" OnClick="btnmodcantidad_Click" />
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbnombre" runat="server" Text="NOMBRE:" Visible="False"></asp:Label>
                            <asp:TextBox ID="textednombre" runat="server" Visible="False"></asp:TextBox>
                            <asp:Label ID="lbdescripcion" runat="server" Text="DESCRIPCIÓN:" Visible="False"></asp:Label>
                            <asp:TextBox ID="texteddescripcion" runat="server" Visible="False"></asp:TextBox>
                            <asp:Label ID="lbidpro" runat="server" Text="IDPRO:" Visible="False"></asp:Label>
                            <asp:TextBox ID="textidpro" runat="server" Visible="False"></asp:TextBox>
                            <br />
                            <asp:Button ID="btnaceptar" runat="server" OnClick="btnaceptar_Click" Text="ACEPTAR" Visible="False" />
                            <asp:Button ID="btncancelar" runat="server" Text="CANCELAR" Visible="False" OnClick="btncancelar_Click" />
                            <br />
                            <asp:Label ID="lbPU" runat="server" Text="PRECIO UNITARIO:" Visible="False"></asp:Label>
                            <asp:TextBox ID="textPU" runat="server" Visible="False"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="textPU" ErrorMessage="SOLO NUMEROS" ForeColor="#FF3300" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                            <br />
                            <asp:Button ID="btnaceptar2" runat="server" OnClick="btnaceptar2_Click" Text="ACEPTAR" Visible="False" />
                            <asp:Button ID="btncancelar2" runat="server" OnClick="btncancelar2_Click" Text="CANCELAR" Visible="False" />
                            <br />
                            <asp:Label ID="lbcant" runat="server" Text="CANTIDAD:" Visible="False"></asp:Label>
                            <asp:TextBox ID="textcant" runat="server" Visible="False"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="textcant" ErrorMessage="SOLO NUMEROS" ForeColor="#FF3300" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                            <br />
                            <asp:Button ID="btnaceptar3" runat="server" OnClick="btnaceptar3_Click" Text="ACEPTAR" Visible="False" />
                            <asp:Button ID="btncancelar3" runat="server" OnClick="btncancelar3_Click" Text="CANCELAR" Visible="False" />
                            <br />
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <table style="width:100%;">
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label1" runat="server" ForeColor="#FF3300"></asp:Label>
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
