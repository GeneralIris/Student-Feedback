
package com.server.controller;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import com.server.model.Feedback;
import com.server.model.Student;
import com.server.model.RatingType;

import com.server.dao.GetQuestionDAO;



import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class staffViewStudentAnswer2 extends HttpServlet {

 
    private static List<RatingType> answers = new LinkedList<RatingType>();
    
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            
            JsonObject data = new Gson().fromJson(request.getReader(), JsonObject.class);
            
            String studentID = data.get("studentID").getAsString();
            int feedbackID = data.get("feedbackId").getAsInt();
            
            Student a= new Student (studentID);
            Feedback fb = new Feedback(feedbackID);
            
            
            
            answers = GetQuestionDAO.getAnswerDB(a, fb);
            
            JsonArray studentAnswer = new JsonArray();
            
            if(answers.isEmpty()){
                return;
            }
            
            for(int i=0;i<answers.size();i++){
                studentAnswer.add(answers.get(i).getRatingTypeDesc());
            }
            response.getWriter().write(studentAnswer.toString());
           
            
            
            
            
            
            
            
            
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            answers.clear();
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
