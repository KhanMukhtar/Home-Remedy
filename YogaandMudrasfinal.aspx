<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="YogaandMudrasfinal.aspx.cs" Inherits="YogaandMudrasfinal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content-wrapper">
        <div class="container">
            <div class="row">
                 <h4 class="header-line">YOGA'S

                 </h4>
                &nbsp;

                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div id="carousel-example" class="carousel slide slide-bdr" data-ride="carousel" style="width: 100%">

                        <div class="carousel-inner">
                            <div class="item active">

                                <img src="assets/img/maxresdefault.jpg" alt="" />

                            </div>
                            <div class="item">
                                <img src="assets/img/meditation.jpg"alt="" />

                            </div>
                            <div class="item">
                                <img src="assets/img/rsz_yoga311.jpg" alt=""/>

                            </div>
                            <div class="item">
                                <img src="assets/img/rsz_3yoga211.jpg" alt=""/>

                            </div>


                        </div>
                       
                        <ol class="carousel-indicators">
                            <li data-target="#carousel-example" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-example" data-slide-to="1"></li>
                            <li data-target="#carousel-example" data-slide-to="2"></li>
                            <li data-target="#carousel-example" data-slide-to="2"></li>
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
            <hr />
            <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-6">
                    <div class="alert alert-info back-widget-set text-center">
                        <h4>YOGA</h4>

                        <h3>&nbsp;&nbsp;<a href="typeof yoga final.aspx"><img src="assets/img/yoga.png" /></a>
                        </h3>

                    </div>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-6">
                    <div class="alert alert-success back-widget-set text-center">
                        <h4>MUDDRAS</h4>
                        <h3 style="height: 100%"></h3>
                            
                        <a href="mudras.aspx"><img src="assets/img/mudra.png" /></a>

                    </div>
                </div>

            </div>
            <hr />
            
            </div>
            </div>
</asp:Content>

