<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="BeautyForUserAdmin.aspx.cs" Inherits="BeautyForUserAdmin" %>

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
                            Beauty Page For Admin
                             <a href="Dasboardforadmin.aspx"><i class="fa fa-mail-reply-all pull-right" style="font-size:24px;" title="Back"></i></a>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>Beauty</label>
                                            <asp:DropDownList ID="ddlBeauty" runat="server" CssClass="form-control"></asp:DropDownList>
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
                                                <label>Indgrent Name</label>
                                                <asp:TextBox ID="txtingname" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <div class="form-group">
                                                <label>Quantity</label>
                                                <asp:TextBox ID="txtquntity" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Description</label>
                                            <asp:TextBox ID="txtdes" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
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
                                    <asp:GridView ID="grdbty" runat="server" AutoGenerateColumns="false" Width="100%"
                                         OnPageIndexChanging="grdbty_PageIndexChanging"
                                                    OnRowCommand="grdbty_RowCommand"
                                                    OnRowDeleting="grdbty_RowDeleting"
                                                    OnRowEditing="grdbty_RowEditing"
                                                    OnRowUpdating="grdbty_RowUpdating">

                                        <Columns>

                                            <asp:TemplateField HeaderText="Expense Id" Visible="false">
                                                            <EditItemTemplate>
                                                                <asp:Label ID="lblbtyId" runat="server" Text='<%#Eval("Id") %>' />
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblbtyId" runat="server" Text='<%#Eval("Id") %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                            <asp:BoundField HeaderText="BeautyName" DataField="BeautyName" />
                                            <asp:BoundField HeaderText="IngredientName" DataField="IngredientName" />
                                            <asp:BoundField HeaderText="Quantity" DataField="Quantity" />
                                            <asp:BoundField HeaderText="Description" DataField="SDescription" />
                                            <asp:BoundField HeaderText="BeautyImage" DataField="BeautyImage" Visible="false" />
                                            <asp:TemplateField HeaderText="Image">
                                                <ItemTemplate>
                                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%#"data:Image/png;base64,"+ Convert.ToBase64String((byte[])Eval("BeautyImage"))%>' Height="150px" Width="150px" />
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

