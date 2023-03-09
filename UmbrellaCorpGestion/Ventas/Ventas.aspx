<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Site1.Master" AutoEventWireup="true" CodeBehind="Ventas.aspx.cs" Inherits="UmbrellaCorpGestion.Ventas.Ventas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%;">
        <tr>
            <td style="text-decoration: underline; width: 571px"><strong>TITULO DE LA VENTA:<asp:TextBox ID="textnombre" runat="server" Height="20px" Width="305px"></asp:TextBox>
                </strong></td>
            <td style="width: 248px">&nbsp;</td>
            <td>
                <asp:Label ID="lbFecha" runat="server" Text="fecha"></asp:Label>
                -<asp:Label ID="lbEstado" runat="server" Text="estado"></asp:Label>
                -<asp:Label ID="lbVendedor" runat="server" Text="vendedor"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 571px; height: 23px; text-decoration: underline"><strong>DESCRIPCIÓN:<asp:TextBox ID="textdesc" runat="server" Height="227px" Width="364px"></asp:TextBox>
                </strong></td>
            <td style="height: 23px; width: 248px"></td>
            <td style="height: 23px"></td>
        </tr>
        <tr>
            <td style="width: 571px; text-decoration: underline; height: 94px"><strong>CLIENTE:<asp:DropDownList ID="DDcliente" runat="server" DataSourceID="SqlDataSource1" DataTextField="nombre" DataValueField="Id" Height="16px" Width="148px" AutoPostBack="True">
                </asp:DropDownList>
                <asp:LinkButton ID="LinkButton2" runat="server">CREAR CLIENTE</asp:LinkButton>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BD %>" SelectCommand="SELECT [nombre], [Id], [contacto] FROM [Cliente]"></asp:SqlDataSource>
                </strong></td>
            <td class="auto-style18" style="height: 94px; width: 248px"></td>
            <td class="auto-style18" style="height: 94px"></td>
        </tr>
    </table>
    <table style="width:100%;">
        <tr>
            <td class="auto-style18" style="height: 68px; text-decoration: underline; width: 606px"><strong>PRODUCTO:<asp:DropDownList ID="DDproducto" runat="server" DataSourceID="SqlDataSource2" DataTextField="nombre" DataValueField="Id" Height="16px" Width="124px" AutoPostBack="True" OnSelectedIndexChanged="DDproducto_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:Button ID="btnAprod" runat="server" OnClick="btnAprod_Click" Text="AGUERGAR PRODUCTO" Width="193px" Visible="False" />
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BD %>" SelectCommand="SELECT [nombre], [Id] FROM [Producto]"></asp:SqlDataSource>
                </strong></td>
            <td class="auto-style18" style="height: 68px"></td>
            <td class="auto-style18" style="height: 68px"></td>
        </tr>
        <tr>
            <td class="auto-style18" style="height: 97px; text-decoration: underline; text-align: left; width: 606px"><strong>DETALLE DE PEDIDO:<asp:GridView ID="GridView1" runat="server" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" Width="571px">
                <AlternatingRowStyle BackColor="PaleGoldenrod" />
                <Columns>
                    <asp:CommandField SelectText="&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;" ShowSelectButton="True" />
                </Columns>
                <FooterStyle BackColor="Tan" />
                <HeaderStyle BackColor="Tan" Font-Bold="True" />
                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                <SortedAscendingCellStyle BackColor="#FAFAE7" />
                <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                <SortedDescendingCellStyle BackColor="#E1DB9C" />
                <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                </asp:GridView>
                </strong></td>
            <td class="auto-style18" style="height: 97px"></td>
            <td class="auto-style18" style="height: 97px"></td>
        </tr>
        <tr>
            <td class="auto-style14" style="width: 606px; height: 43px">
                <asp:Label ID="lbTotal" runat="server"></asp:Label>
            </td>
            <td class="auto-style18" style="height: 43px"></td>
            <td class="auto-style18" style="height: 43px"></td>
        </tr>
    </table>
    <table style="width:100%;">
        <tr>
            <td style="width: 499px">
                <asp:Button ID="btnCerrar" runat="server" Text="CERRAR VENTA" Visible="False" />
                <asp:Button ID="btnGuardar" runat="server" Text="GUARDAR VENTA" Visible="False" />
                <asp:Button ID="btnCancelar" runat="server" Text="CANCELAR" Visible="False" />
            </td>
            <td style="width: 236px">&nbsp;</td>
            <td style="width: 366px">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
        </tr>
        <tr>
            <td style="width: 499px">&nbsp;</td>
            <td style="width: 236px">&nbsp;</td>
            <td style="width: 366px">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 499px">&nbsp;</td>
            <td style="width: 236px">&nbsp;</td>
            <td style="width: 366px">&nbsp;</td>
        </tr>
    </table>
    <asp:Label ID="lberror" runat="server"></asp:Label>
    <br />

    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" BehaviorID="mpe" runat="server"
        PopupControlID="pnlPopup" TargetControlID="LinkButton2" BackgroundCssClass="modalBackground"
        CancelControlID="Lcancelar">

    </ajaxToolkit:ModalPopupExtender>
    <asp:Panel ID="pnlPopup" runat="server" CssClass="modalPopup" Style="display:none">
        <div class="header2">
            <b>Crear Cliente</b>
            </div>
        <div class="body">
            <asp:TextBox ID="textNombreCliente"  runat="server">NOMBRE:</asp:TextBox>
             <asp:TextBox ID="textContacto"  runat="server">CONTACTO:</asp:TextBox>
            <hr />
            <asp:LinkButton ID="LConfirmar" CausesValidation="false"  runat="server" OnClick="LConfirmar_Click">CONFIRMAR</asp:LinkButton>
            <asp:LinkButton ID="LCancelar" CausesValidation="false" runat="server">CANCELAR</asp:LinkButton>
        </div>
    </asp:Panel>

</asp:Content>
