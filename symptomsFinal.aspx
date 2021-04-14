<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="symptomsFinal.aspx.cs" Inherits="symptomsFinal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    
    <div class="content-wrapper">
        <div class="container">
            <div class="row pad-botm">
                <div class="col-md-12">
                    <h4 class="header-line">Search for Symptom's</h4>

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
                <div class="col-md-12">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h3>SYMPTOM'S</h3>
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
                                            <label>SYMPTOM'S</label>
                                        </div>
                                    </div>
                                    <div class="col-md-4" runat="server">
                                        <div class="" runat="server">
                                            <asp:DropDownList ID="ddlsymptoms" runat="server" CssClass="form-control"></asp:DropDownList>
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
                            <hr />
                            <br />
                            <div class="row">
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="col-md-4">
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:GridView ID="GridView2" runat="server" Width="18%"
                                                AutoGenerateColumns="false" CssClass="Gridview" HeaderStyle-BackColor="#00A2F6"
                                                ShowFooter="false" HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White"
                                                AllowPaging="true" PageSize="10" PagerSettings-Mode="Numeric" PagerSettings-Position="Bottom"
                                                PagerStyle-HorizontalAlign="left">
                                                <Columns>

                                                    <asp:TemplateField HeaderText="SymptomsImage">
                                                        <ItemTemplate>
                                                            <asp:Image ID="Image1" runat="server" ImageUrl='<%#"data:Image/png;base64,"+ Convert.ToBase64String((byte[])Eval("SymptomsImage"))%>' Height="200px" Width="333px" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="col-md-4">
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:GridView ID="gvDetails" runat="server" Width="100%"
                                                AutoGenerateColumns="false" CssClass="Gridview" HeaderStyle-BackColor="#00A2F6"
                                                ShowFooter="false" HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White"
                                                AllowPaging="true" PageSize="10"
                                                PagerSettings-Mode="Numeric" PagerSettings-Position="Bottom"
                                                PagerStyle-HorizontalAlign="Right">
                                                <Columns>

                                                    <asp:TemplateField HeaderText="Ingredient Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblIngredientName" runat="server" Text='<%#Eval("IngredientName") %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Quantity">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblQuantity" runat="server" Text='<%#Eval("Quantity") %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="col-md-2">
                                    </div>
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <asp:GridView ID="GridView1" runat="server" Width="100%"
                                                AutoGenerateColumns="false" CssClass="Gridview" HeaderStyle-BackColor="#00A2F6"
                                                ShowFooter="false" HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White"
                                                AllowPaging="true" PageSize="10"
                                                PagerSettings-Mode="Numeric" PagerSettings-Position="Bottom"
                                                PagerStyle-HorizontalAlign="Right">
                                                <Columns>

                                                    <asp:TemplateField HeaderText="Description">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSDescription" runat="server" Text='<%#Eval("SDescription") %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                    </div>
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

