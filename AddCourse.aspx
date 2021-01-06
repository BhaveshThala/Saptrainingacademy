<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddCourse.aspx.cs" Inherits="SAP.Admin.AddCourse" EnableEventValidation="false" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PostAd</title>
    <link href="course.css" rel="stylesheet" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script>
        function ad() {
            swal({
                title: "Congratulations",
                text: "Your ad is successfully posted",
                icon: "success"
            }).then(function () {
                window.location = "AdminHome.aspx";
            });
        }
    </script>
    <script src="http://code.jquery.com/jquery-1.10.2.min.js" type="text/javascript"></script>

    <script>
        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=Image1.ClientID%>').prop('src', e.target.result)
                        .width(200)
                        .height(200);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>

</head>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<body>

    <form id="form1" runat="server">
        <section class="products">
            <div class="product-card">
                <header class="header">
                    <h1>Add Course
                    </h1>
                </header>

                <div class="demo" runat="server">
                    <asp:DropDownList ID="DropDownList1" ToolTip="Select Category" DataTextField="Type" placeholder="Select Category" runat="server" DataSourceID="SqlDataSource1" DataValueField="Type"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SapConnection %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
                </div>

                <div class="product-info">

                    <span>
                        <label class="productTitle">Course Name :</label>
                        <asp:TextBox ID="TextBox1" class="txtbox1" placeholder="Enter Course Name" MaxLength="10" TextMode="SingleLine" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter course namae." Display="Dynamic" ForeColor="#009900" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>

                    </span>
                    <div class="Description">
                        <span>
                            <label class="productTitle">Description:</label>
                            <asp:TextBox ID="TextBox2" class="dscrptnbox" placeholder="Fill course details.." TextMode="MultiLine" runat="server"></asp:TextBox>
                        </span>
                    </div>
                    <div class="price">
                        <span>
                            <label class="productPrice">Duration:</label>
                            <asp:TextBox ID="TextBox3" class="pricebox" placeholder="Enter course duration." TextMode="Phone" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter duration" ControlToValidate="Textbox3" ForeColor="#009900" Display="Dynamic"></asp:RequiredFieldValidator>


                        </span>
                    </div>
                    <div class="price">
                        <span>
                            <label class="productPrice">Cousre Id:</label>
                            <asp:TextBox ID="TextBox4" class="pricebox" placeholder="Enter course Id." TextMode="Phone" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter duration" ControlToValidate="Textbox3" ForeColor="#009900" Display="Dynamic"></asp:RequiredFieldValidator>
                        </span>
                    </div>

                    <div class="price">
                        <span>
                            <label class="productPrice">Sub Description 1:</label>
                            <asp:TextBox ID="Sub1" runat="server" class="pricebox" placeholder="Enter sub description"></asp:TextBox>
                        </span>
                    </div>

                    <div class="price">
                        <span>
                            <label class="productPrice">Sub Description 2:</label>
                            <asp:TextBox ID="Sub2" runat="server" class="pricebox" placeholder="Enter sub description"></asp:TextBox>
                        </span>
                    </div>

                    <div class="price">
                        <span>
                            <label class="productPrice">Sub Description 3:</label>
                            <asp:TextBox ID="Sub3" runat="server" class="pricebox" placeholder="Enter sub description"></asp:TextBox>
                        </span>
                    </div>

                    <div class="price">
                        <span>
                            <label class="productPrice">Sub Description 4:</label>
                            <asp:TextBox ID="Sub4" runat="server" class="pricebox" placeholder="Enter sub description"></asp:TextBox>
                        </span>
                    </div>

                    <div class="price">
                        <span>
                            <label class="productPrice">Sub Description 5:</label>
                            <asp:TextBox ID="Sub5" runat="server" class="pricebox" placeholder="Enter sub description"></asp:TextBox>
                        </span>
                    </div>


                    <div class="price">
                        <span>
                            <label class="productPrice">Upload Curricullum:</label>
                            <label for="FileUpload1" class="upload-file">Upload</label>
                            <asp:FileUpload ID="FileUpload1" Style="display: none;" runat="server" />
                        </span>
                    </div>
                    <div class="upload">
                        <span class="image-upload">
                            <label for="FileUpload2">
                                <asp:Image ID="Image1" CssClass="img" ImageUrl="~/Content/upload.png" runat="server" Height="200px" Width="200px" />
                            </label>
                            <asp:FileUpload ID="FileUpload2" onchange="ImagePreview(this);" Style="display: none;" accept="image/*" runat="server" />
                        </span>
                    </div>
                    <div class="btn1">
                        <asp:Button ID="Button2" CssClass="button2" runat="server" Text="ADD" OnClick="Button2_Click" />

                    </div>

                </div>

            </div>
        </section>
    </form>
</body>

</html>




