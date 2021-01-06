<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="SAP.Users.Profile" %>


<!DOCTYPE html>

<meta name="viewport" content="width=device-width, initial-scale=1" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Profile Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="profile.css" rel="stylesheet" />
    <link href="star.css" rel="stylesheet" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script type="text/javascript">
        //jquery
        function ImagePreview1(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=Image1.ClientID%>').prop('src', e.target.result)
                        .width(150)
                        .height(150);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script>
        function change() {
            swal({
                title: "Congratulations",
                text: "Your Profile Picture is Successfully Changed",
                icon: "success"
            }).then(function () {
                window.location = "Profile.aspx";
            });
        }
    </script>
</head>
<body>
    <div id='stars'></div>
    <div id='stars2'></div>
    <div id='stars3'></div>
    <div id='title'>
    </div>

    <form id="form1" runat="server">
        <div>
            <aside class="profile-card" id="card" runat="server">
                <header>
                    <!-- here’s the avatar -->
                    <asp:LinkButton ID="LinkButton1" runat="server" Enabled="false">

                        <span class="image-upload">
                            <label for="FileUpload1">
                                <asp:Image ID="Image1" ImageUrl="~/Images/usericon.png" Style="border-radius: 100px;" runat="server" CssClass="hoverZoomLink" Width="150px" Height="150px" />
                            </label>
                            <asp:FileUpload ID="FileUpload1" onchange="ImagePreview1(this);" accept="image/*" runat="server" />
                        </span>

                    </asp:LinkButton>


                    <!-- the username -->
                    <h1>
                        <asp:Label ID="Label1" runat="server" Text="User Name"></asp:Label>
                    </h1>


                </header>

                <!-- bit of a bio; who are you? -->
                <div class="profile-bio">

                    <asp:LinkButton ID="TotalAd" runat="server" CssClass="links">Email</asp:LinkButton>
                    <div>
                        <asp:Label ID="Label2" runat="server" CssClass="ads" Text="Total Count" Enabled="false"></asp:Label>
                    </div>

                </div>

                <div class="profile-bio">

                    <asp:LinkButton ID="ActiveAd" runat="server" CssClass="links" Enabled="false">Phone Number</asp:LinkButton>
                    <div>
                        <asp:Label ID="Label3" runat="server" CssClass="ads" Text="Active Count"></asp:Label>
                    </div>
                </div>
                <div class="profile-bio">
                    <asp:LinkButton ID="LinkUpdate" runat="server" ToolTip="To change profile picture tap on Image and then click Update button" CssClass="links" OnClick="LinkUpdate_Click">Update</asp:LinkButton>
                </div>

                <!-- some social links to show off -->

            </aside>

        </div>
    </form>
</body>
</html>

