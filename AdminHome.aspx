<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="SAP.Admin.AdminHome" EnableEventValidation="false" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Home</title>
    <link rel="stylesheet" type="text/css" href="adminhome.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,400i,700">
    <link rel="stylesheet" type="text/css" href="users.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script>
        function flush() {
            swal({
                title: "Congratulations",
                text: "Course deleted successfully",
                icon: "success"
            }).then(function () {
                window.location = "AdminHome.aspx";
            });
        }
    </script>
</head>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<body>
    <form runat="server">
        <div id="viewport">
            <!-- Sidebar -->
            <div id="sidebar">
                <header>
                    <a href="#">Admin</a>
                </header>
                <ul class="nav">
                    <li>
                        <asp:LinkButton ID="LinkButtonUser" runat="server" OnClick="LinkButtonUser_Click">
                            <i class="zmdi zmdi-view-dashboard"></i>Users
                        </asp:LinkButton>
                    </li>
                    <li>
                        <asp:LinkButton ID="LinkButtonCourse" runat="server" OnClick="LinkButtonCourse_Click">
                            <i class="zmdi zmdi-link"></i>All Course
                        </asp:LinkButton>
                    </li>
                    <li>
                        <asp:LinkButton ID="LinkButtonAdd" runat="server" OnClick="LinkButtonAdd_Click">
                            <i class="zmdi zmdi-widgets"></i>Add Course
                        </asp:LinkButton>
                    </li>
                    <li>
                        <asp:LinkButton ID="LinkButtonDelete" runat="server" OnClick="LinkButtonDelete_Click">
                            <i class="zmdi zmdi-calendar"></i>Delete Course
                        </asp:LinkButton>
                    </li>
                    <li>
                        <asp:LinkButton ID="LinkButtonUpdate" runat="server" OnClick="LinkButtonUpdate_Click">
                            <i class="zmdi zmdi-info-outline"></i>Update Course
                        </asp:LinkButton>
                    </li>
                    <li>
                        <asp:LinkButton ID="LinkButtonEnquiry" runat="server" OnClick="LinkButtonEnquiry_Click">
                            <i class="zmdi zmdi-info-outline"></i>Enquiry
                        </asp:LinkButton>
                    </li>
                </ul>
            </div>
            <!-- Content -->
            <div id="content">
                <nav class="navbar navbar-default">
                    <div class="container-fluid">
                        <ul class="nav navbar-nav navbar-right">
                            <li>
                                <a href="#"><i class="zmdi zmdi-notifications text-danger"></i>
                                </a>
                            </li>
                            <li>
                                <asp:LinkButton ID="LinkButton8" runat="server" OnClick="LinkButton8_Click">Logout</asp:LinkButton></li>
                        </ul>
                    </div>
                </nav>
                <asp:ListView ID="UserListView" runat="server" ItemPlaceholderID="ItemPlaceHolder1">
                    <ItemTemplate>
                        <div class="wrapper-flex">
                            <div class="container">
                                <div class='banner-img'></div>
                                <asp:Image ID="Image1" runat="server" class="profile-img" ImageUrl='<%#Eval("Image") %>' />
                                <br />
                                <asp:Label ID="Name" runat="server" class="name" Text='<%#Eval("Name") %>'></asp:Label>
                                <br />
                                <asp:Label ID="StudentId" class="description" runat="server" Text='<%#Eval("StudentId") %>'></asp:Label>
                                <br />
                                <asp:Label ID="Phone" class="name" runat="server" Text='<%#Eval("Phone") %>'></asp:Label>
                                <br />
                                <asp:Label ID="Date" class="name" runat="server" Text='<%#Eval("Dob") %>'></asp:Label>
                                <br />
                                <asp:Label ID="Course" class="name" runat="server" Text='<%#Eval("Course") %>'></asp:Label>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
                <asp:ListView ID="DeleteCourseListView" runat="server" ItemPlaceholderID="ItemPlaceHolder1" OnItemCommand="DeleteCourseListView_ItemCommand">
                    <ItemTemplate>
                        <div class="wrapper-flex">
                            <div class="container">
                                <div class='banner-img'></div>
                                <asp:Image ID="Image1" runat="server" class="profile-img" ImageUrl='<%#Eval("Image") %>' />
                                <br />
                                <asp:Label ID="CId" runat="server" class="name" Text='<%#Eval("Id") %>' Visible="false"></asp:Label>
                                <asp:Label ID="CName" class="description" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                                <h6>Duration</h6>
                                <asp:Label ID="Duration" runat="server" class="name" Text='<%#Eval("Duration") %>'></asp:Label>
                                <asp:LinkButton runat="server" ID="DeleteCourse" class='btn' Text="Delete"></asp:LinkButton>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
                <asp:ListView ID="CourseListView" runat="server" ItemPlaceholderID="ItemPlaceHolder1">
                    <ItemTemplate>
                        <div class="wrapper-flex">
                            <div class="container">
                                <div class='banner-img'></div>
                                <asp:Image ID="Image1" runat="server" class="profile-img" ImageUrl='<%#Eval("Image") %>' />
                                <br />
                                <asp:Label ID="CId" runat="server" class="name" Text='<%#Eval("Id") %>' Visible="false"></asp:Label>
                                <asp:Label ID="CName" class="description" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                                <h6>Duration</h6>
                                <asp:Label ID="Duration" runat="server" class="name" Text='<%#Eval("Duration") %>'></asp:Label>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
                <asp:ListView ID="UpdateListView" runat="server" ItemPlaceholderID="ItemPlaceHolder1" OnItemCommand="UpdateListView_ItemCommand">
                    <ItemTemplate>
                        <div class="wrapper-flex">
                            <div class="container">
                                <div class='banner-img'></div>
                                <asp:Image ID="Image1" runat="server" class="profile-img" ImageUrl='<%#Eval("Image") %>' />
                                <br />
                                <asp:Label ID="CId" runat="server" class="name" Text='<%#Eval("Id") %>' Visible="false"></asp:Label>
                                <asp:Label ID="CName" class="description" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                                <h6>Duration</h6>
                                <asp:Label ID="Duration" runat="server" class="name" Text='<%#Eval("Duration") %>'></asp:Label>
                                <asp:LinkButton runat="server" ID="DeleteCourse" class='btn' Text="Update"></asp:LinkButton>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
                <asp:ListView ID="ListViewEnquiry" runat="server" ItemPlaceholderID="ItemPlaceHolder1">
                    <ItemTemplate>
                        <div class="wrapper-flex">
                            <div class="container">
                                <div class='banner-img' style="position:relative;"></div>
                                <br />
                                <asp:Label ID="Name" runat="server" class="name" Text='<%#Eval("Name") %>'></asp:Label>
                                <br />
                                <asp:Label ID="Phone" class="name" runat="server" Text='<%#Eval("Phone") %>'></asp:Label>
                                <br />
                                <asp:Label ID="Country" class="name" runat="server" Text='<%#Eval("Country") %>'></asp:Label>
                                <br />
                                <asp:Label ID="City" class="name" runat="server" Text='<%#Eval("City") %>'></asp:Label>
                                <br />
                                <asp:Label ID="Label1" class="name" runat="server" Text='<%#Eval("Course") %>'></asp:Label>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
            </div>
        </div>
    </form>
</body>
</html>
