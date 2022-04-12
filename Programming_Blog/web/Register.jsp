

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>


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

            <div class='py-5'>

                <div class="d-flex align-items-center pb-5">

                    <div class="col-md-4 offset-md-4">

                        <div class="card">
                            <div class="card-header">
                                <h2><i class="fa-solid fa-user-plus"></i> Signup</h2>
                            </div>
                            <div class="card-body">
                                <form action="RegisterServlet" id="reg-form" method="POST">
                                    <div class="mb-3">
                                        <label for="exampleInputEmail1" class="form-label">Username</label>
                                        <input type="text" name="user_name" class="form-control" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleInputEmail1" class="form-label">Email address</label>
                                        <input type="email" name="user_email" class="form-control" required>
                                        <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleInputPassword1" class="form-label">Password</label>
                                        <input type="password" name="user_password" class="form-control" required>
                                    </div>

                                    <div class="mb-3">
                                        <label for="gender" class="form-label">Gender : </label><br>
                                        <input class="form-check-input" type="radio" value="Male" name="user_gender" required> Male
                                        <input class="form-check-input" type="radio" value="Female" name="user_gender" required> Female
                                    </div>

                                    <div class="mb-3">
                                        <div class="mb-3">
                                            <textarea class="form-control" name="user_about" rows="3" placeholder="Write Something About You"></textarea>
                                        </div>
                                    </div>

                                    <div class="mb-3 form-check">
                                        <input type="checkbox" name="check" class="form-check-input">
                                        <label class="form-check-label" for="exampleCheck1">Agree Our Terms & Conditions</label>
                                    </div>

                                    <div id="loader" class="mb-3 text-center" style="display: none">
                                        <i class="fa-solid fa-rotate fa-spin fa-3x"></i>
                                        <h4>Please Wait...</h4>
                                    </div>

                                    <button id="signup-btn" type="submit" class="btn btn-primary">Signup</button>
                                </form>
                                <a href="Login.jsp" class="text-decoration-none"><h6 class="my-3 text-center">Already a User?</h6></a>
                            </div>
                        </div>

                    </div>

                </div>
            </div>

        </main>


        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

        <!--font awesome js-->
        <script src="https://kit.fontawesome.com/ea10794980.js" crossorigin="anonymous"></script>

        <!--jquery cdn-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

        <!--sweet alert-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

        <script>

            $(document).ready(function () {

                $("#reg-form").on('submit', function (event) {
                    event.preventDefault();

                    let form = new FormData(this);

                    $("#loader").show();
                    $("#signup-btn").hide();

                    $.ajax({
                        url: "RegisterServlet",
                        type: 'POST',
                        data: form,

                        success: function (data, textStatus, jqXHR) {
                            $("#loader").hide();
                            $("#signup-btn").show();

                            if (data.trim() === "done") {

                                swal("Successfully Registered...We are Redirect You to Login")
                                        .then((value) => {
                                            window.location = "Login.jsp";
                                        });
                            } else {
                                swal(data);
                            }

                        },

                        error: function (jqXHR, textStatus, errorThrown) {
                            $("#loader").hide();
                            $("#signup-btn").show();
                        },
                        processData: false,
                        contentType: false

                    });

                });

            });

        </script>

    </body>
</html>
