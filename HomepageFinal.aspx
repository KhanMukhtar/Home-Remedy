<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="HomepageFinal.aspx.cs" Inherits="HomepageFinal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="content-wrapper">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div id="carousel-example" class="carousel slide slide-bdr" data-ride="carousel" style="width: 100%">

                        <div class="carousel-inner">
                            <div class="item active">

                                <img src="assets/img/14711.jpg" alt="" />

                            </div>
                            <div class="item">
                                <img src="assets/img/111.jpg" alt="" />

                            </div>
                            <div class="item">
                                <img src="assets/img/33311.jpg" alt="" />

                            </div>
                            <div class="item">
                                <img src="assets/img/774111.jpg" alt="" />

                            </div>


                        </div>
                        <!--INDICATORS-->
                        <ol class="carousel-indicators">
                            <li data-target="#carousel-example" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-example" data-slide-to="1"></li>
                            <li data-target="#carousel-example" data-slide-to="2"></li>
                            <li data-target="#carousel-example" data-slide-to="2"></li>
                        </ol>
                        <!--PREVIUS-NEXT BUTTONS-->
                        <a class="left carousel-control" href="#carousel-example" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left"></span>
                        </a>
                        <a class="right carousel-control" href="#carousel-example" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right"></span>
                        </a>
                    </div>
                </div>
            </div>
            <hr />
            <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-6">
                    <div class="alert alert-info back-widget-set text-center">
                        <h4>SYMPTOMS</h4>

                        <h3>&nbsp;&nbsp;<a href="symptomsFinal.aspx"><img src="assets/img/131.png" alt="" /></a>
                        </h3>

                    </div>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-6">
                    <div class="alert alert-success back-widget-set text-center">
                        <h4>BEAUTY</h4>
                        <h3 style="height: 100%">
                            <a href="beautyFinal.aspx">
                            <img src="assets/img/rsz_1128.png" alt="" /></a></h3>

                    </div>
                </div>

            </div>
            <hr />
            <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-6">
                    <div class="alert alert-info back-widget-set text-center">
                        <h4>YOGA & MUDRAS</h4>
                        <h3>&nbsp;<a href="YogaandMudrasfinal.aspx"><img src="assets/img/rsz_36.jpg" alt="" /></a>
                        </h3>
                    </div>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-6">
                    <div class="alert alert-success back-widget-set text-center">
                        <h4>DOCTORS</h4>
                        <h3><a href="DoctorFinal.aspx">
                            <img src="assets/img/37.png" alt="" /></a></h3>
                    </div>
                </div>
            </div>

            <hr />
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="alert alert-info back-widget-set text-center">
                        <h4> PRODUCTS DESCRIPTION </h4>
                        <h3>&nbsp;<a href="ProductFinal.aspx"><img src="assets/img/1234.jpg" alt="" /></a>
                        </h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

