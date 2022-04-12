<%@page import="com.programming.blog.entities.Answer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.programming.blog.dao.AnswerDao"%>
<%@page import="com.programming.blog.entities.User"%>
<%@page import="com.programming.blog.dao.LikeDao"%>
<%@page import="java.util.List"%>
<%@page import="com.programming.blog.entities.Post"%>
<%@page import="com.programming.blog.helper.ConnectionProvider"%>
<%@page import="com.programming.blog.dao.PostDao"%>



<div class="row">

    <%

        Thread.sleep(1000);
        PostDao pd = new PostDao(ConnectionProvider.getConnection());

        int cid = Integer.parseInt(request.getParameter("cid"));

        List<Post> allposts = null;

        if (cid == 0) {
            allposts = pd.getAllPosts();
        } else {
            allposts = pd.getPostsByCatId(cid);
        }

        if (allposts.size() == 0) {
            out.println("<i class='fa-fade'><h3 class='display-3 text-center my-3'>No Posts In This Category...</h3></i>");
            return;
        }

        for (Post p : allposts) {

            String post_title = p.getpTitle();
            String post_content = p.getpContent();

    %>


    <% User user = (User) session.getAttribute("currentUser");%>


    <div class="col-md-6 mt-5">

        <div class="card" style="height: 480px">
            <% if (p.getpPic() != null) {
            %>
            <img src="blog_pics/<%= p.getpPic()%>" class="card-img-top" height="200px" alt="...">
            <%
                }
            %>

            <div class="card-body">
                
                <h5 class="card-title">
                    <% if (post_title.length() >= 80) {
                    %>
                    <%= post_title.substring(0, 80)%>...</h5>
                    <%
                    } else {
                    %>
                <h5><%= post_title%></h5>
                <%

                    }

                    if (post_content.length() >= 120) {

                %>
                <p class="card-text"><%= post_content.substring(0, 120)%>...</p>
                <%
                } else {
                %>
                <p><%= post_content%></p>
                <%

                    }
                %>


            </div>
            <div class="card-footer text-center back-color">
                <% LikeDao ldao = new LikeDao(ConnectionProvider.getConnection());%> 

                <a href="#!" class="btn btn-outline-light" onclick="doLike(<%= p.getpId()%>, <%= user.getId()%>)"><i class="fa fa-thumbs-o-up"><span class="like-counter"> <%= ldao.countLikeOnPost(p.getpId())%></span></i></a>
                <a href="show_blog_page.jsp?post_id=<%= p.getpId()%>" class="btn btn-outline-light">Read More <i class="fa-solid fa-arrow-right"></i></a>
                
                <% AnswerDao adao = new AnswerDao(ConnectionProvider.getConnection()); 
                

                ArrayList<Answer> ans =adao.fetchAnswerByPostId(p.getpId());
                
                %>
                
                <a href="show_blog_page.jsp?post_id=<%= p.getpId()%>" class="btn btn-outline-light"><i class="fa fa-commenting-o"><span> <%= ans.size() %></span></i></a>
            </div>
        </div>

    </div>



    <%

        }


    %>

</div>