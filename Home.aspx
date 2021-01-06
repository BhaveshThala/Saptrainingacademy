<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="SAP.Home.Home" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Saptrainingacademy.com</title>
    <link rel="icon" href="img/logo.jpeg" type="image/x-icon" />
    <!-- Start of  Zendesk Widget script -->
    <script id="ze-snippet" src="https://static.zdassets.com/ekr/snippet.js?key=fe92aab1-2d90-4ef0-aaca-78573bd64409"> </script>
    <!-- End of  Zendesk Widget script -->
    <link rel="stylesheet" type="text/css" href="home.css" />
    <link rel="stylesheet" type="text/css" href="list.css" />
    <link href="enroll.css" rel="stylesheet" />
    <link href="footer.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
    function noData() {
        swal({
            title: "Oops",
            text: "No Course Found",
            icon: "info"
        });
    }
</script>
<script>
    function greet() {
        swal({
            title: "Congratulations",
            text: "your response is recorded",
            icon: "success"
        });
    }
</script>
<body onload="document.getElementById('id01').style.display='block'" style="overflow-x: hidden;">
    <form runat="server">
        <header id="navbar">
            <div class="logo" onclick="window.location='Home.aspx'">
                <img src="img/demo.png" style="margin-top: -10px; height: auto; width: 100%;" />
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
        <div class="demo">
            <div style="position: relative; text-align: center; color: white; margin-top: 20px; width: 100%;">
                <img src="img/cover.jpg" alt="Snow" style="width: 100%; height: auto;" />
                <div class="centered">
                    <h4 class="heading" style="color: #ffffff;">What do you want to learn today?</h4>
                    <br />
                    <div class="combine">
                        <asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="Search.." TextMode="Search"></asp:TextBox>
                        <span class="icon">
                            <button type="button" class="btn btn-secondary" runat="server" onserverclick="Unnamed_ServerClick"><i class="fa fa-search" style="height: 36px; padding: 8px 7px 0px;"></i></button>
                        </span>
                    </div>
                </div>
            </div>
            <div class="alert alert-warning alert-dismissible" style="margin-top: 10px;">
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                <strong>Alert!</strong> For any query contact <strong>+91 880270100 / +91 8298636653</strong>.
            </div>
            <div class="category" id="tcategory" runat="server">
                <div class="categorylist">
                    <div class="categorytext">
                        <h4 id="ctext" class="btn btn-info cattext" runat="server">Trending Modules</h4>
                    </div>
                    <asp:ListView runat="server" ID="TrendingListView" ItemPlaceholderID="ItemPlaceholder1" OnItemCommand="TrendingListView_ItemCommand">
                        <LayoutTemplate>
                            <div runat="server" id="ItemPlaceholder1"></div>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="TrendingButton" runat="server">
                                <div style="float: left; color: black;">
                                    <div class="blog-card">
                                        <div class="meta">
                                            <asp:Image ID="Image1" class="photo" runat="server" ImageUrl='<%#Eval("Image") %>' />
                                            <ul class="details">
                                            </ul>
                                        </div>
                                        <div class="description">
                                            <h1 style="text-transform: uppercase">
                                                <asp:Label ID="Label1" runat="server" Text='<%#Eval("Name") %>'></asp:Label></h1>
                                            <asp:Label ID="LabelId" runat="server" Text='<%#Eval("Id") %>' Visible="false"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:ListView>
                    <div class="categorybtn">
                        <asp:LinkButton ID="LinkTrendingMore" runat="server" CssClass="btn btn-warning morebtn" OnClick="LinkTrendingMore_Click"><b>Show More</b></asp:LinkButton>
                        <asp:LinkButton ID="LinkTrendingLess" runat="server" CssClass="btn btn-warning morebtn" OnClick="LinkTrendingLess_Click" Visible="false"><b>Show less</b></asp:LinkButton>
                    </div>
                </div>
            </div>

            <div class="category" id="fcategory" runat="server">

                <div class="categorylist">
                    <div class="categorytext">
                        <h4 class="btn btn-info cattext">Functional Modules</h4>
                    </div>
                    <asp:ListView runat="server" ID="FunctionalListView" ItemPlaceholderID="ItemPlaceholder1" OnItemCommand="FunctionalListView_ItemCommand">
                        <LayoutTemplate>
                            <div runat="server" id="ItemPlaceholder1"></div>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="TrendingButton" runat="server">
                                <div style="float: left; color: black;">
                                    <div class="blog-card">
                                        <div class="meta">
                                            <asp:Image ID="Image1" class="photo" runat="server" ImageUrl='<%#Eval("Image") %>' />
                                            <ul class="details">
                                            </ul>
                                        </div>
                                        <div class="description">
                                            <h1 style="text-transform: uppercase">
                                                <asp:Label ID="Label1" runat="server" Text='<%#Eval("Name") %>'></asp:Label></h1>
                                            <asp:Label ID="LabelId" runat="server" Text='<%#Eval("Id") %>' Visible="false"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:ListView>
                    <div class="categorybtn">
                        <asp:LinkButton ID="FunctionalMoreButton" runat="server" OnClick="FunctionalMoreButton_Click" CssClass="btn btn-warning morebtn"><b>Show More</b></asp:LinkButton>
                        <asp:LinkButton ID="FunctionalLessButton" runat="server" Visible="false" OnClick="FunctionalLessButton_Click" CssClass="btn btn-warning morebtn"><b>Show less</b></asp:LinkButton>
                    </div>
                </div>
            </div>

            <div class="category" id="lcategory" runat="server">

                <div class="categorylist">
                    <div class="categorytext">
                        <h4 class="btn btn-info cattext">Technical Modules</h4>
                    </div>
                    <asp:ListView runat="server" ID="LogicalListView" ItemPlaceholderID="ItemPlaceholder1" OnItemCommand="LogicalListView_ItemCommand">
                        <LayoutTemplate>
                            <div runat="server" id="ItemPlaceholder1"></div>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="TrendingButton" runat="server">
                                <div style="float: left; color: black;">
                                    <div class="blog-card">
                                        <div class="meta">
                                            <asp:Image ID="Image1" class="photo" runat="server" ImageUrl='<%#Eval("Image") %>' />
                                            <ul class="details">
                                            </ul>
                                        </div>
                                        <div class="description">
                                            <h1 style="text-transform: uppercase">
                                                <asp:Label ID="Label1" runat="server" Text='<%#Eval("Name") %>'></asp:Label></h1>
                                            <asp:Label ID="LabelId" runat="server" Text='<%#Eval("Id") %>' Visible="false"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:ListView>
                    <div class="categorybtn">
                        <asp:LinkButton ID="LogicalMoreButton" runat="server" OnClick="LogicalMoreButton_Click" CssClass="btn btn-warning morebtn"><b>Show More</b></asp:LinkButton>
                        <asp:LinkButton ID="LogicalLessButton" runat="server" Visible="false" OnClick="LogicalLessButton_Click" CssClass="btn btn-warning morebtn"><b>Show less</b></asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <!-- Projects-->
        <section class="projects-section bg-light" id="projects">
            <div class="container">
                <!-- Project One Row-->
                <div class="row justify-content-center no-gutters mb-5 mb-lg-0">
                    <div class="col-lg-6">
                        <img class="img-fluid" style="width: 100%; height: auto;" src="img/sap image two.png" alt="" />
                    </div>
                    <div class="col-lg-6">
                        <label class="para">
                            SAP is one of the biggest business software companies in the world, 
                        IT is definitely a good option for a long lasting and fulfilling career.
                        Chose  from various modules according to your industry.
                        </label>
                    </div>
                </div>

                <!-- Project Two Row-->
                <div class="row justify-content-center no-gutters">
                    <div class="col-lg-6">
                        <img class="img-fluid" src="img/sap image one.png" style="width: 100%; height: auto;" alt="" />

                    </div>
                    <div class="col-lg-6 order-lg-first">
                        <label class="para">
                            If you find a job as a SAP expert you could work in a number of roles 
                        where you advise on and install only SAP software. You could become an SAP consultant, 
                        project manager, analyst, technician or trainer – basically most of the same roles as in the wider IT environment but only focusing on this one technology.
                        </label>
                    </div>

                </div>
            </div>
        </section>
        <div class="row" style="margin-top: 20px;">
            <div class="col-sm-3">
                <div class="right-side-pro-detail border p-3 m-0" style="border-radius: 10px; box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);">
                    <img class="img-fluid" src="img/global certificate.png" alt="" />
                    <div>
                        <p class="rtext">
                            <b>Global Certificate</b><br />
                            The student will be provided the certificates which are signed by instructors and have our logo on it which will help them secure their career and increase job prospects with certificates signed by us
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="right-side-pro-detail border p-3 m-0" style="border-radius: 10px; box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);">
                    <img class="img-fluid" src="img/assignment.png" alt="" />
                    <div>
                        <p class="rtext">
                            <b>Home and Assignments</b><br />
                            With regular homework and assignments, students enhance their comprehension of the given subject. ... 
                            When students are assign work for home, they are encouraged to make an extra effort for additional information.
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="right-side-pro-detail border p-3 m-0" style="border-radius: 10px; box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);">
                    <img class="img-fluid" src="img/life time acess.png" alt="" />
                    <div>
                        <p class="rtext">
                            <b>Memeberships</b><br />
                            Membership in an industry association leads directly to advanced education and training programs, which help you maintain your edge and keep your skills sharp and current according to the market
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <div class="row" style="margin-top: 20px;">

            <div class="col-sm-3">
                <div class="right-side-pro-detail border p-3 m-0" style="border-radius: 10px; box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);">
                    <img class="img-fluid" src="img/epert support.png" alt="" />
                    <div>
                        <p class="rtext">
                            <b>Faculty</b><br />
                            Our faculty is from the best institutes around the world such as IITD, Stanford and more. They also have work experience in tech giants like Amazon, Facebook, Adobe which makes them exceptional.
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="right-side-pro-detail border p-3 m-0" style="border-radius: 10px; box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);">
                    <img class="img-fluid" src="img/real life studies2.png" alt="" />
                    <div>
                        <p class="rtext">
                            <b>Live Projects</b><br />
                            Live project based training and corporate study material .Also trained candidates on  Aptitudes and test papers. Schedule mock exams for students so that 
                            they can enhance their ability to crack the interview easily.
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="right-side-pro-detail border p-3 m-0" style="border-radius: 10px; box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);">
                    <img class="img-fluid" src="img/real life studies.png" alt="" />
                    <div>
                        <p class="rtext">
                            <b>Real Life Studies</b><br />
                            Real-life studies are observational studies 
                            that are essential to document benefits and harms
                             of therapy in a wider population and to determine 
                            whether patients are achieving 
                            expected outcomes or not.
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <div style="margin-top:40px;margin-bottom:30px;">
            <img src="img/company.jpeg" style="width:100%;height:auto;" />
        </div>
        <section class="contact-section bg-black">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 mb-3 mb-md-0">
                        <div class="card py-4 h-100" style="border-radius: 10px; box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24); background: #232626;">
                            <div class="card-body text-center">
                                <%--<i class="fas fa-map-marked-alt text-primary mb-2"></i>--%>
                                <h4 class="text-uppercase m-0" style="color: white;">Address</h4>
                                <hr class="my-4" />
                                <div class="small" style="color: white;">5R/5 Sub Division 4 Neelam Chowk,Pin-121001 Faridabad(Delhi NCR) India</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3 mb-md-0">
                        <div class="card py-4 h-100" style="border-radius: 10px; box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24); background: #232626;">
                            <div class="card-body text-center">
                                <h4 class="text-uppercase m-0" style="color: white;">Email</h4>
                                <hr class="my-4" />
                                <div class="small" style="color: white;">
                                    <p>
                                        info@saptrainingacademy.com<br />
                                        Info@estivaltech.com
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3 mb-md-0">
                        <div class="card py-4 h-100" style="border-radius: 10px; box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24); background: #232626;">
                            <div class="card-body text-center">
                                <i class="fas fa-mobile-alt text-primary mb-2"></i>
                                <h4 class="text-uppercase m-0" style="color: white;">Phone</h4>
                                <hr class="my-4" />
                                <div class="small" style="color: white;">+91 880270100 / +91 8298636653</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <br />
        <footer>
            <!-- Footer main -->
            <section class="ft-main">
                <div class="ft-main-item">
                    <h2 class="ft-title">About</h2>
                    <ul>
                        <li><a href="#">Services</a></li>
                        <li><a href="#">Portfolio</a></li>
                        <li><a href="#">Pricing</a></li>
                        <li><a href="#">Customers</a></li>
                        <li><a href="adminlogin.aspx" target="_blank">Admin</a></li>
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
        <div id="id01" class="modal">

            <div class="modal-content animate" id="manage">
                <div class="imgcontainer">
                    <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">×</span>
                </div>

                <div class="container">
                    <label><b>Name</b></label>
                    <asp:TextBox ID="TextBox2" Height="40" Style="margin: 0px;" runat="server" required="required" placeholder="Enter your name" MaxLength="30"></asp:TextBox>

                    <label><b>Email</b></label>
                    <asp:TextBox ID="TextBox3" Height="40" Style="margin: 0px;" runat="server" required="required" placeholder="Enter your email" MaxLength="30"></asp:TextBox>

                    <label><b>Phone Number</b></label>
                    <asp:TextBox ID="TextBox4" Height="40" Style="margin: 0px;" runat="server" required="required" placeholder="Enter your Phone number" MaxLength="10"></asp:TextBox>

                    <label><b>Course</b></label>
                    <asp:TextBox ID="CourseBox" Height="40" Style="margin: 0px;" runat="server" required="required" placeholder="Enter your Course" MaxLength="30"></asp:TextBox>

                    <label><b>Country</b></label>
                    <asp:TextBox ID="TextBox5" Height="40" Style="margin: 0px;" runat="server" required="required" placeholder="Enter your Country" MaxLength="30"></asp:TextBox>

                    <label><b>City</b></label>
                    <asp:TextBox ID="TextBox6" Height="40" Style="margin: 0px;" runat="server" required="required" placeholder="Enter your city" MaxLength="30"></asp:TextBox>

                    <asp:Button ID="Button1" Height="40" runat="server" class="btn btn-primary w-100" Text="Enquiry" OnClick="Button1_Click" />
                </div>
            </div>
        </div>
    </form>
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
    /**********************/
    /*	Client carousel   */
    /**********************/
    $('.carousel-client').bxSlider({
        auto: true,
        slideWidth: 234,
        minSlides: 2,
        maxSlides: 5,
        controls: false
    });
</script>
</html>
