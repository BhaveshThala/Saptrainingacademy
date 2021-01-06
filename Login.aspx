<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SAP.Login.Login" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://kit.fontawesome.com/64d58efce2.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
    <link rel="stylesheet" href="login.css" />
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <title>Register</title>
</head>
<script>
    function check(txt) {
        var email = txt.value;
        PageMethods.getEmail(email, onSuccess, onError);
        function onSuccess(result) {
            if (result == "1") {
                swal(
                    "Oops!",
                    "Email already Registered",
                    "info"
                );
            }
        }

        function onError() {

        }
    }

    function fetch(txt) {
        var phone = txt.value;
        PageMethods.getPhone(phone, onSuccess, onError);
        function onSuccess(result) {
            if (result == "1") {
                swal(
                    "Oops!",
                    "Phone Number already Registered",
                    "info"
                );
            }
        }
        function onError() {

        }
    }

    function showError() {
        swal(
            "Oops!",
            "User already Registered",
            "error"
        );
    }

    function login(txt) {
        var email = txt.value;
        PageMethods.getloginEmail(email, onSuccess, onError);
        function onSuccess(result) {
            if (result == "0") {
                swal(
                    "Oops!",
                    "Email not Registered",
                    "error"
                );
            }
        }
        function onError() {

        }
    }

    function invalidData() {
        swal(
            "Oops",
            "User not registered",
            "error"
        )
    }


</script>
<body>
    <div class="container">
        <div class="forms-container">
            <div class="signin-signup">
                <form method="post" action="Login.aspx" class="sign-in-form" id="form2">
                    <h2 class="title">Sign in</h2>
                    <div class="input-field">
                        <i class="fas fa-user"></i>
                        <input type="email" placeholder="Enter your email" name="email" required="required" onchange="login(this)" />
                    </div>
                    <div class="input-field">
                        <i class="far fa-eye" id="togglePassword"></i>
                        <input type="password" placeholder="Password" name="password" id="password" maxlength="8" required="required">
                    </div>
                    <button type="submit" value="submit" class="btn solid">Login</button>
                    <a href="Forgot.aspx" class="social-text">Forgot Password</a>
                </form>
                <form runat="server" class="sign-up-form">
                    <asp:ScriptManager runat="server" ID="ScriptOne" EnablePageMethods="true" />
                    <h2 class="title">Sign up</h2>
                    <div class="input-field">
                        <i class="fas fa-user"></i>
                        <asp:TextBox ID="NameBox" runat="server" placeholder="Enter your name" required="required" />
                    </div>
                    <div class="input-field">
                        <i class="fas fa-envelope"></i>
                        <asp:TextBox ID="SignupEmail" runat="server" TextMode="Email" placeholder="Enter your email" onchange="check(this)" required="required" />
                    </div>
                    <div class="input-field">
                        <i class="fa fa-phone" aria-hidden="true"></i>
                        <asp:TextBox ID="SignupPhone" runat="server" placeholder="Enter your Phone Number" required="required" onchange="fetch(this)" />
                    </div>
                    <div class="input-field">
                        <i class="fas fa-lock"></i>
                        <asp:TextBox ID="SignupPass" runat="server" TextMode="Password" MaxLength="8" placeholder="Enter your Password" required="required" />
                    </div>
                    <div class="input-field">
                        <i class="fas fa-lock"></i>
                        <asp:TextBox ID="SignupCon" runat="server" placeholder="Enter your confirm Password" MaxLength="8" required="required" />
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Diferent Password" Style="display: block; width: 200px;" ControlToCompare="SignupPass" ControlToValidate="SignupCon" ForeColor="Red"></asp:CompareValidator>
                    </div>
                    <asp:Button runat="server" ID="SignupBtn" class="btn" Text="Sign Up" OnClick="SignupBtn_Click" />
                </form>
            </div>
        </div>

        <div class="panels-container">
            <div class="panel left-panel">
                <div class="content">
                    <h3>New here ?</h3>
                    <p>
                        Lorem ipsum, dolor sit amet consectetur adipisicing elit. Debitis,
              ex ratione. Aliquid!
                    </p>
                    <button class="btn transparent" id="sign-up-btn">
                        Sign up
                    </button>
                </div>
                <img src="imglogin/log.svg" class="image" alt="" />
            </div>
            <div class="panel right-panel">
                <div class="content">
                    <h3>One of us ?</h3>
                    <p>
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Nostrum
              laboriosam ad deleniti.
                    </p>
                    <button class="btn transparent" id="sign-in-btn">
                        Sign in
                    </button>
                </div>
                <img src="imglogin/register.svg" class="image" alt="" />
            </div>
        </div>
    </div>
    <script src="app.js"></script>
    <script>
        const togglePassword = document.querySelector('#togglePassword');
        const password = document.querySelector('#password');
        togglePassword.addEventListener('click', function (e) {
            const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
            password.setAttribute('type', type);
            this.classList.toggle('fa-eye-slash');
        });
    </script>
    `
</body>
</html>

