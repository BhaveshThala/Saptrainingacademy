<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="SAP.Details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Saptrainingacademy.com</title>
    <link rel = "icon" href ="img/logo.jpeg" type = "image/x-icon"/>
    <link href="details.css" rel="stylesheet" />
    <script id="ze-snippet" src="https://static.zdassets.com/ekr/snippet.js?key=fe92aab1-2d90-4ef0-aaca-78573bd64409"> </script>
    <link href="footer.css" rel="stylesheet" />
    <link href="home.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>

    <link href="enroll.css" rel="stylesheet" />

    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script>
        function greet() {
            swal({
                title: "Congratulations",
                text: "your response is recorded",
                icon: "success"
            });
        }
    </script>

</head>
<body onload="document.getElementById('id02').style.display='block'">
    <form runat="server">
        <header id="navbar">
            <div class="logo" onclick="window.location='Home.aspx'">
                <img src="img/demo.png" style="margin-top: -10px;height:auto;width:100%;" />
            </div>
            <nav>
                <ul>
                    <li>
                        <a href="About.aspx">About us</a></li>
                    <li>
                        <a href="Home.aspx">Home</a></li>
                </ul>
            </nav>
            <div class="menu-toggle">
                <i class="fa fa-bars" aria-hidden="true"></i>
            </div>
        </header>
        <div class="demo" style="margin-top: 100px;">

            <div class="container-fluid" style="background-color: #232636; padding: 20px;">
                <div class="row">
                    <div class="col-lg-8">
                        <asp:Label ID="LabelTitle" runat="server" class="nlabel" Text="Demo"></asp:Label>
                        <div class="col">
                            <img src="img/star.png" height="25" style="margin-top: 10px;" />
                            <h5 style="color: white; margin-top: 10px; font-size: 16px;">4.5 out of 3101 ratings</h5>
                        </div>
                        <br />
                        <div class="row" id="content">
                            <div class="col-sm-2" id="a">
                                <label class="clabel">Course Duration</label>
                                <br />
                                <label id="duration" runat="server" class="slabel">1-2 Months</label>
                            </div>
                            <div class="col-sm-2" id="b">
                                <label class="clabel">Live Projects</label>
                                <br />
                                <label class="slabel">2</label>
                            </div>
                            <div class="col-sm-2" id="c">
                                <label class="clabel">Certification</label>
                                <br />
                                <label class="slabel">Guranteed</label>
                            </div>
                            <div class="col-sm-2" id="d">
                                <label class="clabel">Training Format</label>
                                <br />
                                <label class="slabel">Online/Classroom</label>
                            </div>
                        </div>
                        <div class="row" style="margin-top: 20px;">
                            <div class="col-sm-4">
                                <label class="btn btn-success w-100" onclick="document.getElementById('id02').style.display='block'">View Course</label>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4" id="side">
                        <asp:Image ID="Image1" runat="server" ImageUrl="img/course.jpg" class="image" Width="300" Height="300" />
                    </div>
                </div>
            </div>
            <div class="container-fluid">
                <div class="row" style="margin-top: 15px;">
                    <div class="col-sm-8">
                        <div class="right-side-pro-detail border p-3 m-0">
                            <div class="col-lg-12 pt-2">
                                <div class="right-side-pro-detail border p-3 m-0">
                                    <h5 style="height: 50px; padding: 14px; background: #ddd;">Overview</h5>
                                </div>
                                <span>
                                    <asp:Label ID="LabelDescription" runat="server" Text="Label"></asp:Label></span><hr class="m-0 pt-2 mt-2" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 text-center pt-3">
                                <div class="right-side-pro-detail border p-3 m-0">
                                    <h5 style="height: 50px; padding: 14px; background: #ddd;">Description</h5>
                                </div>
                                <ul class="right-side-pro-detail border p-3 m-0">
                                    <li class="trainers">
                                        <asp:Label ID="Sub1" runat="server" Text="Label"></asp:Label>
                                    </li>
                                    <li class="trainers">
                                        <asp:Label ID="Sub2" runat="server" Text="Label"></asp:Label>
                                    </li>
                                    <li class="trainers">
                                        <asp:Label ID="Sub3" runat="server" Text="Label"></asp:Label>
                                    </li>
                                    <li class="trainers">
                                        <asp:Label ID="Sub4" runat="server" Text="Label"></asp:Label>
                                    </li>
                                    <li class="trainers">
                                        <asp:Label ID="Sub5" runat="server" Text="Label"></asp:Label>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-lg-12 text-center pt-3">
                                <div class="right-side-pro-detail border p-3 m-0">
                                    <h5 style="height: 50px; padding: 14px; background: #ddd;">Course Feature</h5>
                                </div>
                                <ul class="right-side-pro-detail border p-3 m-0">
                                    <li class="trainersf">Real-life Practice Studies
                                    </li>
                                    <li class="trainersf">Real-life Case Studies
                                    </li>
                                    <li class="trainersf">Assignments
                                    </li>
                                    <li class="trainersf">Lifetime Access
                                    </li>
                                    <li class="trainersf">Expert Support
                                    </li>
                                    <li class="trainersf">Global Certification
                                    </li>
                                    <li class="trainersf">Job Portal Access
                                    </li>
                                </ul>
                            </div>
                            <div class="col-lg-12 text-center pt-3">
                                <div class="right-side-pro-detail border p-3 m-0">
                                    <h5 style="height: 50px; padding: 14px; background: #ddd;">Trainers Profile</h5>
                                </div>
                                <ul class="right-side-pro-detail border p-3 m-0">
                                    <li class="trainers">Trainers are certified professionals with 10+ years of experience in the respective domain
                                    as well as they are currently working with Top MNCs.
                                    </li>
                                    <li class="trainers">As all Trainers are working professionals so they are having many live projects,
                                    trainers will use these projects during training sessions.
                                    </li>
                                    <li class="trainers">Trainers are also helping candidates to get placed in their respective companies by
                                    Employee Referral/Internal hiring process.
                                    </li>
                                </ul>
                            </div>
                            <div class="col-lg-12 text-center pt-3">
                                <div class="right-side-pro-detail border p-3 m-0">
                                    <h5 style="height: 50px; padding: 14px; background: #ddd;">Placements</h5>
                                </div>
                                <ul class="right-side-pro-detail border p-3 m-0">
                                    <li class="trainers">Our company associated with top orgarnizations like HCL,Wipro,Dell,
                                    Birlasoft,TechMahindra,TCS,IBM etc make us capable to place our students in top MNCs.
                                    </li>
                                    <li class="trainers">After completion of 70% training course content,we will arrange the mock interview sessions for students.
                                    
                                    </li>

                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="right-side-pro-detail border p-3 m-0">
                            <div class="form-group">
                                <label for="email"><b>Email</b></label>
                                <asp:TextBox ID="TextBoxName1" runat="server" class="form-control" required="required" placeholder="Enter your name" MaxLength="30"></asp:TextBox>
                                <label><b>DOB</b></label>
                                <asp:TextBox ID="TextBox2" runat="server" class="form-control" required="required" placeholder="Enter your DOB 0/0/0000" MaxLength="10"></asp:TextBox>

                                <label><b>Course</b></label>
                                <asp:TextBox ID="TextBox3" runat="server" class="form-control" required="required" placeholder="Enter your Course name" MaxLength="30"></asp:TextBox>

                                <label><b>Phone Number</b></label>
                                <asp:TextBox ID="TextBox4" runat="server" class="form-control" required="required" placeholder="Enter your Phone number" MaxLength="10"></asp:TextBox>

                                <asp:Button ID="Button1" runat="server" class="btn btn-success w-100" Text="Enroll" OnClick="Button1_Click" />
                            </div>
                        </div>
                        <div class="com-sm-4" style="display: flex; justify-content: center;">
                            <img src="img/course.jpg" width="350" height="350" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <br />
        <div>
        </div>
        <div id="id02" class="modal">

            <div class="modal-content animate" id="manage">
                <div class="imgcontainer">
                    <span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">×</span>
                </div>

                <div class="container">
                    <label><b>Name</b></label>
                    <asp:TextBox ID="TextBox5" Height="40" Style="margin: 0px;" runat="server" required="required" placeholder="Enter your name" MaxLength="30"></asp:TextBox>

                    <label><b>Email</b></label>
                    <asp:TextBox ID="TextBox6" Height="40" Style="margin: 0px;" runat="server" required="required" placeholder="Enter your email" MaxLength="30"></asp:TextBox>

                    <label><b>Phone Number</b></label>
                    <asp:TextBox ID="TextBox7" Height="40" Style="margin: 0px;" runat="server" required="required" placeholder="Enter your Phone number" MaxLength="10"></asp:TextBox>

                    <label><b>Course</b></label>
                    <asp:TextBox ID="CourseBox" Height="40" Style="margin: 0px;" runat="server" required="required" placeholder="Enter your Course" MaxLength="30"></asp:TextBox>


                    <label><b>Country</b></label>
                    <asp:TextBox ID="TextBox8" Height="40" Style="margin: 0px;" runat="server" required="required" placeholder="Enter your Country" MaxLength="30"></asp:TextBox>

                    <label><b>City</b></label>
                    <asp:TextBox ID="TextBox9" Height="40" Style="margin: 0px;" runat="server" required="required" placeholder="Enter your city" MaxLength="30"></asp:TextBox>

                    <asp:LinkButton ID="LinkButton2" runat="server" class="btn btn-primary w-100" OnClick="Button2_Click" style="margin-top:10px;">Enquiry</asp:LinkButton>
                </div>
            </div>
        </div>
    </form>

    <footer style="margin-top: 100px;">
        <!-- Footer main -->
        <section class="ft-main">
            <div class="ft-main-item">
                <h2 class="ft-title">About</h2>
                <ul>
                    <li><a href="#">Services</a></li>
                    <li><a href="#">Portfolio</a></li>
                    <li><a href="#">Pricing</a></li>
                    <li><a href="#">Customers</a></li>
                    <li><a href="#">Careers</a></li>
                </ul>
            </div>
            <div class="ft-main-item">
                <h2 class="ft-title">Resources</h2>
                <ul>
                    <li><a href="#">Docs</a></li>
                    <li><a href="#">Blog</a></li>
                    <li><a href="#">eBooks</a></li>
                    <li><a href="#">Webinars</a></li>
                </ul>
            </div>
            <div class="ft-main-item">
                <h2 class="ft-title">Contact</h2>
                <ul>
                    <li><a href="#">Help</a></li>
                    <li><a href="#">Sales</a></li>
                    <li><a href="#">Advertise</a></li>
                </ul>
            </div>
        </section>

        <!-- Footer social -->
        <section class="ft-social">
            <ul class="ft-social-list">
                <li><a href="#"><i class="fa fa-facebook-official" aria-hidden="true"></i></a></li>
                <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                <li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                <li><a href="#"><i class="fa fa-github" aria-hidden="true"></i></a></li>
                <li><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
                <li><a href="#"><i class="fa fa-youtube" aria-hidden="true"></i></a></li>
            </ul>
            <div style="display: flex; justify-content: center; text-align: center; flex-direction: column;">
                <b style="color: white;">An ISO 9001:2015 Certified Company</b>
                <b style="color: white;">CIN Number: U72900HR2020PTC090251</b>
            </div>
        </section>

        <section class="ft-social">
            <ul class="ft-social-list">
                <li>
                    <img src="img/master.jpg" height="50" width="100" /></li>
                <li>
                    <img src="img/visa.jpg" height="50" width="100" /></li>
                <li>
                    <img src="img/paytm.jpg" height="50" width="100" /></li>
            </ul>
            <div>
                <b style="color: white; display: flex; justify-content: center;">We Accept Online Payments</b>
            </div>
        </section>

        <!-- Footer legal -->
        <section class="ft-legal">
            <ul class="ft-legal-list">
                <li><a href="#">Terms &amp; Conditions</a></li>
                <li><a href="Privacy.html" target="_blank">Privacy Policy</a></li>
                <li>&copy; 2020 ESTIVAL Technologies PVT.LTD</li>
            </ul>
        </section>
    </footer>

