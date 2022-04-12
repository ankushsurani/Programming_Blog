
package com.programming.blog.dao;

import com.programming.blog.entities.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class UserDao {
    
    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }
    
    public boolean saveUser(User user){
        boolean b = false;
        
        try{
            
            String query = "insert into user (name,email,password,gender,about) values(?,?,?,?,?)";
            
            PreparedStatement pstmt = con.prepareStatement(query);
            
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());
            
            pstmt.executeUpdate();
            
            b=true;
        }
        catch(Exception e){
            e.printStackTrace();
        }        
        
        return b;
    }
    
    
    public User getUserByEmailAndPassword(String email, String password){
        
        User user = null;
        try{
            
            String query = "select * from user where email=? and password=?";
            
            PreparedStatement pstmt = con.prepareStatement(query);
            
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            
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
    
    
    
    
    public boolean editUserProfile(User user){
        boolean b = false;
        try{
            
            String query = "update user set name=?, email=?, password=?, gender=?, about=?, profilepic=? where id=?";
            
            PreparedStatement pstmt = con.prepareStatement(query);
            
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());
            pstmt.setString(6, user.getProfilepic());
            pstmt.setInt(7, user.getId());
            
            pstmt.executeUpdate();
            
            b=true;
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        return b;
    }
    
}
