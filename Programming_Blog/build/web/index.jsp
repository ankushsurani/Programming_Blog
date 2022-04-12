

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Programming Blog</title>

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

        <!--mycss-->
        <link href="CSS/Mycss.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>


        <!--Navbar-->
        <%@include  file="Navbar.jsp" %>



        <!--index page-->

        <div class="container-fluid m-0 p-0">

            <div class="back-color text-white banner-background">

                <div class="container py-5">

                    <h1>Welcome to Programming Blog</h1>
                    <p>A programming language is any set of rules that converts strings, or graphical program elements in the case of visual programming languages, to various kinds of machine code output.Programming languages are one kind of computer language, and are used in computer programming to implement algorithms.</p>
                    <p>Most programming languages consist of instructions for computers. There are programmable machines that use a set of specific instructions, rather than general programming languages. Since the early 1800s, programs have been used to direct the behavior of machines such as Jacquard looms, music boxes and player pianos.</p>

                    <a href="Register.jsp" class="btn btn-outline-light btn-lg me-2"><i class="fa-solid fa-arrow-right-to-bracket"></i> Start It's Free</a>
                    <a href="Login.jsp" class="btn btn-outline-light btn-lg"><i class="fa-solid fa-user"></i> Login</a>
                </div>

            </div>

        </div>



        <!--cards-->

        
        <div class="container">

            <div class="row">

                <% PostDao pdao = new PostDao(ConnectionProvider.getConnection());
                
                ArrayList<Category> list = pdao.getAllCategories();
                
                for(Category c : list){
                
                %>
                
                <div class="col-md-4 mt-5">

                    <div class="card">

                        <div class="card-body" style="height: 200px">
                            <h5 class="card-title"><%= c.getName() %></h5>
                            <p class="card-text"><%= c.getDescription()%></p>
                            <a href="/Programming_Blog/Profile.jsp" class="btn btn-primary">Read More</a>
                        </div>
                    </div>

                </div>
                
                <%
                    }
                
                %>
                
                
               
                </div>


            </div>
                
                
                
<!--                
                
    project Description
                
    
                -- first i made setup for project and i created packages in source packages
                   com.programming.blog.helper    -- in this package i only created helper classes like ConnectionProvider
                                              for send data to database and Message for success or error and other
                                              helper classes etc.
                   com.programming.blog.servlet   -- in this package i only created servlet classes
                   com.programming.blog.entities  -- in this package i only created those classes where i need to
                                              get and set data like in this project user, category, post, answer
                   com.programming.blog.Dao       -- in this package i only created those classes whose are send data 
                                              to database
                   i cerated some folder like css, javascript and images where i will store my css, javascript
                   and images.
                
                -- Then i create design of index.jsp and i use bootstrap for design, font-awesome for icon,
                   and clippy css for clip-path background. I created Navbar.jsp and include this in index.jsp
                   for code reusability. i design category of posts by using cards but at that moment backend 
                   is not involved.
                   
                -- then i create design of Login.jsp page and i designed form and add input type for email and 
                   password and submit type button. and create LoginServlet and send data of login form to 
                   loginServlet. we use getUserByEmailAndPassword for login. and after login we add user into 
                   setattributes using HttpSession. and send redirect to Profile.jsp page
                
                -- i create database user for store details of user. i create user class and create constructor 
                   and getters and setters of data. then i create design of Register.jsp page and i designed form
                   and add input type for email, password, username, gender, about and submit type button and 
                   create RegisterServlet and send data of Register form to RegisterServlet. in Register.jsp i  
                   also use of jquery cdn and ajax so we can stand register,jsp page after the form. And Also we 
                   use sweet alert cdn for success and error message. We use saveuser class for send register data
                   to database.
                   
                -- then i create error.jsp page for show error and declare this page to isErroPage="true" using
                   page directives.
                   
                -- then i create profile.jsp page and first i get login user attribute. if it is null i send
                   redirect to login page. i declare error page of Profile.jsp is error.jsp because this page
                   check attributes. i create different Navbar in profile.jsp page and i show the user on 
                   navbar by fetch user from HttpSession and show into bootstrap modal. in this modal i show
                   default image for profile.
                   --- then i create edit user in modal body and set the display=none and then i create input 
                       types and give their values from user and i also write input file for select profile pic.
                   --- i create ProfilePic class and create method of delete old image and save new image in 
                       project folder. so using this we can edit our profile pic
                   --- we use ajax for displaying one modal at a time.
                   --- we use editUser method for edit user and we send this data from editservlet to database
                       and when user edit is success or error. we send redirect to profile.jsp and show message 
                       using message class. we save this message in HttpSession setattribute and get thsi message
                       from attribut and show on profile.jsp and then remove this attribute for one time show 
                       message.
                   --- we create logout button and will send LogoutServlet and remove attribute of log in user and
                       send redirect to the login page and show message of logout.
                   --- i create database for store post. i create post class and create constructor and getter and
                       setters. i create post button and use modal. and in this modal i create input for take data.
                       i send this all data to addpostservlet and then send this data to database using post 
                       constructor and methods of postdao.
                   --- then i create row. in row i create one col-md-4 to show categories using list grop of
                       bootstrap and create one col-md-8 for showing posts by category using cards of bootstrap.
                       we will get all category from database and show in col-md-4.
                   --- in col-md-8 i create one spinner and i create one class.
                   --- i use jquery cdn and ajax and i give this class to html of load_posts.jsp
                       in load_posts.jsp i fetch all posts from database and i fetch posts_by_category_id using
                       postdao class methods and set condition if category==0 for showallposts and not 0 for
                       other category by id. we give onclick on category button and call ajax function for load
                       posts by category.
                   --- in cards we create likes, read more and comments button. 
                       ---- like button will display likes. 
                            we create like database and store post id and user id. and we will count like by 
                            post id in like database.i give onclick and call ajax function i use ajax and create
                            one function that will take post id and user id and store them in object and send 
                            them to LikeServlet and likeservlet fetch this data and send to database using
                            LikeDao class methods.
                       ---- show more button will send you to show_blog_page.jsp 
                            and i use url_rewriting and save post id in url
                       ---- comment button will display how many comment are posted in post.
                            and by clicking on button. it will send you to show_blog_page.jsp
                            
                   --- then we create show_blog_page.jsp
                       --- we fetch post by post id (post id is fetch from url)
                       --- we display the post in best form.
                       --- then i create answer database and then i create answer class constructor, getters and
                           setters. then i created answerdao methods for connect to database.
                       --- then i create answer form and send input user details to answerservlet. answerservlet
                           send data to database using answerdao class methods.
                       --- then i create fetchAnswerByPostId and save all answer in arraylist and then i show 
                           all answers to bottom down answer form using fetchAnswerByPostId for each loop.
                           and i show number of comments using arraylist.size
                   
                      
                      
                -->
                
                

        





        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

        <!--font awesome js-->
        <script src="https://kit.fontawesome.com/ea10794980.js" crossorigin="anonymous"></script>

    </body>
</html>