</body>
<script type="text/javascript">
    (function () {
        var options = {
            whatsapp: "918802701000", // WhatsApp number
            call_to_action: "Message us", // Call to action
            position: "left", // Position may be 'right' or 'left'
        };
        var proto = document.location.protocol, host = "getbutton.io", url = proto + "//static." + host;
        var s = document.createElement('script'); s.type = 'text/javascript'; s.async = true; s.src = url + '/widget-send-button/js/init.js';
        s.onload = function () { WhWidgetSendButton.init(host, proto, options); };
        var x = document.getElementsByTagName('script')[0]; x.parentNode.insertBefore(s, x);
    })();
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $('.menu-toggle').click(function () {
            $('nav').toggleClass('active')
        })
    })
</script>
<script>
    window.onscroll = function () { myFunction() };

    var navbar = document.getElementById("navbar");
    var sticky = navbar.offsetTop;

    function myFunction() {
        navbar.style.marginTop = "0px";
        if (window.pageYOffset >= sticky) {
            navbar.classList.add("sticky")
        } else {
            navbar.style.marginTop = "100px";
            navbar.classList.remove("sticky");
        }
    }
</script>
<script> 
    var modal = document.getElementById('id01');
    window.onclick = function (event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    } 
</script>
<script> 
    var modal = document.getElementById('id02');
    window.onclick = function (event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    } 
</script>
</html>
