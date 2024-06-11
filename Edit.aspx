<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="App.Edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="styles.css" /> 
    <style type="text/css">

        .auto-style2 {
            text-align: center;
        }
        .auto-style5 {
            height: 37px;
            text-align: center;
        }
        .auto-style3 {
            height: 37px;
        }
        .auto-style1 {
            width: 100%;
        }
        body {
    margin:0;
    padding:0;
}
section {
    width: 10vw;
    height: 10vh;
    display:flex;
    justify-content:center;
    align-items:center;
}
.content h2{
    font-family:'sergoe UI',Tahoma,Verdana, Geneva, Tahoma, sans-serif,Verdana,sams-serif;
    padding-left:7vw;
}
.content input[type=text]{
    height:30px;
    border:0;
    margin-top:2.5vh;
    margin-left:4vw;
    border-radius:20px;
}
.content input[type=password] {
    height: 30px;
    border: 0;
    margin-top: 2.5vh;
    margin-left: 4vw;
    border-radius: 20px;
}
#ddlYear {
    height: 30px;
    width:auto;
    border: 0;
    margin-top: 2.5vh;
    margin-left: 4vw;
    border-radius: 20px;
}
#ddlYear:after {
    content: "\25BC"; /* Unicode arrow character */
    position: absolute;
    top: 50%;
    right: 10px;
    transform: translateY(-50%);
    pointer-events:  none;
}
#ddlGender {
    height: 30px;
    width:auto;
    border: 0;
    margin-top: 2.5vh;
    margin-left: 4vw;
    border-radius: 20px;
}

    #ddlGender:after {
        content: "\25BC"; /* Unicode arrow character */
        position: absolute;
        top: 50%;
        right: 10px;
        transform: translateY(-50%);
        pointer-events:  none;
    }
    .content input[type=submit] {
        height: 30px;
        border: 0;
        margin-top: 2.5vh;
        margin-left: 4vw;
        border-radius: 20px;
        background-color:black;
        font-family:white;
        
    }
    .content input[placeholder]{
        font-family:'Trebuchet MS','Lucida Sans Unicode','Lucida Grande','Lucida Sans','Arial','sans-serif';
        padding-left:1vw;
        font-size:13px;
    }
    .myTable {
        width: 50%;
        margin: 0 auto; 
        border-collapse: collapse;
    }

    .myTable td {
        border: 1px solid #ccc;
        padding: 10px;
        font-family: Arial, sans-serif;
        font-size: 16px;
    }

    .myTable h1 {
        text-align: center;
        color: blue;
    }


        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>

        <table class="auto-style1">
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblReg0" runat="server" Font-Size="Medium" Text="Register Number"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtRegnumber" runat="server" Font-Size="Medium" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblEmail0" runat="server" Font-Size="Medium" Text="E-Mail"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" Font-Size="Medium" Width="200px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" BorderColor="Black" BorderStyle="Inset" ControlToValidate="txtEmail" ErrorMessage="Enter Valid EMail" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="lblNumber0" runat="server" Font-Size="Medium" Text="Phone Number"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtNumber" runat="server" Font-Size="Medium" Width="200px" TextMode="Number"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" BorderColor="Black" BorderStyle="Inset" ControlToValidate="txtNumber" ErrorMessage="Enter Valid Number" ForeColor="Red" ValidationExpression="^(\+91[\-\s]?)?[0]?[789]\d{9}$">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="2">
                    <asp:Button ID="btnView0" runat="server" BackColor="#333333" ForeColor="White" Height="46px" OnClick="btnView_Click" Text="RETRIVE" Width="125px" />
                    <asp:Button ID="submit" runat="server" BackColor="#333333" ForeColor="White" Height="46px" OnClick="Button1_Click" Text="INSERT" Width="125px" />
                    <asp:Button ID="btnDelete0" runat="server" BackColor="#333333" ForeColor="White" Height="46px" OnClick="Button1_Click1" Text="DELETE" Width="125px" />
                    <asp:Button ID="Button3" runat="server" BackColor="#333333" ForeColor="White" Height="46px" OnClick="Button1_Click2" Text="UPDATE" Width="125px" />
                    </td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="2">
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                    </td>
            </tr>
            <tr>
                <td colspan="2" class="auto-style2">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:GridView ID="GridView1" runat="server" Width="808px" OnRowDataBound="GridView1_RowDataBound" >
                    </asp:GridView>
                </td>
            </tr>
        </table>

    </form>
</body>
</html>
