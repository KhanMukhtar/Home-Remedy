<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LoginPage.aspx.cs" Inherits="LoginPage" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>HOME REMEDY</title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Smart Login Form Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
function hideURLbar(){ window.scrollTo(0,1); } </script>
    
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all">
    
    <link href="//fonts.googleapis.com/css?family=Roboto+Slab:100,300,400,700Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900iSlabo+27px&subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese" rel="stylesheet">
    
</head>
<body>
    
    <div class="agileheader">
        <h1 style="font-style: normal">HOME REMEDY</h1>
    </div>
   
    <form runat="server">
    <div class="main-w3l">
        <div class="w3layouts-main">

            <h2>Login</h2>
            <div class="row" style="align-items:center">
                <asp:label ID="lblworngpass" runat="server" Visible="false" style="float: none;color:#0ef0e4" >qwert</asp:label>
            </div>
            <asp:TextBox class="input" ID="UserId" value="E-MAIL" name="Email" type="email" required="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'E-Mail';}" runat="server"></asp:TextBox>
            <br />
            <asp:TextBox class="input" ID="Password" runat="server" name="Password" type="password" required="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'password';}"></asp:TextBox>
            
            <div class="clear">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Login" />
            </div>
            &nbsp;
		<p>Don't Have an Account ?<a href="RegisterPage.aspx">Register Now</a></p>
        </div>
    </div>
        </form>
  
</body>
</html>
