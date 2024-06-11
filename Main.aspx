<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="App.Main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <link href="Stylee.css"rel="stylesheet" />                      
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            background-color: #FFFFFF;
        }
        .auto-style2 {
            text-align: center;
        }
        .auto-style3 {
            height: 265px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="padding:15px">

        <table class="auto-style1">
            <tr>
                <td class="auto-style2" colspan="2" style="font-size: x-large; font-weight: bold; color: #000000">STUDENT DETAILS</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblReg0" runat="server" Font-Size="Medium" Text="Register Number"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtRegnumber" runat="server" Font-Size="Medium" Width="200px"></asp:TextBox>
                    <asp:Button ID="Button2" runat="server" BackColor="#333333" ForeColor="White" Height="46px" OnClick="Button2_Click" Text="SEARCH" Width="125px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="2">
                    <asp:Button ID="btnView0" runat="server" BackColor="#333333" ForeColor="White" Height="46px" OnClick="btnView_Click" Text="VIEW" Width="125px" />
                    <asp:Button ID="Button3" runat="server" BackColor="#333333" BorderColor="White" BorderStyle="Inset" ForeColor="White" Height="46px" PostBackUrl="~/Edit.aspx" Text="EDIT" Width="128px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="2">
                    <asp:Label ID="Label" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="auto-style2">
                    <asp:GridView ID="GridView1" runat="server" Width="1213px" HorizontalAlign="Center">
                        <HeaderStyle BackColor="#666666" ForeColor="White" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td class="auto-style3" colspan="2"></td>
            </tr>
        </table>

    </div>
    </form>
    </body>
</html>
