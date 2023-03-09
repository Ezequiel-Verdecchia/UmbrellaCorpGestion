<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Site1.Master" AutoEventWireup="true" CodeBehind="AltaProducto.aspx.cs" Inherits="UmbrellaCorpGestion.Productos.AltaProducto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%; margin-right: 0px;">
        <tr>
            <td style="width: 555px; text-decoration: underline; height: 114px;"><strong><span style="font-size: large">GENERACION DE PRODUCTO:<br />
                <br />
                <br />
                <br />
                NOMBRE:</span> </strong><asp:TextBox ID="textnombre" runat="server" Height="20px" Width="303px"></asp:TextBox>
                <em>
                <strong>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="textnombre" ErrorMessage="OBLIGATORIO" ForeColor="Red" style="font-size: large"></asp:RequiredFieldValidator>
                </strong>
                </em>
            </td>
            <td class="auto-style11"></td>
            <td class="auto-style11" style="width: 59px"></td>
        </tr>
        <tr>
            <td style="width: 555px; text-decoration: underline;"><strong>DESCRIPCIÓN: </strong>
                &nbsp;<asp:TextBox ID="textdesc" runat="server" Height="136px" Width="273px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
            <td style="width: 59px">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 555px">
                <table style="width:177%;">
                    <tr>
                        <td style="width: 307px; height: 81px;"><span style="text-decoration: underline; font-size: large;"><strong>MATERIA PRIMA:</strong></span>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="nombre" DataValueField="Id" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True" style="margin-left: 0px">
                            </asp:DropDownList>
                            <br />
                        </td>
                        <td style="width: 181px; height: 81px;">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BD %>" SelectCommand="SELECT [nombre], [Id] FROM [MateriaPrima]"></asp:SqlDataSource>
                        </td>
                        <td style="height: 81px" class="auto-style18"></td>
                    </tr>
                    <tr>
                        <td style="width: 307px">
                            <asp:Label ID="lbPU" runat="server"></asp:Label>
                            <br />
                            <br />
                            <asp:Label ID="lbPRO" runat="server"></asp:Label>
                            <br />
                            <br />
                            <asp:Label ID="lbcantidad" runat="server"></asp:Label>
                            <table style="width: 253%; height: 192px;">
                                <tr>
                                    <td class="auto-style16" style="height: 146px; font-size: large; width: 316px"><strong>CANTIDAD A SOLICITAR:<asp:TextBox ID="textcantS" runat="server"></asp:TextBox>
                                        </strong>
                                        <em><strong>
                                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Verificar Cantidad" Visible="False" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="textcantS" ErrorMessage="OBLIGATORIO" ForeColor="Red" style=""></asp:RequiredFieldValidator>
                                        </strong></em>
                                        <br />
&nbsp;&nbsp;&nbsp;<asp:Label ID="Label1" runat="server"></asp:Label>
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </td>
                                    <td style="width: 176px; height: 146px"></td>
                                    <td class="auto-style11" style="height: 146px"></td>
                                </tr>
                                <tr>
                                    <td style="height: 91px; font-size: large; width: 316px"><strong>CANTIDAD DE PRODUCTO:<asp:TextBox ID="textcantP" runat="server" ></asp:TextBox>
                                        <em>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="textcantP" ErrorMessage="OBLIGATORIO" ForeColor="Red" style="text-decoration: underline"></asp:RequiredFieldValidator>
                                        </em>
                                        </strong>
                                        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <em><strong>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="textcantP" ErrorMessage="SOLO NUMEROS" ForeColor="Red" style="text-decoration: underline" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                                        </strong></em></td>
                                    <td style="width: 176px; height: 91px"></td>
                                    <td style="height: 91px" class="auto-style18"></td>
                                </tr>
                                <tr>
                                    <td style="width: 316px">
                                        <table style="width: 117%; height: 272px;">
                                            <tr>
                                                <td class="auto-style18" style="height: 81px; font-size: large; width: 338px"><strong>PU DE PRODCUTO:<br />
                                                    </strong><asp:TextBox ID="textPU" runat="server"></asp:TextBox>
                                                    <em><strong>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="textPU" ErrorMessage="OBLIGATORIO" ForeColor="Red" style="text-decoration: underline"></asp:RequiredFieldValidator>
                                                    </strong></em>
                                                    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong><em>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="textPU" ErrorMessage="SOLO NUMEROS" ForeColor="Red" style="text-decoration: underline" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                                                    </em></strong><em><strong>
                                                    <br />
                                                    <br />
                                                    </strong></em>
                                                </td>
                                                <td class="auto-style18" style="height: 81px">
                                                    &nbsp;</td>
                                                <td class="auto-style18" style="height: 81px">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="width: 338px">
                                                    <asp:Button ID="btngenerar" runat="server" Text="GENERAR" OnClick="btngenerar_Click" Visible="False" />
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="width: 338px">
                            <asp:Label ID="lberror" runat="server"></asp:Label>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td style="width: 176px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </td>
                        <td style="width: 181px">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 307px">
                            &nbsp;</td>
                        <td style="width: 181px">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </td>
            <td>&nbsp;</td>
            <td style="width: 59px">&nbsp;</td>
        </tr>
    </table>
</asp:Content>
