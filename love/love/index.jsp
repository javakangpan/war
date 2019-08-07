<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="vo.*" %>
<%@ page import="dao.impl.*" %>
<%@ page import="java.io.*,java.util.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Premium Bootstrap 4 Landing Page Template" />
    <meta name="keywords" content="bootstrap 4, premium, marketing, multipurpose" />
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta content="Themesdesign" name="author" />
    <!-- favicon -->
    <!-- css -->
    <link href="http://cdn.bootstrapmb.com/bootstrap/4.2.1/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="css/animate.css" media="screen" />

    <!-- magnific pop-up -->
    <link rel="stylesheet" type="text/css" href="css/magnific-popup.css" />

    <!-- pe-icon-7 css-->
    <link href="css/pe-icon-7.css" rel="stylesheet">
    <link href="css/fontawesome.css" rel="stylesheet">

    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/colors/default.css" rel="stylesheet" id="color-opt">
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="css/bootstrapDatepickr-1.0.0.css">

	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="dist/bootstrapDatepickr-1.0.0.min.js"></script>

</head>

<body data-spy="scroll" data-offset="120">

	<%
	
	   //new日期对象
	   Date dates = new Date();
	   //转换提日期输出格式
	   SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	   String creationDate = dateFormat.format(dates);
	   dateFormat.applyPattern("yyyy-MM-dd");
       String date = dateFormat.format(dates);
	   ContactInfoDaoImpl impl = new ContactInfoDaoImpl();
		// 解决中文乱码的问题
		if(null != request.getParameter("name") && null != request.getParameter("comments")){
			
			String name = new String((request.getParameter("name")).getBytes("ISO-8859-1"),"UTF-8");
			String comments = new String((request.getParameter("comments")).getBytes("ISO-8859-1"),"UTF-8");
			ContactInfo contactInfo = new ContactInfo();
			if(null != name && !"".equals(name) && null != comments && !"".equals(comments)){
				contactInfo.setName(name);
				contactInfo.setComments(comments);
				contactInfo.setCreateBy(name);
				contactInfo.setCreationDate(creationDate);
			}
			request.removeAttribute("");
			impl.inser(contactInfo);
		}
		if(null != request.getParameter("date")){
			date = request.getParameter("date");
		}
		
		
		List<ContactInfo> list = impl.queryInfoByDate(date);
		
	%>

    <!-- start -->
    <section class="">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="row">
                        <div class="col-lg-3">
                            <div id="sidebar" class="fl_menu">
                                <!-- header -->
                                <header class="sidebar-section">
                                    <div class="header-logo">
                                        <!-- Logo -->
                                        <a class="logo" href="#">
                                            <span>执子之手<br />与子携老</span>
                                            <!-- Your logo here-->
                                        </a>
                                    </div>
                                    <a class="elemadded responsive-link" href="#"></a>
                                    <div class="navbar-vertical">
                                        <ul class="main-menu nav navbar-nav">
                                            <li class="nav-item active"><a href="#about"><i class="pe-7s-id"></i>我们的故事</a></li>
                                            <li class="nav-item"><a href="#portfolio"><i class="pe-7s-portfolio"></i>照片</a></li>
                                            <li class="nav-item"><a href="#contact"><i class="pe-7s-call"></i>聊天</a></li>
                                        </ul>
                                    </div>
                                </header>

                            </div>
                        </div>

                        <div class="col-lg-9">

                            <!-- START HOME -->
                            <section class="bg-home wow fadeInLeft animated" id="home">

                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="home-content text-center">
                                            
                                            <div class="tlt">
                                                <ul class="texts home-desc">
                                                    <li class="list-inline-item">康盼&李婷</li>
                                                    
                                                    <li class="list-inline-item">让我们红尘作伴，活的潇潇洒洒</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>

                            <!-- END HOME -->
                            <!-- START ABOUT -->
                            <section class="section about bg-white wow fadeInRight animated" id="about">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="title-heading">
                                            <p class="sub-title text-muted mb-0"></p>
                                           	<h3 class="title m-0 text-uppercase">我们的故事</h3>
                                           <div class="container">	
	<div class="row" style="display: block;left:400px;top:-30px;position: relative;">
		<div class="col-md-4">
		<form method="post" action="index.jsp">
			<div class="input-group">
				<span class="input-group-addon" id="basic-addon1"><i class="fa fa-calendar"></i></span>
				<input type="text" id="calendar" name="date" placeholder="" class="form-control">
			</div>
			<input type="submit" style ="position: relative;float: right;top:-34px;z-index:2;height:34px;padding-top:2px;bottom:-2px;"value="查询">
		</form>
		</div>
	</div>
