
package com.server.controller;
import com.server.utils.dbConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class StoreFeedbackServlet extends HttpServlet {

    
    private static PreparedStatement stmt =null;
    private static  ResultSet rs =null;
    private static  Connection conn = dbConnection.prepConnection();
    private static  List<String>questions = new ArrayList<String>();
    private static  List<Integer>questionsAnswer = new ArrayList<Integer>();
    private static  List<Integer>questionIDDB = new ArrayList<Integer>();
    private static  String questionRating = "ratingType";
    
    private static int feedbackID;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        List err = new LinkedList();
        try (PrintWriter out = response.getWriter()) {
           
            
            String feedbackIDStr = request.getParameter("feedbackID");
            String feedBackComment = request.getParameter("FeedbackComment");
            
            feedbackID = Integer.parseInt(feedbackIDStr);
            int questionNo = getQuestionNumFromDB();
            
            
            for(int i=questionNo ; i>0;i--){
                questions.add(questionRating+i);
            }
            Collections.reverse(questions);//Question asc from db (q1 -> etc..)
            
            
            for(String a : questions){

                String temp = request.getParameter(a);
                if(temp.equalsIgnoreCase("")){
                   
            err.add("Error occured, Not enough data");
            request.setAttribute("errMessage", err); 
            request.getRequestDispatcher("/FeedBackScreen.jsp").forward(request, response);

                    break;
                }
                else{   
                    //VERY IMPORTANT
                    questionsAnswer.add(Integer.parseInt(temp));

                }
            }
            
            
            
            if(err.isEmpty()){
                
                //Logical methods
                String student = request.getParameter("StudId");
                
                if(student.equalsIgnoreCase("")){
                    err.add("Error occured, Not enough data");
                    request.setAttribute("errMessage", err); 
                    request.getRequestDispatcher("/FeedBackScreen.jsp").forward(request, response);
                }
                
                
                if(!err.isEmpty()){
                    err.add("Error occured, no student id!");
                    
                request.setAttribute("errMessage", err); 
             request.getRequestDispatcher("/FeedBackScreen.jsp").forward(request, response);
                }
                
               
                
                String answer = addStudentFeedBackAnswer(student, response);
                
                
                
                  
            }
            else{
                err.add("Unknown error occured.....");
                request.setAttribute("errMessage", err); 
                request.getRequestDispatcher("/FeedBackScreen.jsp").forward(request, response);
            }
            
                

        }catch(Exception e){
            e.printStackTrace();
        }finally{
            
            questionsAnswer.clear();
            questions.clear();
            questionIDDB.clear();
            err.clear();
            
        }
            
            
            
            
        }
    


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
    
    private static int getQuestionNumFromDB(){
        
        
        try{
            stmt = conn.prepareStatement("SELECT COUNT(QUESTIONID) FROM QUESTION WHERE FEEDBACKID=?");
            stmt.setInt(1, feedbackID);
            rs = stmt.executeQuery();
            
            while(rs.next()){
                return rs.getInt(1);
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return 0;
        
    }
   
    
    private static String addStudentFeedBackAnswer(String studentID, HttpServletResponse response){
        
        try{
            
            getQuestionID();
            
            stmt = conn.prepareStatement("INSERT INTO STUDENTANSWER (QUESTIONID,STUDENTID,RATINGTYPEID) VALUES (?,?,?)");
            
            //gather all usefull info
            //studentId
            //questionIDDB          //length always the same cause always compare with DB only
            //questionsAnswer       //length always the same cause always compare with DB only
            
            for(int i=0;i<questionIDDB.size();i++){
                
                
                
                stmt.setInt(1, questionIDDB.get(i));
                stmt.setString(2, studentID);
                stmt.setInt(3, questionsAnswer.get(i));
                
                stmt.executeUpdate();
            }
            
           // here should display form submitted and log out button
            response.sendRedirect("viewStudentAnswer.jsp");
          
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return "";
    }
    
    
    private static void getQuestionID(){
        
        try{
            
            stmt = conn.prepareStatement("SELECT QUESTIONID FROM QUESTION WHERE FEEDBACKID = ? ORDER BY QUESTIONID ");
            stmt.setInt(1, feedbackID);
            rs = stmt.executeQuery();
            
            while(rs.next()){
                questionIDDB.add(rs.getInt(1));
            }
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
    }
    
}


