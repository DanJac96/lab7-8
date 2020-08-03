<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" EnableEventValidation="false" Inherits="Laboratorio7_8.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Laboratorio 7-8</title>

    
    <img src="title2.png" />
    <style>

        #DrpPais {
            margin-left:100px; margin-top:30px;
        }
        .Label {
            margin-left:100px;
        }
        #txtHabitantes {
            margin-left:59px; margin-top:30px;
        }
        #DrpIdioma {
            margin-left:80px; margin-top:30px;
        }
        #txtPIB {
            margin-left:100px; margin-top:30px;
        }
        #txtSuperficie {
            margin-left:60px; margin-top:30px;
        }
        .RadioButonList.horizontal li {
            display:inline;
        }
        .RadioButonList.Label{
            display:inline;
        }
        #rBajo {
            margin-left:50px; margin-top:30px; 
        }
        #rMedio {
            margin-left:50px; margin-top:30px; 
        }
        #rAlto {
            margin-left:50px; margin-top:30px; 
        }
        #chkPrestamo {
            margin-left:55px;
        }
        #btnRegistrar {
            margin-left:50px; margin-top:30px;padding:5px; width:100px;
        }
        #btnActualizar {
            margin-left:50px; margin-top:30px;padding:5px; width:100px;
        }
        #btnEliminar {
            margin-left:50px; margin-top:30px;padding:5px; width:100px;
        }

    </style>
    
</head>
<body style="height: 1200px">
    <form id="form1" runat="server">
        <div style="height: 1000px; margin-left: 40px;" >

            <asp:Label Text="Pais" runat="server"></asp:Label>
            <asp:DropDownList ID="DrpPais" runat="server" >
            </asp:DropDownList>
            <br />

            <asp:Label Text="Habitantes" runat="server"></asp:Label>
            <asp:TextBox ID="txtHabitantes" runat="server"></asp:TextBox>
            <br />

            <asp:Label Text="Idioma" runat="server"></asp:Label>
            <asp:DropDownList ID="DrpIdioma" runat="server">
            </asp:DropDownList>
            <br />

            <asp:Label Text="PIB" runat="server"></asp:Label>
            <asp:TextBox  Text="$" ID="txtPIB" runat="server"></asp:TextBox>
            <br />
            
            <asp:Label Text="Superficie" runat="server"></asp:Label>
            <asp:TextBox ID="txtSuperficie" runat="server"></asp:TextBox>
            <br />
            <br />

            <asp:Label Text="Riesgo Seguridad" runat="server"></asp:Label>
            <asp:RadioButtonList ID="RDLriesgo" CssClass="RadioButonList" RepeatDirection="Horizontal" runat="server">
            <asp:ListItem text="Alto" ID="rAlto" runat="server" />
            <asp:ListItem text="Medio" ID="rMedio" runat="server" />
            <asp:ListItem text="Bajo" ID="rBajo" runat="server" />
            </asp:RadioButtonList>
            <br />
            
            <asp:CheckBox text="Sujeto a Prestamo" ID="chkPrestamo" runat="server" />
            <br />

            <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" OnClick="Registrar_Click"/>
            <asp:Button ID="btnActualizar" runat="server" Text="Actualizar" OnClick="btnActualizar_Click" />
            <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" OnClick="btnEliminar_Click"/>
            <br />
            <br />

            <asp:GridView ID="GridGestionPrestamo" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="false" DataKeyNames="id_GestionPrestamo" OnRowDataBound="GridGestionPrestamo_RowDataBound" OnSelectedIndexChanged="GridGestionPrestamo_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />

                <Columns>
                    <asp:TemplateField HeaderText="Pais">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("id_Pais") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Habitantes">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Habitantes") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Idioma">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("id_Idioma") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="PIB">
                        <ItemTemplate>
                            <asp:Label Text='<%#"$" + Eval("PIB") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Superficie">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Superficie") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Riesgo">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("RiesgoSeguridad") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Prestamo">
                        <ItemTemplate>
                            <%# (Boolean.Parse(Eval("Prestamo").ToString())) ? "SI" : "NO" %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    


                </Columns>
            </asp:GridView>
            
        </div>
    </form>
</body>
</html>
