package com.programming.blog.entities;

import java.sql.Timestamp;

public class Answer {

    private int answer_id;
    private String answer_content;
    private String answer_code;
    private String answer_img;
    private int post_id;
    private int user_id;
    private Timestamp answer_time;

    public Answer() {
    }

    public Answer(int answer_id, String answer_content, String answer_code, String answer_img, int post_id, int user_id, Timestamp answer_time) {
        this.answer_id = answer_id;
        this.answer_content = answer_content;
        this.answer_code = answer_code;
        this.answer_img = answer_img;
        this.post_id = post_id;
        this.user_id = user_id;
        this.answer_time = answer_time;
    }

    public Answer(String answer_content, String answer_code, String answer_img, int post_id, int user_id, Timestamp answer_time) {
        this.answer_content = answer_content;
        this.answer_code = answer_code;
        this.answer_img = answer_img;
        this.post_id = post_id;
        this.user_id = user_id;
        this.answer_time = answer_time;
    }

    public Answer(String answer_content, String answer_code, String answer_img, int post_id, int user_id) {
        this.answer_content = answer_content;
        this.answer_code = answer_code;
        this.answer_img = answer_img;
        this.post_id = post_id;
        this.user_id = user_id;
    }

    public int getAnswer_id() {
        return answer_id;
    }

    public void setAnswer_id(int answer_id) {
        this.answer_id = answer_id;
    }

    public String getAnswer_content() {
        return answer_content;
    }

    public void setAnswer_content(String answer_content) {
        this.answer_content = answer_content;
    }

    public String getAnswer_code() {
        return answer_code;
    }

    public void setAnswer_code(String answer_code) {
        this.answer_code = answer_code;
    }

    public String getAnswer_img() {
        return answer_img;
    }

    public void setAnswer_img(String answer_img) {
        this.answer_img = answer_img;
    }

    public int getPost_id() {
        return post_id;
    }

    public void setPost_id(int post_id) {
        this.post_id = post_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public Timestamp getAnswer_time() {
        return answer_time;
    }

    public void setAnswer_time(Timestamp answer_time) {
        this.answer_time = answer_time;
    }
    
    
    

}
