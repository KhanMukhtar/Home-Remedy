<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="ProductFinal.aspx.cs" Inherits="ProductFinal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-wrapper">
        <div class="container">
            <div class="row pad-botm">
                <div class="col-md-12">
                    <h4 class="header-line">Search for Product's</h4>

                </div>

            </div>


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
                <div class="col-md-12">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h3>PRODUCT'S</h3>
                        </div>
                        <div class="panel-body">

                            <div class="row">
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                        </div>
                                    </div>
                                    <div class="col-md-1">
                                        <div class="form-group">
                                            <label>PRODUCT'S</label>
                                        </div>
                                    </div>
                                    <div class="col-md-4" runat="server">
                                        <div class="" runat="server">
                                            <asp:DropDownList ID="ddlproduct" runat="server" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                        </div>
                                    </div>
                                    <div class="col-md-4" runat="server">
                                        <div class="glyphicon glyphicon-search">
                                            <asp:Button ID="Button1" type="submit" class="btn btn-danger" runat="server"
                                                Text="SEARCH " OnClick="Button1_Click" />
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <asp:GridView ID="grdprodetails" runat="server" AutoGenerateColumns="false" Width="100%" HeaderStyle-BackColor="#00ffec" ItemStyle-HorizontalAlign="">
                                        <Columns>
                                            
                                            <asp:BoundField HeaderText="Product Name" HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="center" DataField="ProductName">
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>

                                            <asp:BoundField HeaderText="Company Name" ItemStyle-HorizontalAlign="center" DataField="CompanyName" />

                                            <asp:BoundField HeaderText="Description"  HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="center" DataField="SDescription">
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>

                                            <asp:BoundField HeaderText="Shop Details"  HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="center" DataField="Shopdt" />

                                            <asp:BoundField HeaderText="ProductImage" DataField="ProductImage" Visible="false" />

                                            <asp:TemplateField HeaderText="Image">
                                                <ItemTemplate>
                                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%#"data:Image/png;base64,"+ Convert.ToBase64String((byte[])Eval("ProductImage"))%>' Height="150px" Width="150px" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>

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
</asp:Content>

