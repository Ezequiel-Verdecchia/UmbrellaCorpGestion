<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Site1.Master" AutoEventWireup="true" CodeBehind="Materiasinactivos.aspx.cs" Inherits="UmbrellaCorpGestion.MaterialProveedores.Materiasinactivos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 100%;">
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Id" DataSourceID="SqlDataSource1" Height="326px" Width="820px">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                        <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" ReadOnly="True" />
                        <asp:CheckBoxField DataField="activo" HeaderText="activo" SortExpression="activo" />
                        <asp:CommandField ButtonType="Image" CancelImageUrl="~/Imagenes/red-cross-x-shape-delete-260nw-252978121.png" EditImageUrl="~/Imagenes/edición.png" ShowEditButton="True" UpdateImageUrl="~/Imagenes/ok_accept_15562.png" />
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BD %>" OnSelecting="SqlDataSource1_Selecting" SelectCommand="SELECT [activo], [nombre], [Id] FROM [MateriaPrima] WHERE ([activo] = @activo)" DeleteCommand="DELETE FROM [MateriaPrima] WHERE [Id] = @Id" InsertCommand="INSERT INTO [MateriaPrima] ([activo], [nombre]) VALUES (@activo, @nombre)" UpdateCommand="UPDATE [MateriaPrima] SET [activo] = @activo WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
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
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
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
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
