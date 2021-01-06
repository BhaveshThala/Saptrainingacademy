<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminlogin.aspx.cs" Inherits="SAP.Admin.adminlogin" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="adminlogin.css">
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Admin Login</title>
</head>

<script>
    function invalid() {
        window.alert("Invalid Credential");
    }
</script>

<body>
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
        <div class="container">

            <div class="circleTop"></div>
            <div class="content">
                <h1>Login</h1>
                <div class="form-group">
                    <label for="">Email</label>
                    <br>
                    <asp:TextBox ID="TextBox1" class="form" runat="server"  aria-describedby="helpId" required="required"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="">Password</label>
                    <br>
                    <asp:TextBox ID="TextBox2" class="form" runat="server" TextMode="Password" required="required"></asp:TextBox>
                </div>
                <p>
                </p>
                <div class="icons">
                    <a href="http://www.google-plus.com"><i class="fa fa-google-plus-official" aria-hidden="true"></i>
                    </a>
                    <a href="https://www.facebook.com"><i class="fa fa-facebook-square" aria-hidden="true"></i>
                    </a>
                    <a href="http://www.twitter.com"><i class="fa fa-twitter-square" aria-hidden="true"></i>
                    </a>
                </div>
                <asp:Button ID="Button1" runat="server" Text="Login" class="btn" OnClick="Button1_Click" />


            </div>
            <div class="circleBottom"></div>

        </div>
    </form>
</body>

</html>
