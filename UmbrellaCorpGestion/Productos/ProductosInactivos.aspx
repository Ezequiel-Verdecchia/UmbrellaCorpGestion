<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Site1.Master" AutoEventWireup="true" CodeBehind="ProductosInactivos.aspx.cs" Inherits="UmbrellaCorpGestion.Productos.ProductosInactivos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%;">
        <tr>
            <td style="width: 229px">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal" Height="452px" Width="916px">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                        <asp:BoundField DataField="nombre" HeaderText="nombre" ReadOnly="True" SortExpression="nombre" />
                        <asp:CheckBoxField DataField="activo" HeaderText="activo" SortExpression="activo" />
                        <asp:CommandField ButtonType="Image" CancelImageUrl="~/Imagenes/red-cross-x-shape-delete-260nw-252978121.png" EditImageUrl="~/Imagenes/edición.png" ShowEditButton="True" UpdateImageUrl="~/Imagenes/ok_accept_15562.png" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#242121" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BD %>" DeleteCommand="DELETE FROM [Producto] WHERE [Id] = @original_Id" InsertCommand="INSERT INTO [Producto] ([activo], [nombre]) VALUES (@activo, @nombre)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [Id], [activo], [nombre] FROM [Producto] WHERE ([activo] = @activo)" UpdateCommand="UPDATE [Producto] SET [activo] = @activo WHERE [Id] = @original_Id">
                    <DeleteParameters>
                        <asp:Parameter Name="original_Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="activo" Type="Boolean" />
                        <asp:Parameter Name="nombre" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:Parameter DefaultValue="false" Name="activo" Type="Boolean" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="activo" Type="Boolean" />
                        <asp:Parameter Name="original_Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
                <br />
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 229px">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 229px">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
