package com.programming.blog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class ProfilePic {


    public static boolean deleteImage(String path) {
        boolean b = false;
        
        try {

            File file = new File(path);

            b = file.delete();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return b;
    }
    
    
    public static boolean saveImage(InputStream is, String path){
        boolean b = false;
        
        try{
            
            byte imgs [] = new byte [is.available()];
            
            is.read(imgs);
            
            FileOutputStream fos = new FileOutputStream(path);
            
            fos.write(imgs);
            
            fos.flush();
            fos.close();
            
            b= true;
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        return b;
    }

}
