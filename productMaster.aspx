<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="productMaster.aspx.cs" Inherits="productMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
                            Product Page
                             <a href="Dasboardforadmin.aspx"><i class="fa fa-mail-reply-all pull-right" style="font-size:24px;" title="Back"></i></a>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Products</label>
                                            <asp:TextBox ID="txtproduct" runat="server" CssClass="form-control"></asp:TextBox>
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
                                            Text="Submit" OnClick="SaveButton_Click"  />
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
                                            <asp:Label ID="lblsucess" runat="server" Visible="false"></asp:Label>
                                            <asp:HiddenField ID="hdnField" runat="server" />
                                        </b>
                                    </div>
                                    <div class="col-md-4">
                                    </div>
                                </div>
                            </div>

                             <div class="row">
                                <div class="col-xs-12">

                                    <div class="box">
                                        <div class="box-header">
                                            <h3 class="box-title">Product Details</h3>
                                        </div>
                                        <!-- /.box-header -->
                                        <div class="box-body">

                                            <table id="example1" class="table table-bordered table-striped">

                                                <asp:GridView ID="gvproDetails" runat="server" Width="100%"
                                                    AutoGenerateColumns="false" CssClass="Gridview" HeaderStyle-BackColor="#00A2F6"
                                                    ShowFooter="false" HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White"
                                                    AllowPaging="true" PageSize="10"
                                                    PagerSettings-Mode="Numeric" PagerSettings-Position="Bottom"
                                                    PagerStyle-HorizontalAlign="Right" OnPageIndexChanging="gvproDetails_PageIndexChanging"
                                                    OnRowCommand="gvproDetails_RowCommand"
                                                    OnRowDeleting="gvproDetails_RowDeleting"
                                                    OnRowEditing="gvproDetails_RowEditing"
                                                    OnRowUpdating="gvproDetails_RowUpdating">

                                                    <Columns>


                                                        <asp:TemplateField HeaderText="Expense Id" Visible="false">
                                                            <EditItemTemplate>
                                                                <asp:Label ID="lblBankId" runat="server" Text='<%#Eval("Id") %>' />
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblBankId" runat="server" Text='<%#Eval("Id") %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Bank Name">
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="txtBankName" Width="80%" runat="server" Text='<%#Eval("ProductName") %>' />
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblBankName" Width="80%" runat="server" Text='<%#Eval("ProductName") %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Action" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                &nbsp;<asp:ImageButton ID="imgbtnEdit" CommandArgument='<%#Eval("Id") %>' CommandName="Edit" runat="server" ImageUrl="~/img/edit2.png" ToolTip="Edit" Height="20px" Width="20px" />
                                                                &nbsp;&nbsp;<asp:ImageButton ID="imgbtnDelete" CommandArgument='<%#Eval("Id") %>' CommandName="Delete" runat="server" OnClientClick="return DeleteItem()" ImageUrl="~/img/delete2.png" ToolTip="Delete" Height="20px" Width="20px" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                    </Columns>
                                                </asp:GridView>

                                            </table>
                                        </div>
                                        <!-- /.box-body -->
                                    </div>
                                    <!-- /.box -->
                                    <%--</asp:Panel>--%>
                                </div>
                                <!-- /.col -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

