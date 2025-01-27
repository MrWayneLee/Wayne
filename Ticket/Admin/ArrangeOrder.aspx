﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ArrangeOrder.aspx.cs" Inherits="Admin_ArrangeOrder" enableEventValidation="false" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>订单管理页</title>
    <link href="../UI-Extend/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../UI-Extend/css/customstyle.css" rel="stylesheet" type="text/css" />
    <script src="../UI-Extend/js/jquery-3.4.1.min.js"></script>
    <script src="../UI-Extend/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container index-1">
            <div class="row">
                <div class="col-md-5">
                    <div class="panel">
                        <div class="panel-body">
                            <h3>当前所有的订单</h3>
                            <hr />
                            <div class="row">
                                <div class="col-md-6">
                                    <a class="btn btn-primary detail-1" href="Main.aspx">返回主页</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel">
                        <div class="panel-body">
                            <h3>按照条件查询订单</h3>
                            <hr />
                            <div class="row">
                                <div class="form-inline">
                                    <div class="col-md-6 col-md-offset-3 index-3">
                                        <label>按照:</label>
                                        <asp:DropDownList class="form-control" ID="ddlKey" runat="server">
                                            <asp:ListItem Value="OrderId" Text="订单号"></asp:ListItem>
                                            <asp:ListItem Value="Username" Text="用户名"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="row order-2">
                                <div class="col-md-6 col-md-offset-3">
                                    <asp:TextBox class="form-control" ID="tbWord" runat="server" placeholder="键入订单号或用户名"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row order-2">
                                <div class="col-md-6 col-md-offset-3 check-4 index-3">
                                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="row order-2">
                                <div class="col-md-4 col-md-offset-4">
                                    <asp:Button ID="btnQuery" class="btn btn-primary detail-1" runat="server" Text="查询" OnClick="btnQuery_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-7">
                    <div class="panel">
                        <div class="panel-body">
                            <asp:DataList ID="dlResult" class="detail-1" runat="server">
                                <ItemTemplate>
                                    <div class="row check-4">
                                        <div class="col-md-4 index-3">购买用户</div>
                                        <div class="col-md-8 index-3">订单号</div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4 index-3 detail-2">
                                            <asp:Label ID="lblUser" runat="server" Text='<%#Eval("Username") %>'></asp:Label>
                                        </div>
                                        <div class="col-md-8 index-3 detail-2">
                                            <asp:Label ID="lblOrderId" runat="server" Text='<%#Eval("OrderId") %>'></asp:Label>
                                        </div>
                                    </div>
                                    <div class="row check-4">
                                        <div class="col-md-4 col-md-offset-1 index-3">片名</div>
                                        <div class="col-md-3 index-3">日期</div>
                                        <div class="col-md-4 index-3">场次</div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4 col-md-offset-1 index-3 detail-2">
                                            <asp:Label ID="lblTitle" runat="server" Text='<%#GetTitle(Eval("MovieId").ToString()) %>'></asp:Label>
                                        </div>
                                        <div class="col-md-3 index-3 detail-2">
                                            <asp:Label ID="lblDate" runat="server" Text='<%#GetCut(Eval("Date").ToString()) %>'></asp:Label>
                                        </div>
                                        <div class="col-md-4 index-3 detail-2">
                                            <asp:Label ID="lblTime" runat="server" Text='<%#Eval("Time") %>'></asp:Label>
                                        </div>
                                    </div>
                                    <div class="row check-4">
                                        <div class="col-md-2 col-md-offset-2 index-3">大厅</div>
                                        <div class="col-md-2 index-3">数量</div>
                                        <div class="col-md-4 index-3">支付状态</div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2 col-md-offset-2 index-3 detail-2">
                                            <asp:Label ID="lblHall" runat="server" Text='<%#Eval("Hall") %>'></asp:Label>
                                        </div>
                                        <div class="col-md-2 index-3 detail-2">
                                            <asp:Label ID="lblAmount" runat="server" Text='<%#Eval("Amount") %>'></asp:Label>
                                        </div>
                                        <div class="col-md-4 index-3 detail-2">
                                            <asp:Label ID="lblPaymentStatus" runat="server" Text='<%#GetPaymentStatus(Eval("PaymentStatus").ToString()) %>'></asp:Label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <asp:Button ID="btnRemove" class="btn btn-danger detail-1" runat="server" Text="删除订单" OnClick="btnRemove_Click" CommandArgument='<%#Eval("OrderId") %>' />
                                        </div>
                                    </div>
                                </ItemTemplate>
                                <SeparatorTemplate>
                                    <hr />
                                </SeparatorTemplate>
                            </asp:DataList>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
