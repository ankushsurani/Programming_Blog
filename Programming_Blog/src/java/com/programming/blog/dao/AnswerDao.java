package com.programming.blog.dao;

import com.programming.blog.entities.Answer;
import com.programming.blog.entities.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

public class AnswerDao {

    private Connection con;

    public AnswerDao(Connection con) {
        this.con = con;
    }

    //insert data into answer
    public boolean giveAnswer(Answer answer) {
        boolean b = false;

        try {

            String query = "insert into answer (answer_content,answer_code,answer_img,post_id,user_id) values (?,?,?,?,?)";

            PreparedStatement pstmt = con.prepareStatement(query);

            pstmt.setString(1, answer.getAnswer_content());
            pstmt.setString(2, answer.getAnswer_code());
            pstmt.setString(3, answer.getAnswer_img());
            pstmt.setInt(4, answer.getPost_id());
            pstmt.setInt(5, answer.getUser_id());

            pstmt.executeUpdate();

            b = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return b;

    }

    //fetch answer by post id
    public ArrayList<Answer> fetchAnswerByPostId(int post_id) {
        ArrayList<Answer> answer = new ArrayList<>();

        try {

            String query = "select * from answer where post_id=?";

            PreparedStatement pstmt = con.prepareStatement(query);

            pstmt.setInt(1, post_id);

            ResultSet set = pstmt.executeQuery();

            while (set.next()) {
                int answer_id = set.getInt("answer_id");
                String answer_content = set.getString("answer_content");
                String answer_code = set.getString("answer_code");
                String answer_img = set.getString("answer_img");
                int pid = set.getInt("post_id");
                int user_id = set.getInt("user_id");
                Timestamp answer_time = set.getTimestamp("answer_time");

                Answer a = new Answer(answer_id, answer_content, answer_code, answer_img, pid, user_id, answer_time);

                answer.add(a);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return answer;
    }
    
    
    
    
    //answer user get by ans id
    
    public User getUserByAnsUserId(int userid){
        
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
