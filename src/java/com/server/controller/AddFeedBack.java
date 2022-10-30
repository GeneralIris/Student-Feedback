
package com.server.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;


import com.server.dao.InsertQuestionDAO;

import com.server.model.Question;
import com.server.model.Feedback;


public class AddFeedBack extends HttpServlet {


    
    //private static List<String> QuestionList =  new LinkedList<String>();
    
    private static List<Question> QuestionModel =  new LinkedList<Question>();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String responsez = "";
        
        try {
            
            
            JsonObject data = new Gson().fromJson(request.getReader(), JsonObject.class);

            //String myJsonData = data.get("Questions").getAsJsonArray();
           
            String feedbackDesc = data.get("FeedbackDesc").getAsString();
            String StaffID = data.get("StaffID").getAsString();
            JsonArray questionList = data.getAsJsonArray("Questions");
            
            Feedback aFeedback = new Feedback(feedbackDesc,StaffID);
            
            for (int i = 0; i < questionList.size(); i++) {
                
               QuestionModel.add(new Question(questionList.get(i).getAsString()));
               
               //QuestionList.add(questionList.get(i).getAsString());
            }
            
            responsez = InsertQuestionDAO.insertQuestionDB(QuestionModel,aFeedback);
            
            if(responsez.equalsIgnoreCase("")){
                
                return;
                
            }else{
                response.getWriter().write(responsez);
            }
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
        finally{
            QuestionModel.clear();
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
