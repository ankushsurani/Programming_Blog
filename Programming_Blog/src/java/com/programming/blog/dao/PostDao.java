
package com.programming.blog.dao;

import com.programming.blog.entities.Category;
import com.programming.blog.entities.Post;
import com.programming.blog.entities.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;


public class PostDao {
    
    private Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }
    
    public ArrayList<Category> getAllCategories(){
        ArrayList<Category> list = new ArrayList<>();
        
        try{
            
            String query = "select * from categories";
            
            Statement stmt = con.createStatement();
            
            ResultSet set = stmt.executeQuery(query);
            
            while(set.next()){
                
                int id = set.getInt("cid");
                String name = set.getString("name");
                String description = set.getString("description");
                
                Category c = new Category(id,name,description);
                
                list.add(c);
                
            }
            
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        
        
        return list;
    } 
    
    
    
    public boolean savePost(Post post){
        boolean b = false;
        
        
        try{
            
            String query = "insert into posts (pTitle,pContent,pCode,pPic,catId,userid) values (?,?,?,?,?,?)";
            
            PreparedStatement pstmt = con.prepareStatement(query);
            
            pstmt.setString(1, post.getpTitle());
            pstmt.setString(2, post.getpContent());
            pstmt.setString(3, post.getpCode());
            pstmt.setString(4, post.getpPic());
            pstmt.setInt(5, post.getCatId());
            pstmt.setInt(6, post.getUserId());
            
            pstmt.executeUpdate();
            
            b=true;
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        
        return b;
    }
    
    
    //fetch all posts
    public List<Post> getAllPosts(){
        List<Post> list = new ArrayList<>();
        
        
        try{
            
            String query = "select * from posts order by pId desc";
            
            Statement stmt = con.createStatement();
            
            ResultSet set = stmt.executeQuery(query);
            
            while(set.next()){
                
                int pId = set.getInt("pId");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPIc = set.getString("pPIc");
                Timestamp pDate = set.getTimestamp("pDate");
                int catId = set.getInt("catId");
                int userid = set.getInt("userid");
                
                Post post = new Post(pId,pTitle,pContent,pCode,pPIc,pDate,catId,userid);
                
                list.add(post);
                
            }
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        
        return list;
    }
    
    //fetch all posts
    public List<Post> getPostsByCatId(int catId){
        List<Post> list = new ArrayList<>();
        
        
        try{
            
            String query = "select * from posts where catId=?";
            
            PreparedStatement pstmt = con.prepareStatement(query);
            
            pstmt.setInt(1, catId);
            
            ResultSet set = pstmt.executeQuery();
            
            while(set.next()){
                
                int pId = set.getInt("pId");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPIc = set.getString("pPIc");
                Timestamp pDate = set.getTimestamp("pDate");
                int userid = set.getInt("userid");
                
                Post post = new Post(pId,pTitle,pContent,pCode,pPIc,pDate,userid);
                
                list.add(post);
                
            }
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        
        return list;
    }
    
    
    
    
//    get post by id
    
    public Post getPostByPostId(int postId){
        Post post = null;
        
        try{
            
            String query = "select * from posts where pId=?";
            
            PreparedStatement pstmt = con.prepareStatement(query);
            
            pstmt.setInt(1, postId);
            
            ResultSet set = pstmt.executeQuery();
            
            if(set.next()){
                
                int pId = set.getInt("pId");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPIc = set.getString("pPIc");
                Timestamp pDate = set.getTimestamp("pDate");
                int catId = set.getInt("catId");
                int userid = set.getInt("userid");
                
                post = new Post(pId,pTitle,pContent,pCode,pPIc,pDate,catId,userid);
                
            }
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        
        
        return post;
    }
    
    
    
    
    public User getUserByPostUserId(int userid){
        
        User user = null;
        
        
        try{
            
            String query = "select * from user where id=?";
            
            PreparedStatement pstmt = con.prepareStatement(query);
            
            pstmt.setInt(1, userid);
            
            ResultSet set = pstmt.executeQuery();
            
            if(set.next()){
                
                user = new User();
                
                user.setId(set.getInt("id"));
                user.setName(set.getString("name"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setDatetime(set.getTimestamp("datetime"));
                user.setProfilepic(set.getString("profilepic"));
                
            }
            
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        
        
        return user;
    } 
    
    
}
