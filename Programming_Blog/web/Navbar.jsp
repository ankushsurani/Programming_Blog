<%@page import="com.programming.blog.entities.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.programming.blog.entities.Category"%>
<%@page import="com.programming.blog.dao.PostDao"%>
<%@page import="com.programming.blog.helper.ConnectionProvider"%>
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
                    <a class="nav-link active" aria-current="page" href="/Programming_Blog/Profile.jsp"><i class="fa-brands fa-artstation"></i> Categories</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#"><i class="fa-solid fa-address-book"></i> Contact</a>
                </li>

            </ul>
            <form class="d-flex">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-light" type="submit">Search</button>

            </form>

            <% User user = (User) session.getAttribute("currentUser");

                if (user == null) {

            %>
            <a href="Login.jsp" class="btn btn-outline-light ms-2"><i class="fa-solid fa-user"></i> Login</a>
            <a href="Register.jsp" class="btn btn-outline-light ms-2"><i class="fa-solid fa-user-plus"></i> Signup</a>


            <%                            } else {

            %>

            <a href="LogoutServlet" class="btn btn-outline-light ms-2"><i class="fa-solid fa-user-minus"></i> Logout</a>


            <%    }

            %>

        </div>
    </div>
</nav>

