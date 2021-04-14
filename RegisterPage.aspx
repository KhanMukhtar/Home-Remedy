<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegisterPage.aspx.cs" Inherits="RegisterPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
   
    <title>HOME REMEDY</title>
    
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    
    <link href="assets/css/style.css" rel="stylesheet" />
   
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

    <style>
        .dropbtn {
            background-color: #3498DB;
            color: white;
            padding: 4px;
            border-radius: 4px;
            width: 115px;
            font-size: 16px;
            border: none;
            cursor: pointer;
        }

            .dropbtn:hover, .dropbtn:focus {
                background-color: #2980B9;
            }

        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f1f1f1;
            min-width: 160px;
            overflow: auto;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }

            .dropdown-content a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }

        .dropdown a:hover {
            background-color: #ddd;
        }

        .show {
            display: block;
        }
    </style>

    <style>
        .dropbtn {
            background-color: #3498DB;
            color: white;
            padding: 4px;
            border-radius: 4px;
            width: 115px;
            font-size: 16px;
            border: none;
            cursor: pointer;
        }

            .dropbtn:hover, .dropbtn:focus {
                background-color: #2980B9;
            }

        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f1f1f1;
            min-width: 160px;
            overflow: auto;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }

            .dropdown-content a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }

        .dropdown a:hover {
            background-color: #ddd;
        }

        .show {
            display: block;
        }
    </style>

    <script>
        
        function myFunction() {
            document.getElementById("myDropdown").classList.toggle("show");
        }

        
        window.onclick = function (event) {
            if (!event.target.matches('.dropbtn')) {

                var dropdowns = document.getElementsByClassName("dropdown-content");
                var i;
                for (i = 0; i < dropdowns.length; i++) {
                    var openDropdown = dropdowns[i];
                    if (openDropdown.classList.contains('show')) {
                        openDropdown.classList.remove('show');
                    }
                }
            }
        }
    </script>

    <script type="text/javascript">
        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode
            if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))
                return false;
            return true;
        }

        function IsValidEmail(email) {
            var expr = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
            return expr.test(email);
        };

        function ValidateEmail() {
            debugger
            var email = document.getElementById('<% =Email.ClientID%>').value;
        var name = document.getElementById('<% =Name.ClientID%>').value;
        var gender = document.getElementById('<% =SelectGender.ClientID%>').value;
        var contact = document.getElementById('<% =Contact.ClientID%>').value;
        var password1 = document.getElementById('<% =Password1.ClientID%>').value;
        var password2 = document.getElementById('<% =Password2.ClientID%>').value;
        if (!IsValidEmail(email)) {
            alert("Invalid email address.");
            
            document.getElementById('<% =Email.ClientID%>').focus();
                      return false;
                  }
                  else if ((name == '')) {
                      alert("Please Enter The Name.");
                     
                      document.getElementById('<% =Email.ClientID%>').focus();
                  return false;
              }
              else if (gender == 'none') {
                  alert("Please Select Gender.");
                  
                  document.getElementById('<% =Email.ClientID%>').focus();
                      return false;
                  }
                  else if (contact.length != 10) {
                      alert("Please Enter Correct Contact");
                      
                      document.getElementById('<% =Email.ClientID%>').focus();
                      return false;
                  }
                  else if (password1 == "") {
                      alert("Please Enter Password");
                     
                      document.getElementById('<% =Email.ClientID%>').focus();
                      return false;
                  }
                  else if (password1 != password2) {
                      alert("Password Doesn't Match please Re-Enter.");
                     
                      document.getElementById('<% =Email.ClientID%>').focus();
                      return false;
                  }
                  else {
                      return true;
                  }
}

    </script>

    <script src="js/datepicker.js" type="text/javascript"></script>

    <script>
        
        function myFunction() {
            document.getElementById("myDropdown").classList.toggle("show");
        }

        
        window.onclick = function (event) {
            if (!event.target.matches('.dropbtn')) {

                var dropdowns = document.getElementsByClassName("dropdown-content");
                var i;
                for (i = 0; i < dropdowns.length; i++) {
                    var openDropdown = dropdowns[i];
                    if (openDropdown.classList.contains('show')) {
                        openDropdown.classList.remove('show');
                    }
                }
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="navbar navbar-inverse set-radius-zero">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
                <div class="row" style="height: 25px; width: 25px">
                    <img src="assets/img/HomeReme11.png" />
                </div>

                <div class="right-div">
                    <a href="LoginPage.aspx"><i class="fa fa-sign-out" style="font-size: 40px; color: blue" title="Go Back"></i></a>
                </div>

            </div>
        </div>
        <section class="menu-section">
        </section>
        <div>
            <div class="content-wrapper">
                <div class="container">
                    <div class="row pad-botm">
                    </div>
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="panel panel-danger">
                                <div class="panel-heading">
                                    SINGUP FORM
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-12 col-sm-12 col-xs-12">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Name :</label>
                                                    <asp:TextBox ID="Name" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-6" runat="server">
                                                <div class="form-group" runat="server">
                                                    <label>Gender :</label>
                                                    <select id="SelectGender" class="form-control" runat="server">
                                                        <option value="none">---SELECT GENDER---</option>
                                                        <option value="male">Male</option>
                                                        <option value="female">FeMale</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12 col-sm-12 col-xs-12">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>E-Mail :</label>
                                                    <asp:TextBox ID="Email" runat="server" class="form-control"></asp:TextBox>
                                                    
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Contact no. :</label>
                                                    <asp:TextBox ID="Contact" runat="server" class="form-control" MaxLength="10" onkeypress="return isNumberKey(event);"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12 col-sm-12 col-xs-12">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Enter Password :</label>
                                                    <asp:TextBox ID="Password1" runat="server" class="form-control" type="password"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Re Type Password : </label>
                                                    <asp:TextBox ID="Password2" runat="server" class="form-control" type="password"></asp:TextBox>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <asp:Button ID="SaveButton" type="submit" class="btn btn-danger" runat="server"
                                        Text="Register Now " OnClick="SaveButton_Click" OnClientClick="return ValidateEmail();" />
                                   

                                    <div class="row">
                                        <div class="col-md-12 col-sm-12 col-xs-12">
                                            <div class="col-md-4">
                                            </div>
                                            <div class="col-md-4">
                                                <b>
                                                    <asp:Label ID="lblsucess" runat="server" Visible="false"></asp:Label></b>
                                            </div>
                                            <div class="col-md-4">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
       <section class="footer-section">
            <div class="container">
                <div class="row">
                   
                 <div class="col-md-12">
                    &copy;  | Designed by : Mukhtar Khan
                </div>
            
                </div>
            </div>
        </section>
      
    </form>
</body>
</html>
