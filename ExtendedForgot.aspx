<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExtendedForgot.aspx.cs" Inherits="SAP.Users.ExtendedForgot" %>


<!DOCTYPE html>
<style type="text/css">
    body {
        background-image: url("BackgroundImages/Ad.jpg");
    }
</style>
<style type="text/css">
    .form-control {
        margin-top: 10px;
    }

    input#Button1 {
        margin-top: 25px;
    }

    input#Button2 {
        margin-top: 25px;
    }
</style>
<html>
<head>
    <title>Forgot Password</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="forgot.css">
    <script>
        function match(txt) {
            var at = txt.value;
            if (at.length >= 5 && at.length <= 8) {
                document.getElementById("Button2").style.visibility = "visible";
            }
            else {
                document.getElementById("Button2").style.visibility = "hidden";
            }
        }
    </script>
</head>

<body>
    <div id="highlighted" class="hl-basic hidden-xs">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-9 col-sm-offset-3 col-md-9 col-md-offset-3 col-lg-10 col-lg-offset-2">
                    <h1>Forgot Password</h1>
                </div>
            </div>
        </div>
    </div>
    <form id="fgt" runat="server">
        <div id="content" class="interior-page">
            <div class="container-fluid">
                <div class="row">
                    <!--Sidebar-->
                    <div class="col-sm-3 col-md-3 col-lg-2 sidebar equal-height interior-page-nav hidden-xs">
                        <div class="dynamicDiv panel-group" id="dd.0.1.0">
                            <div id="subMenu" class="panel panel-default">
                                <ul class="subMenuHighlight panel-heading">
                                    <li class="subMenuHighlight panel-title" id="subMenuHighlight">
                                        <a id="li_291" class="subMenuHighlight" href="Login.aspx"><span>Register</span></a>
                                    </li>
                                </ul>
                                <ul class="panel-heading">
                                    <li class="panel-title">
                                        <a class="subMenu1" href="Forgot.aspx"><span class="subMenuHighlight">Forgot Password</span></a>
                                    </li>
                                </ul>
                                <ul class="panel-heading">
                                    <li class="panel-title">
                                        <a class="subMenu1" href="Login.aspx"><span>Login</span></a>
                                    </li>
                                </ul>
                            </div>

                        </div>
                    </div>

                    <!--Content-->
                    <div class="col-sm-9 col-md-9 col-lg-10 content equal-height">
                        <div class="content-area-right">
                            <div class="content-crumb-div">
                                <a href="../Home/Home.aspx">Home</a> | <a href="Login.aspx">Your Account</a> | Forgot Password
                            </div>
                            <div class="row">
                                <div class="col-md-5 forgot-form">
                                    <asp:Label ID="Label1" runat="server" Text="Enter your OTP below." Style="color: black;"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="TextBox1" class="form-control" runat="server" MaxLength="4" ToolTip="Enter OTP" placeholder="Enter OTP"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="Please Enter Your OTP" ForeColor="#CC9900"></asp:RequiredFieldValidator>
                                    <asp:Button ID="Button1" class="btn-primary" runat="server" Text="Submit" OnClick="Button1_Click"/>


                                    <asp:TextBox ID="TextBox2" class="form-control" runat="server" ToolTip="Create Password" MaxLength="8" placeholder="Enter your Password" Visible="false" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Visible="false" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="Please Enter Your New Password" ForeColor="#CC9900"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:TextBox ID="TextBox3" class="form-control" runat="server" ToolTip="Confirm Password" MaxLength="8" placeholder="Enter your Confirm Password" Visible="false" ochange="match(this)"></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator1" Visible="false" runat="server" ErrorMessage="Password and Confirm Password must be same." ControlToCompare="TextBox2" ControlToValidate="TextBox3" ForeColor="#CC9900" onchange="match(this)"></asp:CompareValidator>
                                    <asp:Button ID="Button2" class="btn-primary" runat="server" Text="Change" Visible="false" OnClick="Button2_Click" />


                                </div>
                                <div class="col-md-5 forgot-return" style="display: none;">
                                    <h2>Reset Password Sent</h2>
                                    <p>An email has been sent to your address with a reset password you can use to access your account.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
<script type="text/javascript">
    {
        function DisableBackButton() {
            window.history.forward()
        }

        DisableBackButton();

        window.onload = DisableBackButton;
        window.onpageshow = function (evt) { if (evt.persisted) DisableBackButton() }
        window.onunload = function () { void (0) }
    }
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</html>

