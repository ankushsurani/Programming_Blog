

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page  isErrorPage="true" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Something Went Wrong !</title>
        
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

        <!--mycss-->
        <link href="CSS/Mycss.css" rel="stylesheet" type="text/css"/>

        
    </head>
    <body>
        
        <div class="col-md-4 offset-md-4 my-5 text-center">
            <img src="images/access-error-logs.png" alt=""/>
            <p class="my-3"><%= exception %></p>
            <a href="index.jsp" class="btn btn-outline-primary">Home</a>
        </div>
        
        
        
        
        
        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

        <!--font awesome js-->
        <script src="https://kit.fontawesome.com/ea10794980.js" crossorigin="anonymous"></script>

        
    </body>
</html>
