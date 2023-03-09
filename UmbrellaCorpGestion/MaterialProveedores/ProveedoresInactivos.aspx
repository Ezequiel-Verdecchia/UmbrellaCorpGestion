<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Site1.Master" AutoEventWireup="true" CodeBehind="ProveedoresInactivos.aspx.cs" Inherits="UmbrellaCorpGestion.MaterialProveedores.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%;">
        <tr>
            <td style="width: 816px">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Id" DataSourceID="SqlDataSource1" GridLines="Vertical" Height="16px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="789px">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                        <asp:BoundField DataField="razonSocial" HeaderText="razonSocial" SortExpression="razonSocial" ReadOnly="True" />
                        <asp:CheckBoxField DataField="activo" HeaderText="activo" SortExpression="activo" />
                        <asp:CommandField ButtonType="Image" CancelImageUrl="~/Imagenes/red-cross-x-shape-delete-260nw-252978121.png" EditImageUrl="~/Imagenes/edición.png" ShowEditButton="True" UpdateImageUrl="~/Imagenes/ok_accept_15562.png" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#000065" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BD %>" SelectCommand="SELECT [Id], [razonSocial], [activo] FROM [Proveedores] WHERE ([activo] = @activo)" DeleteCommand="DELETE FROM [Proveedores] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Proveedores] ([razonSocial], [activo]) VALUES (@razonSocial, @activo)" UpdateCommand="UPDATE [Proveedores] SET  [activo] = @activo WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="razonSocial" Type="String" />
                        <asp:Parameter Name="activo" Type="Boolean" />
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
            <td style="width: 816px">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 816px">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