</div>
    											
                                            <hr />
                                            <%for(ContactInfo data : list)  { %>
                                            	 <p><%=data.getCreationDate()  + " " + data.getName() %>：</p>
                                            	 <p><%=data.getComments()%></p>
                                            <% } %>
                                      		



                                        </div>
                                    </div>
                                </div>
                            </section>
                            <!-- END ABOUT -->
                            
                           
                           
                            <!-- START PORTFOLIAO -->

                            <section class="section bg-white" id="portfolio">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="title-heading">
                                            <p class="sub-title text-muted mb-0"></p>
                                            <h3 class="title m-0 text-uppercase">照片</h3>
                                            <hr />
                                        </div>
                                    </div>
                                </div>

  
                                <!-- portfolio menu end -->
                                <!-- Gallary -->

                                <div class="port portfolio-masonry m-b-30">
                                    <div class="portfolioContainer row">
                                        <div class="col-lg-4 col-md-4 designing ">
                                            <div class="item-box mt-4">
                                                <a class="mfp-image" href="img/work/img-1.jpg" title="">
                                                    <img class="item-container img-fluid mx-auto rounded" src="img/work/img-1.jpg" alt="" />
                                                    <div class="item-mask">
                                                        <div class="item-caption text-white text-center">
                                                            <i class="fas fa-search"></i>
                                                            <h3 class="text-uppercase mt-4 f-16">查看</h3>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>

                                        <div class="col-lg-4 col-md-4 designing">
                                            <div class="item-box mt-4">
                                                <a class="mfp-image" href="img/work/img-2.jpg" title="">
                                                    <img class="item-container img-fluid mx-auto rounded" src="img/work/img-2.jpg" alt="" />
                                                    <div class="item-mask">
                                                        <div class="item-caption text-white text-center">
                                                            <i class="fas fa-search"></i>
                                                            <h3 class="text-uppercase mt-4 f-16">查看</h3>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>

                                        <div class="col-lg-4 col-md-4 designing">
                                            <div class="item-box mt-4">
                                                <a class="mfp-image" href="img/work/img-3.jpg" title="">
                                                    <img class="item-container img-fluid mx-auto rounded" src="img/work/img-3.jpg" alt="" />
                                                    <div class="item-mask">
                                                        <div class="item-caption text-white text-center">
                                                            <i class="fas fa-search"></i>
                                                            <h3 class="text-uppercase mt-4 f-16">查看</h3>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>

                                        <div class="col-lg-4 col-md-4 mt-2 designing">
                                            <div class="item-box mt-4">
                                                <a class="mfp-image" href="img/work/img-4.jpg" title="">
                                                    <img class="item-container img-fluid mx-auto rounded" src="img/work/img-4.jpg" alt="" />
                                                    <div class="item-mask">
                                                        <div class="item-caption text-white text-center">
                                                            <i class="fas fa-search"></i>
                                                            <h3 class="text-uppercase mt-4 f-16">查看</h3>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>

                                        <div class="col-lg-4 col-md-4 mt-2 branding designing">
                                            <div class="item-box mt-4">
                                                <a class="mfp-image" href="img/work/img-5.jpg" title="">
                                                    <img class="item-container img-fluid mx-auto rounded" src="img/work/img-5.jpg" alt="" />
                                                    <div class="item-mask">
                                                        <div class="item-caption text-white text-center">
                                                            <i class="fas fa-search"></i>
                                                            <h3 class="text-uppercase mt-4 f-16">查看</h3>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>

                                        <div class="col-lg-4 col-md-4 mt-2 designing designing">
                                            <div class="item-box mt-4">
                                                <a class="mfp-image" href="img/work/img-6.jpg" title="">
                                                    <img class="item-container img-fluid mx-auto rounded" src="img/work/img-6.jpg" alt="" />
                                                    <div class="item-mask">
                                                        <div class="item-caption text-white text-center">
                                                            <i class="fas fa-search"></i>
                                                            <h3 class="text-uppercase mt-4 f-16">查看</h3>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </section>

                            <!-- END PORTFOLLIAO -->
                            <!-- START CONTACT -->
                            <section class="section bg-white wow fadeInLeft animated" id="contact">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="title-heading">
                                            <p class="sub-title text-muted mb-0"></p>
                                            <h3 class="title m-0 text-uppercase">聊天</h3>
                                            <hr />
                                        </div>
                                    </div>
                                </div>

                                <div class="row vertical-content">
                                    <div class="col-lg-6">
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="contact-box">
                                                    <div class="custom-form">
                                                       
                                                        <form method="post" action="index.jsp" id="contact-form">

                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <div class="form-group mt-3">
                                                                        <input name="name" id="name" type="text" class="form-control" placeholder="Name">
                                                                    </div>
                                                                </div>

                                                            </div>


                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <div class="form-group mt-3">
                                                                        <textarea name="comments" id="comments" rows="5" class="form-control" placeholder="Message"></textarea>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <div class="text-right mt-3">
                                                                        <input type="submit" id="submit"  class="submitBnt btn btn-sm btn-custom btn-round" value="发送消息">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>

                                    <div class="col-lg-6">
                                        <div class="contact-info text-center">
                                            <div class="contact-img">
                                                <img src="img/img1.jpg" class="img-fluid rounded-circle" alt="">
                                            </div>
                                            <p class="mt-4 f-15"></p>
                                            <p><a href="s"></a></p>

                                        </div>
                                    </div>
                                </div>

                            </section>
                            <!-- END CONTACT -->
                            <!-- START FOOTER -->
                            <section class="bg-footer-alt pt-3 pb-3">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="footer-alt text-center">
                                            <p class="mb-0 text-white-50 text-center"></p>
                                        </div>
                                    </div>
                                </div>
                            </section>
                            <!-- END FOOTER -->
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- end -->
    <!-- Scroll top -->
    <a href="#" class="back-to-top"> <i class="pe-7s-angle-up"></i></a>

    <!-- Style switcher -->
    <div id="style-switcher" style="left: 0px;">
        <div>
            <h3>选择主题颜色</h3>
            <ul class="pattern">
                <li>
                    <a class="color1" href="#"></a>
                </li>
                <li>
                    <a class="color2" href="#"></a>
                </li>
                <li>
                    <a class="color3" href="#"></a>
                </li>
                <li>
                    <a class="color4" href="#"></a>
                </li>
                <li>
                    <a class="color5" href="#"></a>
                </li>
                <li>
                    <a class="color6" href="#"></a>
                </li>
            </ul>
        </div>
        <div class="bottom">
            <a href="#" class="settings"><i class="fas fa-cog fa-spin"></i></a>
        </div>
    </div>
    <!-- end Style switcher -->
    <!-- javascript -->
    
    
    <script>
	$(document).ready(function() {
		$("#calendar").bootstrapDatepickr({date_format: "Y-m-d"});
	});
</script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/jquery.easing.min.js"></script>
    <script src="js/scrollspy.min.js"></script>
    <script src="js/floating-menu.js"></script>
    <!-- Magnific Popup -->
    <script src="js/jquery.magnific-popup.min.js"></script>
    <!-- filter -->
    <script src="js/isotope.js"></script>
    <script src="js/masonry.pkgd.min.js"></script>
    <script src="js/jquery.textillate.js"></script>
    <script src="js/jquery.lettering.js"></script>
    <script src="js/portfolio-filtr.js"></script>
    <script src="js/contact-form.js"></script>
    <!-- switcher js -->
    <script src="js/switcher.js"></script>
    <!-- Main Js -->
    <script src="js/app.js"></script>

     

</body>

</html>
