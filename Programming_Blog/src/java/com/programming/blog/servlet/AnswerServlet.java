/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.programming.blog.servlet;

import com.programming.blog.dao.AnswerDao;
import com.programming.blog.entities.Answer;
import com.programming.blog.entities.User;
import com.programming.blog.helper.ConnectionProvider;
import com.programming.blog.helper.ProfilePic;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author LENOVO
 */
@MultipartConfig
public class AnswerServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            String answer_content = request.getParameter("answer_content");
            String answer_code = request.getParameter("answer_code");
            Part part = request.getPart("answer_img");
            String ans_img_name = part.getSubmittedFileName();
            int post_id = Integer.parseInt(request.getParameter("post_id"));

            HttpSession session = request.getSession();

            User user = (User) session.getAttribute("currentUser");

            int user_id = user.getId();

            Answer answer = new Answer(answer_content, answer_code, ans_img_name, post_id, user_id);

            AnswerDao dao = new AnswerDao(ConnectionProvider.getConnection());

            if (dao.giveAnswer(answer)) {
                out.println("done");

                String path = request.getRealPath("/") + "Answer_img" + File.separator + ans_img_name;

                if (ProfilePic.saveImage(part.getInputStream(), path)) {
                    out.println("done");

                }

            } else {
                out.println("error");
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
