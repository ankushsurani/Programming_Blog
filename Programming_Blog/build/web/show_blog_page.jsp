<%@page import="com.programming.blog.entities.Answer"%>
<%@page import="com.programming.blog.dao.AnswerDao"%>
<%@page import="com.programming.blog.dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.programming.blog.helper.Message"%>
<%@page import="com.programming.blog.entities.Category"%>
<%@page import="com.programming.blog.entities.Category"%>
<%@page import="com.programming.blog.entities.Post"%>
<%@page import="com.programming.blog.dao.PostDao"%>
<%@page import="com.programming.blog.helper.ConnectionProvider"%>
<%@page import="com.programming.blog.entities.User"%>

<%@page  errorPage="Error.jsp" %>

<%

    User user = (User) session.getAttribute("currentUser");

    if (user == null) {
        response.sendRedirect("Login.jsp");
    }

%>

<%    int postId = Integer.parseInt(request.getParameter("post_id"));

    PostDao pdao = new PostDao(ConnectionProvider.getConnection());

    Post post = pdao.getPostByPostId(postId);
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= post.getpTitle()%> Programming Blog</title>

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

        <!--mycss-->
        <link href="CSS/Mycss.css" rel="stylesheet" type="text/css"/>

        <style>

            .post-title{
                font-weight: 100;
                font-size: 30px;
            }

            .post-content{
                font-weight: 100;
                font-size: 25px;
            }

            .post-date{
                font-style: italic;
                font-weight: bold;
            }

            .post-user-info{
                font-size: 20px;
            }

            body{
                background: url(images/backimg2.avif);
                background-size: cover;
                background-attachment: fixed;
            }


        </style>


    </head>
    <body>


        <!--navbar start-->

        <nav class="navbar navbar-expand-lg navbar-dark back-color">
            <div class="container-fluid">
                <a class="navbar-brand" href="/Programming_Blog"><i class="fa-solid fa-blog"></i> Programming Blog</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="/Programming_Blog"><i class="fa-solid fa-house-chimney-user"></i> Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="Profile.jsp"><i class="fa-brands fa-artstation"></i> Categories</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#"><i class="fa-solid fa-address-book"></i> Contact</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#post-details"><i class="fa-solid fa-circle-plus fa-beat"></i> Post</a>
                        </li>

                    </ul>


                    <ul class="navbar-nav me-right mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" href="#!" data-bs-toggle="modal" data-bs-target="#user-info"><i class="fa-solid fa-user"></i> <%= user.getName()%></a>
                        </li>
                    </ul>


                    <a href="LogoutServlet" class="btn btn-outline-light ms-2"><i class="fa-solid fa-user-minus"></i> Logout</a>

                </div>
            </div>
        </nav>



        <!--navbar end-->






        <!--message-->

        <%  Message msg = (Message) session.getAttribute("msg");

            if (msg != null) {
        %>

        <div class="alert <%= msg.getCssClass()%>" role="alert">
            <%= msg.getContent()%>
        </div>

        <%
                session.removeAttribute("msg");
            }

        %>


        <!--main content of body-->

        <% AnswerDao ans = new AnswerDao(ConnectionProvider.getConnection());

            int post_id = Integer.parseInt(request.getParameter("post_id"));

            ArrayList<Answer> answer = ans.fetchAnswerByPostId(post_id);


        %>



        <div class="container my-5">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header text-center back-color text-light">
                            <h3 class="post-title"><%= post.getpTitle()%></h3>
                        </div>

                        <div class="card-body">
                            <img src="blog_pics/<%= post.getpPic()%>" class="card-img-top p-2" alt="...">

                            <div class="row my-3 p-2 border border-primary rounded bg-dark text-light">

                                <div class="col-md-8">
                                    <% PostDao ps = new PostDao(ConnectionProvider.getConnection());
                                        int userid = post.getUserId();
                                    %>
                                    <p class="post-user-info p-0"><a href="#!" class="text-decoration-none"><%= ps.getUserByPostUserId(userid).getName()%></a> has posted</p>
                                </div>
                                <div class="col-md-4">
                                    <p class="post-date p-0"><%= DateFormat.getDateTimeInstance().format(post.getpDate())%></p>
                                </div>

                            </div>

                            <h6 class="post-content"><%= post.getpContent()%></h6>
                            <br>
                            <br>
                            <div class="post-code">
                                <pre><%= post.getpCode()%></pre>
                            </div>

                        </div>
                        <div class="card-footer back-color">
                            <%  LikeDao ldao = new LikeDao(ConnectionProvider.getConnection());%>

                            <a href="#!" class="btn btn-outline-light" onclick="doLike(<%= post.getpId()%>, <%= user.getId()%>)"><i class="fa fa-thumbs-o-up"><span class="like-counter"><%= ldao.countLikeOnPost(post.getpId())%></span></i></a>

                            <a href="#!" class="btn btn-outline-light"><i class="fa fa-commenting-o"><span> <%= answer.size()%></span></i></a>
                        </div>
                    </div>
                </div>



                <!--end main content of body-->




                <!--post answer of post start-->


                <div class="container my-5 border border-light border-3">
                    <div class="container py-5">
                        <form action="AnswerServlet" id="ans_form" method="POST" enctype="multipart/form-data">

                            <h2 class="my-2 text-dark display-3"><i class="fa-regular fa-square-plus fa-shake"></i> Post Your Solution : </h2>
                            <div class="mb-3">
                                <textarea class="form-control" name="answer_content" placeholder="Type Your Answer Content" rows="3" required></textarea>
                            </div>
                            <div class="mb-3">
                                <textarea class="form-control" name="answer_code" placeholder="Type Your Programming Solution (If Any)" rows="3"></textarea>
                            </div>
                            <div class="mb-3">
                                <input type="file" name="answer_img" class="form-control">
                            </div>
                            <input type="hidden" name="post_id" value="<%= request.getParameter("post_id")%>">
                            <button type="submit" class="btn btn-outline-dark">Submit</button>
                        </form>
                    </div>
                </div>



                <!--post answer of post end-->



                <!--show answers start-->


                <div class="container my-5 answer">


                    <h2 class="text-center my-5 text-dark border border-light rounded-pill border-3 display-3 fa-fade"><%= answer.size()%> Answer</h2>
                    <%

                        for (Answer a : answer) {

                    %>

                    <div class="card mb-5">
                        <div class="card-body">
                            <h5 class="card-title pb-5"><%= a.getAnswer_content()%></h5>
                            <pre><%= a.getAnswer_code()%></pre>
                        </div>
                        <img src="Answer_img/<%= a.getAnswer_img()%>" class="card-img-top" alt="...">
                        <div class="row">

                            <div class="card-footer col-md-10">
                                Posted By : <%=  ans.getUserByAnsUserId(a.getUser_id()).getName()%>
                            </div>
                            <div class="card-footer col-md-2">
                                <%= a.getAnswer_time().toLocaleString()%>
                            </div>
                        </div>
                    </div>

                    <hr class="bg-dark border border-dark border-5">


                    <%

                        }

                    %>




                </div>




                <!--show answers end-->






                <!--user info modal start-->

                <!-- Button trigger modal -->

                <!-- Modal -->
                <div class="modal fade" id="user-info" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Programming Blog</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>

                            <div class="modal-body text-center">
                                <img src="pic/<%= user.getProfilepic()%>" height="30%" width="30%" alt="" style="border-radius: 50%"/>
                                <h4 class="my-2"><%= user.getName()%></h4>


                                <!--user info table-->

                                <div id="profile-details">

                                    <table class="table">

                                        <tbody>
                                            <tr>
                                                <th scope="row">Id : </th>
                                                <td><%= user.getId()%></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Email : </th>
                                                <td><%= user.getEmail()%></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Gender : </th>
                                                <td><%= user.getGender()%></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Status : </th>
                                                <td><%= user.getAbout()%></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Registered on : </th>
                                                <td><%= user.getDatetime()%></td>
                                            </tr>

                                        </tbody>
                                    </table>
                                </div>


                                <!--user edit table-->

                                <div id="profile-edit" style="display: none">
                                    <hr>
                                    <h2>Edit Profile</h2>

                                    <form action="EditServlet" method="POST" enctype="multipart/form-data">
                                        <table class="table">
                                            <tbody>
                                                <tr>
                                                    <th scope="row">Id : </th>
                                                    <td><%= user.getId()%></td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Name : </th>
                                                    <td><input type="text" name="user_name" class="form-control" value="<%= user.getName()%>"></td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Email : </th>
                                                    <td><input type="email" name="user_email" class="form-control" value="<%= user.getEmail()%>"></td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">password : </th>
                                                    <td><input type="password" name="user_password" class="form-control" value="<%= user.getPassword()%>"></td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Gender : </th>
                                                    <td><%= user.getGender()%></td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Status : </th>
                                                    <td><input type="text" name="user_about" class="form-control" value="<%= user.getAbout()%>"></td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Registered on : </th>
                                                    <td><%= user.getDatetime()%></td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Profile : </th>
                                                    <td><input name="user_profile" type="file" class="form-control"></td>
                                                </tr>
                                            </tbody>
                                        </table>

                                        <button type="submit" class="btn btn-outline-primary">Apply Changes</button>
                                    </form>
                                </div>


                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button id="edit-btn" type="button" class="btn btn-primary">Edit</button>
                            </div>
                        </div>
                    </div>
                </div>




                <!--user info modal end-->






                <!--post modal-->

                <!-- Modal -->
                <div class="modal fade" id="post-details" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Provide The Post Details</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">

                                <form id="add-post-form" action="AddPostServlet" method="POST" enctype="multipart/form-data">

                                    <select class="form-select mb-3" name="cid">
                                        <option selected disabled>Select The Category</option>

                                        <%

                                            PostDao postdao = new PostDao(ConnectionProvider.getConnection());

                                            ArrayList<Category> list = postdao.getAllCategories();

                                            for (Category c : list) {

                                        %>
                                        <option value="<%= c.getCid()%>"><%= c.getName()%></option>

                                        <%
                                            }

                                        %>


                                    </select>

                                    <div class="mb-3">
                                        <input type="text" name="pTitle" placeholder="Enter Post Title" class="form-control" >
                                    </div>
                                    <div class="mb-3">
                                        <textarea class="form-control" name="pContent" placeholder="Enter Post Content" rows="4"></textarea>
                                    </div>
                                    <div class="mb-3">
                                        <textarea class="form-control" name="pCode" placeholder="Enter Your Program (If Any)" rows="4"></textarea>
                                    </div>
                                    <div class="mb-3">
                                        <label for="pic" class="form-label">Post The Image : </label>
                                        <input type="file" name="pic" class="form-control">
                                    </div>

                                    <div class="text-center">
                                        <button type="submit" class="btn btn-outline-primary">Post</button>
                                    </div>


                                </form>


                            </div>

                        </div>
                    </div>
                </div>






                <!-- Option 1: Bootstrap Bundle with Popper -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

                <!--font awesome js-->
                <script src="https://kit.fontawesome.com/ea10794980.js" crossorigin="anonymous"></script>

                <!--jquery cdn-->
                <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

                <!--sweet alert cdn-->
                <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

                <!--myjs-->
                <script src="Javascript/myjs.js" type="text/javascript"></script>


                <script>

                                $(document).ready(function () {

                                    let editStatus = false;
                                    $("#edit-btn").click(function () {

                                        if (editStatus === false) {
                                            $("#profile-details").hide();
                                            $("#profile-edit").show();
                                            $(this).text("Back");
                                            editStatus = true;
                                        } else {
                                            $("#profile-details").show();
                                            $("#profile-edit").hide();
                                            $(this).text("Edit");
                                            editStatus = false;
                                        }


                                    });

                                });

                </script>





                <!--add post js-->


                <script>

                    $(document).ready(function () {

                        $("#add-post-form").on("submit", function (event) {
                            event.preventDefault();

                            let form = new FormData(this);

                            $.ajax({
                                url: "AddPostServlet",
                                type: "POST",
                                data: form,

                                success: function (data, textStatus, jqXHR) {
                                    console.log(data);
                                    if (data.trim() === "done") {
                                        swal("Good job!", "Your Post Has Been Saved Successfully", "success")

                                    } else {
                                        swal("Error!", "Something Went Wrong! Please Try Again...", "error");
                                    }
                                },

                                error: function (jqXHR, textStatus, errorThrown) {
                                    console.log(data);
                                    swal("Error!", "Something Went Wrong! Please Try Again...", "error");
                                },
                                processData: false,
                                contentType: false
                            });
                        });

                    });

                </script>




                <script>

                    $(document).ready(function () {

                        $("#ans_form").on("submit", function (event) {
                            event.preventDefault();

                            let form = new FormData(this);

                            $.ajax({
                                url: "AnswerServlet",
                                data: form,
                                type: 'POST',
                                success: function (data, textStatus, jqXHR) {
                                    console.log(data);
                                },
                                error: function (jqXHR, textStatus, errorThrown) {
                                    console.log(data);
                                },
                                processData: false,
                                contentType: false
                            });
                        });
                    });

                </script>



                </body>
                </html>
