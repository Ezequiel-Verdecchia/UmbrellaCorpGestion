<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Site1.Master" AutoEventWireup="true" CodeBehind="consultadeUsuariosaspx.aspx.cs" Inherits="UmbrellaCorpGestion.Usuarios.consultadeUsuariosaspx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%; height: 198px;">
        <tr>
            <td style="height: 31px; width: 538px;">
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    <asp:ListItem>Username</asp:ListItem>
                    <asp:ListItem>Id</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td style="height: 31px"></td>
            <td style="height: 31px"></td>
        </tr>
        <tr>
            <td style="height: 22px; width: 538px;">
                <asp:RadioButton ID="RadioButton1" runat="server" Text="Activos" Checked="True" GroupName="status" />
                <asp:RadioButton ID="RadioButton2" runat="server" Text="Inactivos" GroupName="status" />
                <asp:RadioButton ID="RadioButton3" runat="server" Text="Ambos" GroupName="status" />
                <br />
            </td>
            <td style="height: 22px"></td>
            <td style="height: 22px"></td>
        </tr>
        <tr>
            <td style="width: 538px">
                <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Width="498px" DataKeyNames="username">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <Columns>
                        <asp:CommandField SelectText="&gt;&gt;&gt;&gt;&gt;&gt;" ShowSelectButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="Gray" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                
                <asp:Button ID="BtnModificarMail" runat="server" Text="Modificar Mail" OnClick="BtnModificarMail_Click" Visible="False" Width="127px" />
                <asp:Button ID="BtnDesvincular" runat="server" Text="Desvincular recurso" Visible="False" OnClick="BtnDesvincular_Click" />
                <asp:Button ID="BtnRestablecerCont" runat="server" Text="Restablecer Contraseña" Width="207px" Visible="False" OnClick="BtnRestablecerCont_Click" />
                <br />
                <br />
                            <asp:TextBox ID="TextBoxMailMod" runat="server" Visible="False" Width="116px"></asp:TextBox>
                        &nbsp;&nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxMailMod" ErrorMessage="Es necesario usar expresiones de mail" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <br />
                            <asp:Button ID="BtnSiDeModMail" runat="server" OnClick="BtnSiDeModMail_Click" Text="SI" Visible="False" Width="60px" />
                            &nbsp;<asp:Button ID="BtnNoDeModMail" runat="server" Text="NO" Visible="False" Width="64px" OnClick="BtnNoDeModMail_Click" />
                <br />
                <table style="width:100%;">
                    <tr>
                        <td style="height: 30px; width: 223px;">
                            <asp:Label ID="LabelDeDesvincular" runat="server"></asp:Label>
&nbsp;<br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="BtnSiDesvinvular" runat="server" OnClick="BtnSiDesvinvular_Click" Text="SI" Width="57px" Visible="False" />
                            <asp:Button ID="BtnNoDesvincular" runat="server" Height="25px" OnClick="BtnNoDesvincular_Click" style="margin-left: 0px; margin-top: 0px;" Text="NO" Width="57px" Visible="False" />
                        </td>
                        <td style="height: 30px">&nbsp;</td>
                        <td style="height: 30px"></td>
                    </tr>
                    <tr>
                        <td style="width: 223px">
                            <asp:Label ID="LabelDeContraseña" runat="server"></asp:Label>
                            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="BtnSiContraseña" runat="server" OnClick="BtnSiContraseña_Click" Text="SI" Visible="False" Width="46px" />
                            <asp:Button ID="BtnNoContraseña" runat="server" style="margin-left: 0px" Text="NO" Visible="False" Width="52px" OnClick="BtnNoContraseña_Click" />
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 223px">
                            <table style="width:100%;">
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                            <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Buscar" Height="35px" style="margin-top: 18px" Width="125px" />
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                            <asp:Label ID="Label1" runat="server"></asp:Label>
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
