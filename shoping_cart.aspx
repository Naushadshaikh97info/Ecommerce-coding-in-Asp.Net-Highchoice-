<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="shoping_cart.aspx.cs" Inherits="shoping_basket" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="content">
        <!--Breadcrumb Part Start-->
        <div class="breadcrumb"><a style="color: #333333; font-size: 12px;" href="Default.aspx">Home</a><a style="color: #333333; font-size: 12px;"> »</a> <a style="color: #333333; font-size: 12px;" href="#">Shopping Cart</a></div>
        <!--Breadcrumb Part End-->
        <h1>Shopping Cart</h1>
        <div enctype="multipart/form-data" method="post" action="">
            <div class="cart-info">
                <table>
                    <thead>
                        <tr>
                            <td class="image">Image</td>
                            <td class="name">Product Name</td>
                            <td class="model">Unit Price</td>
                            <td class="quantity">Quantity</td>
                            <td class="price" style="padding-left: 5px;">Total</td>
                            <td class="total">Delete</td>
                            <asp:GridView ID="grd_shoping" runat="server" DataKeyNames="productcode" AutoGenerateColumns="false"
                                AllowPaging="true" PageSize="10" Width="100%" OnRowDeleting="grd_shoping_RowDeleting" GridLines="None" ShowHeader="false"
                                OnRowDataBound="grd_shoping_RowDataBound">
                                <Columns>
                                    <asp:TemplateField ItemStyle-CssClass="image" ItemStyle-Width="14%">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imgbtn" runat="server" ImageUrl='<%#Eval("productimg") %>' Height="80"
                                                Width="80" CssClass="grid" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="productname" ItemStyle-CssClass="name" ItemStyle-Width="25%" />
                                    <asp:BoundField DataField="actualprice" ItemStyle-CssClass="price" ItemStyle-Width="20%" />
                                    <asp:TemplateField ItemStyle-CssClass="quantity" ItemStyle-Width="8%">
                                        <ItemTemplate>
                                            <asp:DropDownList ID="drpquantity" runat="server" AutoPostBack="true" OnSelectedIndexChanged="drpquantity_SelectedIndexChanged">
                                                <asp:ListItem>1</asp:ListItem>
                                                <asp:ListItem>2</asp:ListItem>
                                                <asp:ListItem>3</asp:ListItem>
                                                <asp:ListItem>4</asp:ListItem>
                                                <asp:ListItem>5</asp:ListItem>
                                                <asp:ListItem>6</asp:ListItem>
                                                <asp:ListItem>7</asp:ListItem>
                                                <asp:ListItem>8</asp:ListItem>
                                                <asp:ListItem>9</asp:ListItem>
                                                <asp:ListItem>10</asp:ListItem>
                                                <asp:ListItem>11</asp:ListItem>
                                                <asp:ListItem>12</asp:ListItem>
                                                <asp:ListItem>13</asp:ListItem>
                                                <asp:ListItem>14</asp:ListItem>
                                                <asp:ListItem>15</asp:ListItem>
                                            </asp:DropDownList>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="totalprice" ItemStyle-Width="23%" ItemStyle-HorizontalAlign="Right" />
                                    <asp:CommandField ShowDeleteButton="true" ButtonType="Image" DeleteImageUrl="~/image/remove.png" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Right" />
                                </Columns>
                            </asp:GridView>
                        </tr>
                    </thead>
                </table>
            </div>  
        </div>
        <div class="cart-total">
            <table id="total">
                <tbody>
                    <tr>
                        <td class="right"><b>Sub Total:</b></td>
                        <td class="right">र<asp:Label ID="lbltotal_amt" runat="server" Text=""></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="right"><b>Delivery  Charge:</b></td>
                        <td class="right">र<asp:Label ID="lbl_delivery_fee" runat="server" Text=""></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="right"><b>Total:</b></td>
                        <td class="right">र<asp:Label ID="lbltotal_amt1" runat="server" Text=""></asp:Label></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="buttons">
            <div class="right"><a href="checkout.aspx"><asp:LinkButton ID="lnk_chekout" class="button"  runat="server" Text="Checkout" OnClick="lnk_chekout_Click"></asp:LinkButton>  </a></div>
            <div class="center"><a class="button" href="Default.aspx">Continue Shopping</a></div>
        </div>
    </div>
</asp:Content>  

