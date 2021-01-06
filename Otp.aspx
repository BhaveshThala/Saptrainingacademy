<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Otp.aspx.cs" Inherits="SAP.Otp.Otp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link href="otp.css" rel="stylesheet" />
</head>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
    function insertData() {
        swal({
            title: "Congratulations",
            text: "you are successfully registered with us please go to login",
            icon: "success"
        }).then(function () {
            window.location = "Login.aspx";
        });
    }
</script>
<body>

    <h1 runat="server" id="heading">An otp has been sent to your email address</h1>
<div class="wpcf7" id="wpcf7-f156-p143-o1 formwrap">
  <form id="form1" runat="server">
    <div style="display: none;">
      <input type="hidden" name="_wpcf7" value="156"/>
      <input type="hidden" name="_wpcf7_version" value="3.7.2"/>
      <input type="hidden" name="_wpcf7_locale" value="en_US"/>
      <input type="hidden" name="_wpcf7_unit_tag" value="wpcf7-f156-p143-o1"/>
      <input type="hidden" name="_wpnonce" value="d1da331d93"/>
    </div>
    <p>
      <span class="wpcf7-form-control-wrap Name">
          <asp:TextBox ID="TextBox1" runat="server" class="nameinput wpcf7-form-control wpcf7-text wpcf7-validates-as-required" required="required" placeholder="enter your otp"></asp:TextBox>
      </span>
        <asp:Button ID="Button1" runat="server" Text="Submit" class="wpcf7-form-control wpcf7-submit btn" OnClick="Button1_Click" />
      <img class="ajax-loader" src="http://www.jordancundiff.com/wp-content/plugins/contact-form-7/images/ajax-loader.gif" alt="Sending ..." style="visibility: hidden;" />
    </p>
    <div class="wpcf7-response-output wpcf7-display-none">
    </div>
  </form>
</div>

</body>
</html>

