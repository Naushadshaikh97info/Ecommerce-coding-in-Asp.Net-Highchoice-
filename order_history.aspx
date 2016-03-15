<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="order_history.aspx.cs" Inherits="Order_History_2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .name2 {
            text-align:center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="content">
        <!--Breadcrumb Part Start-->
        <div class="breadcrumb"><a style="color: #333333; font-size: 12px;" href="Default.aspx">Home</a><a style="color: #333333; font-size: 12px;"> »</a> <a style="color: #333333; font-size: 12px;" href="#">Order History</a></div>
        <!--Breadcrumb Part End-->
        <h1>Order History</h1>
        <asp:Panel ID="Panel2" runat="server">
            <div enctype="multipart/form-data" method="post" action="">
                <div class="cart-info">
                    <table>
                        <thead>
                            <tr>
                                <td class="image">Order#</td>
                                <td class="name">DateTime</td>
                                <td class="name">Total Amount(र)</td>
                                <td class="name">Status</td>
                                <asp:GridView ID="grd_shoping" runat="server" DataKeyNames="code" AutoGenerateColumns="false"
                                    AllowPaging="true" PageSize="10" Width="100%" GridLines="None" ShowHeader="false">
                                    <Columns>
                                        <asp:TemplateField ItemStyle-CssClass="image" ItemStyle-Width="17%">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton12" runat="server" CommandArgument='<%#Eval("code") %>'
                                                    ForeColor="Blue" Text='<%#Eval("order_no") %>' Width="80" OnClick="onclick_order"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="datetime" ItemStyle-CssClass="name" ItemStyle-Width="29%" />
                                        <asp:BoundField DataField="amount" ItemStyle-CssClass="name" ItemStyle-Width="35%" />
                                        <asp:BoundField DataField="status" ItemStyle-CssClass="name" ItemStyle-Width="53%" />
                                    </Columns>
                                </asp:GridView>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </asp:Panel>
        <asp:Panel ID="Panel1" runat="server" Visible="false">
            <div enctype="multipart/form-data" method="post" action="">
                <div class="cart-info">
                    <table class="table table-bordered table-striped" id="Table4">
                        <tr>
                            <td>
                                <h2>FULL ORDER VIEW</h2>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>ORDER NUMBER &nbsp;</b>-&nbsp;&nbsp
                    <asp:Label ID="lbl_orderno" runat="server" Text="" Font-Bold="true" ForeColor="#0066CC"></asp:Label>
                                <asp:LinkButton ID="LinkButton1" runat="server"
                                    Style="float: right;"
                                    OnClick="LinkButton12_Click"> Back To Order List</asp:LinkButton>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h3>View Order Detail</h3>
                            </td>
                        </tr>
                    </table>
                    <table>
                        <thead>
                            <tr>
                                <td class="image">Product Code</td>
                                <td class="name">Product</td>
                                <td class="name">Quantity</td>
                                <td class="name">Price</td>
                                <td class="name" style="padding-left: 5px;">Image</td>
                                <asp:GridView ID="grd_shopingcart" runat="server" DataKeyNames="code" AutoGenerateColumns="false"
                                    AllowPaging="true" PageSize="10" Width="100%" GridLines="None" ShowHeader="false">
                                    <Columns>
                                        <asp:BoundField DataField="productcode" ItemStyle-CssClass="name" ItemStyle-Width="6%" />
                                        <asp:BoundField DataField="product" ItemStyle-CssClass="name" ItemStyle-Width="4%" />
                                        <asp:BoundField DataField="qty" ItemStyle-CssClass="name" ItemStyle-Width="3%" />
                                        <asp:BoundField DataField="price" ItemStyle-CssClass="name" ItemStyle-Width="1%" />
                                        <asp:TemplateField ItemStyle-CssClass="image" ItemStyle-Width="3%">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imgbtn" runat="server" ImageUrl='<%#Eval("img") %>' Height="80"
                                                    Width="80" CssClass="grid" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </asp:Panel>
       
       
    </div>
</asp:Content>



