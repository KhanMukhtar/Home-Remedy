<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="productforadmin.aspx.cs" Inherits="productforadmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="content-wrapper">
        <div class="container">
            <div class="row pad-botm">
            </div>
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="panel panel-danger">
                        <div class="panel-heading">
                           Product Page For Admin
                                <a href="Dasboardforadmin.aspx"><i class="fa fa-mail-reply-all pull-right" style="font-size:24px;" title="Back"></i></a>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>Product</label>
                                            <asp:DropDownList ID="ddlProduct" runat="server" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <div class="form-group">
                                                <label>Select Image</label>
                                                <asp:FileUpload ID="fileuploadEmpImage" runat="server" CssClass="form-control" />
                                                <asp:Label ID="StatusLabel" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <div class="form-group">
                                                <label>Product Name</label>
                                                <asp:TextBox ID="txtProductName" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <div class="form-group">
                                                <label>Company Name </label>
                                                <asp:TextBox ID="txtCompany" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Description</label>
                                            <asp:TextBox ID="txtdes" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Shop Details</label>
                                            <asp:TextBox ID="txtshop" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="col-md-4">
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Button ID="SaveButton" type="submit" class="btn btn-danger" runat="server"
                                            Text="Submit" OnClick="SaveButton_Click" />
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
                                        <b>
                                            <asp:Label ID="lblsucess" runat="server" Visible="false"></asp:Label></b>
                                    </div>
                                    <div class="col-md-4">
                                    </div>
                                </div>
                            </div>


                            <div class="row">
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <asp:GridView ID="grdpro" runat="server" AutoGenerateColumns="false" Width="100%"
                                        OnPageIndexChanging="grdpro_PageIndexChanging"
                                                    OnRowCommand="grdpro_RowCommand"
                                                    OnRowDeleting="grdpro_RowDeleting"
                                                    OnRowEditing="grdpro_RowEditing"
                                                    OnRowUpdating="grdpro_RowUpdating">
                                        <Columns>

                                            <asp:TemplateField HeaderText="Expense Id" Visible="false">
                                                            <EditItemTemplate>
                                                                <asp:Label ID="lblproId" runat="server" Text='<%#Eval("Id") %>' />
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblproId" runat="server" Text='<%#Eval("Id") %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                            <asp:BoundField HeaderText="Product Name" DataField="DllProductName" />
                                            <asp:BoundField HeaderText="Product Name" DataField="ProductName" />
                                            <asp:BoundField HeaderText="Company Name" DataField="CompanyName" />
                                            <asp:BoundField HeaderText="Description" DataField="SDescription" />
                                            <asp:BoundField HeaderText="Shop Details" DataField="Shopdt" />
                                            <asp:BoundField HeaderText="ProductImage" DataField="ProductImage" Visible="false" />
                                            <asp:TemplateField HeaderText="Image">
                                                <ItemTemplate>
                                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%#"data:Image/png;base64,"+ Convert.ToBase64String((byte[])Eval("ProductImage"))%>' Height="150px" Width="150px" />
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                             <asp:TemplateField HeaderText="Action" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    &nbsp;
                                                    &nbsp;&nbsp;<asp:ImageButton ID="imgbtnDelete" CommandArgument='<%#Eval("Id") %>' CommandName="Delete" runat="server" OnClientClick="return DeleteItem()" ImageUrl="~/img/delete2.png" ToolTip="Delete" Height="20px" Width="20px" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

