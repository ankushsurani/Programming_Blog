
package com.programming.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class LikeDao {
    
    private Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }
    
    //insert like
    public boolean insertLike(int pid, int uid){
        boolean b = false;
        
        
        try{
            
            String query = "insert into liked (pid,uid) values (?,?)";
            
            PreparedStatement pstmt = con.prepareStatement(query);
            
            pstmt.setInt(1, pid);
            pstmt.setInt(2, uid);
            
            pstmt.executeUpdate();
            
            b = true;
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        
        
        return b;
    }
    
    
    
    //count like
    
    public int countLikeOnPost(int pid){
        int count = 0;
        
        
        try{
            
            String query = "select count(*) from liked where pid=?";
            
            PreparedStatement pstmt = con.prepareStatement(query);
            
            pstmt.setInt(1, pid);
            
            ResultSet set = pstmt.executeQuery();
            
            if(set.next()){
                count = set.getInt("count(*)");
            }
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        
        return count;
    }
    
    
    
    
    //check post is liked by user or not
    
    
    public boolean isLikedByUser(int pid, int uid){
        boolean b = false;
        
        
        try{
            
            String query = "select * from liked where pid=? and uid=?";
            
            PreparedStatement pstmt = con.prepareStatement(query);
            
            pstmt.setInt(1, pid);
            pstmt.setInt(2, uid);
            
            ResultSet set = pstmt.executeQuery();
            
            if(set.next()){
                b = true;
            }
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        
        
        return b;
    }
    
    
    
    
    //delete like
    
    public boolean deleteLike(int pid, int uid){
        boolean b = false;
        
        
        try{
            
            String query = "delete from liked where pid=? and uid=?";
            
            PreparedStatement pstmt = con.prepareStatement(query);
            
            pstmt.setInt(1, pid);
            pstmt.setInt(2, uid);
            
            pstmt.executeUpdate();
            
            b=true;
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        
        return b;
    }
    
}
