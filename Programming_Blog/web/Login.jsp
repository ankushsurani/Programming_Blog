

<%@page import="com.programming.blog.helper.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>


        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

        <!--mycss-->
        <link href="CSS/Mycss.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>

        <!--navbar-->
        <%@include  file="Navbar.jsp" %>


        <!--login-->

        <main class="back-color banner-background">

            <div class="d-flex align-items-center" style="height: 80vh">

                <div class="col-md-4 offset-md-4">

                    <div class="card">
                        <div class="card-header">
                            <h2><i class="fa-solid fa-user"></i> Login</h2>
                        </div>


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


                        <div class="card-body">
                            <form action="LoginServlet" method="POST">
                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Email address</label>
                                    <input type="email" name="login_email" class="form-control" required>
                                    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputPassword1" class="form-label">Password</label>
                                    <input type="password" name="login_password" class="form-control" required>
                                </div>

                                <button type="submit" class="btn btn-primary">Login</button>
                            </form>
                            <a href="Register.jsp" class="text-decoration-none"><h6 class="my-3 text-center">Are You a New User?</h6></a>
                        </div>
                    </div>

                </div>

            </div>

        </main>


        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

        <!--font awesome js-->
        <script src="https://kit.fontawesome.com/ea10794980.js" crossorigin="anonymous"></script>

    </body>
</html>
