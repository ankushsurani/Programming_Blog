
package com.programming.blog.entities;

import java.sql.Timestamp;


public class User {
    
    private int id;
    private String name;
    private String email;
    private String password;
    private String gender;
    private String about;
    private Timestamp datetime;
    private String profilepic;

    public User() {
    }

    public User(int id, String name, String email, String password, String gender, String about, Timestamp datetime) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.about = about;
        this.datetime = datetime;
    }

    public User(int id, String name, String email, String password, String gender, String about) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.about = about;
    }

    public User(String name, String email, String password, String gender, String about, Timestamp datetime) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.about = about;
        this.datetime = datetime;
    }

    public User(String name, String email, String password, String gender, String about) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.about = about;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public Timestamp getDatetime() {
        return datetime;
    }

    public void setDatetime(Timestamp datetime) {
        this.datetime = datetime;
    }

    public String getProfilepic() {
        return profilepic;
    }

    public void setProfilepic(String profilepic) {
        this.profilepic = profilepic;
    }
    
    
    
    
}
