<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dasboardforadmin.aspx.cs" Inherits="Dasboardforadmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
   
    <title>HOME REMEDY</title>
 
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
   
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    
    <link href="assets/css/style.css" rel="stylesheet" />
   
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

</head>
<body>
    <div class="navbar navbar-inverse set-radius-zero">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">

                    
                    <a href="Dasboardforadmin.aspx"><img src="assets/img/HomeReme11.png" /></a>
                </a>

            </div>

            <div class="right-div">
                <a href="LoginPage.aspx" class="btn btn-danger pull-right">LOG ME OUT</a>
            </div>
        </div>
    </div>
    
    <section class="menu-section">
        <div class="container">
            <div class="row ">
                <div class="col-md-12">
                    <div class="navbar-collapse collapse ">
                        <ul id="menu-top" class="nav navbar-nav navbar-right">
                            <li>
                                <a href="#" class="dropdown-toggle" id="ddlmenuItem3" data-toggle="dropdown">SYMPTOMS<i class="fa fa-angle-down"></i></a>
                                <ul class="dropdown-menu" role="menu" aria-labelledby="ddlmenuItem">
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="SymptomSMaster.aspx">Add Symptom dropdown</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="SymptomsForUser.aspx">Add symptoms Details</a></li>
                                </ul>
                            </li>
                            &nbsp;&nbsp;&nbsp;
                            <li>
                                <a href="#" class="dropdown-toggle" id="ddlmenuItem4" data-toggle="dropdown">BEAUTY<i class="fa fa-angle-down"></i></a>
                                <ul class="dropdown-menu" role="menu" aria-labelledby="ddlmenuItem">
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="BeautyMaster.aspx">Add beauty dropdown</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="BeautyForUserAdmin.aspx">Add beauty Details</a></li>
                                </ul>
                            </li>
                            &nbsp;&nbsp;&nbsp;
                            <li>
                                <a href="#" class="dropdown-toggle" id="ddlmenuItem5" data-toggle="dropdown">PRODUCT<i class="fa fa-angle-down"></i></a>
                                <ul class="dropdown-menu" role="menu" aria-labelledby="ddlmenuItem">
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="productMaster.aspx">Add product dropdown</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="productforadmin.aspx">Add product Details</a></li>
                                </ul>
                            </li>
                            &nbsp;&nbsp;&nbsp;
                            <li>
                                <a href="#" class="dropdown-toggle" id="ddlmenuItem1" data-toggle="dropdown">ADMIN</a>
                                
                            </li>
                            &nbsp;&nbsp;&nbsp;
                            <li>
                                <a href="#" class="dropdown-toggle" id="ddlmenuItem2" data-toggle="dropdown">USERS<i class="fa fa-angle-down"></i></a>
                                <ul class="dropdown-menu" role="menu" aria-labelledby="ddlmenuItem">
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="HomepageFinal.aspx">Home page</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="symptomsFinal.aspx">Symptoms</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="beautyFinal.aspx">Beauty</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="YogaandMudrasfinal.aspx">yoga</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="ProductFinal.aspx">Product</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="DoctorFinal.aspx">Doctors </a></li>
                                    
                                </ul>
                            </li>
                            
                        </ul>
                    </div>
                </div>

            </div>
        </div>
    </section>
    
    <div class="content-wrapper">
        <div class="container">
            <div class="row pad-botm">
                <div class="col-md-12">
                    <h4 class="header-line">ADMIN DASHBOARD</h4>

                </div>

            </div>

            <div class="row">

      
            </div>


        </div>
        <div class="row">

              <div class="col-md-12 col-sm-12 col-xs-12">
                    <div id="carousel-example" class="carousel slide slide-bdr" data-ride="carousel" >
                   
                    <div class="carousel-inner">
                        <div class="item active">

                             <img src="images/qqqqqqqqqqqq.jpg" alt="" />
                           
                        </div>
                        <div class="item">
                          <img src="images/Water%20Green%20Nature%20Wallpaper.jpg" />
                          
                        </div>
                        
                    </div>
                    
                     <ol class="carousel-indicators">
                        <li data-target="#carousel-example" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example" data-slide-to="1"></li>
                        
                    </ol>
                    
                     <a class="left carousel-control" href="#carousel-example" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
  </a>
  <a class="right carousel-control" href="#carousel-example" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
  </a>
                </div>
              </div>
                 
              
             
                 </div>
    </div>
    
    <section class="footer-section">
        
       
    </section>
    
    <script src="assets/js/jquery-1.10.2.js"></script>
    
    <script src="assets/js/bootstrap.js"></script>
    
    <script src="assets/js/custom.js"></script>

</body>
</html>
