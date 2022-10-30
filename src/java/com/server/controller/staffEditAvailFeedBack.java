/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.server.controller;

import com.server.utils.dbConnection;

import com.server.model.Feedback;



import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class staffEditAvailFeedBack extends HttpServlet {
    
    private static Connection conn=null;
    private static PreparedStatement stmt=null;
    private static ResultSet rs = null;
    private static PrintWriter out = null;
    
    
    
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        List<String> errs = new LinkedList<String>();
        try {
            
            String feedbackavail = request.getParameter("avail");
            String feedbackid = request.getParameter("feedbackid");
            
            
            if(feedbackavail.trim().equalsIgnoreCase("")){
                errs.add("Enter a proper value");
            }
            if(feedbackid.trim().equalsIgnoreCase("")){
                errs.add("No Feedback ID Error");
            }
            
            if(!errs.isEmpty()){
                
                request.setAttribute("errs",errs);
                RequestDispatcher view = request.getRequestDispatcher("/staffViewFeedBack.jsp");
                view.forward(request,response);
                return;
                
            }
            
            int avail = Integer.parseInt(feedbackavail);
            int id = Integer.parseInt(feedbackid);
            
            
            
            Feedback fb = new Feedback(id,avail);
            
            
            
            
            
            int result = getAllowed();
            
            if(avail==0){ //Disable
                
                executeUpdate(fb);
                
            }
            
            else if(fb.getFeedBackAvail()==1){//Enable
                
                if(result==1){// >= 1
                    if(allowedSelfUpdateEnable(fb.getFeedbackID())){
                        executeUpdate(fb);
                    }
                    else{//Perform specific error checking
                        String themsg;
                        String person = getGlobalFeedbackUser(fb);
                        if(person.equalsIgnoreCase("Nothing")){
                            themsg ="Please Disable Other Feedback First";
                        }
                        else{
                            themsg = "Please contact : "+person +" and request to disable their feedback first";
                        }
                        errs.add(themsg);
                        
                    }
                }
                else{
                    executeUpdate(fb);
                }
                
                
            }
            else{
                errs.add("Not proper PLEASE SELECT ONLY SELECTIONS");
            }
            
            if(!errs.isEmpty()){
                
                request.setAttribute("errs",errs);
                RequestDispatcher view = request.getRequestDispatcher("/staffViewFeedBack.jsp");
                view.forward(request,response);
                return;
                
            }
            else{
                response.sendRedirect("staffViewFeedBack.jsp");
            }
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
    //Allow to change other feedback?
    private static int getAllowed(){
        int prepareTOCancel = 0;
        try{
            
            conn = dbConnection.prepConnection();
            
            stmt = conn.prepareStatement("SELECT COUNT(FEEDBACKID) FROM FEEDBACK WHERE FEEDBACKAVAIL=1");
            stmt.setMaxRows(1);
            rs=stmt.executeQuery();
            
            if(rs.next()){
                
                int count = rs.getInt(1);
                
                if(count>=1){
                    prepareTOCancel=1;
                }
    
            }

            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return prepareTOCancel;
    }
    
    
    
    
    private static boolean allowedSelfUpdateEnable(int id){
        
        try{
            
            conn = dbConnection.prepConnection();
            
            stmt = conn.prepareStatement("SELECT FEEDBACKAVAIL FROM FEEDBACK WHERE FEEDBACKID=?");
            stmt.setMaxRows(1);
            stmt.setInt(1, id);
            rs=stmt.executeQuery();
            
            if(rs.next()){
                
                if(rs.getInt(1)==1){
                    return true;
                }
                else{
                    return false;
                }
                
                
            }

        }catch(Exception e){
            e.printStackTrace();
        }
        
        return false;
        
    }
    
    
    
    private static void executeUpdate(Feedback b){
        
        try{
            
            conn = dbConnection.prepConnection();
            
            stmt = conn.prepareStatement("UPDATE FEEDBACK SET FEEDBACKAVAIL=? WHERE FEEDBACKID=?");
            
            stmt.setInt(1, b.getFeedBackAvail());
            stmt.setInt(2, b.getFeedbackID());
            
            stmt.executeUpdate();
            
            
            

        }catch(Exception e){
            e.printStackTrace();
        }
        
        
    }

    
    
    private static String getGlobalFeedbackUser(Feedback b){
        
        try{
            
            conn = dbConnection.prepConnection();
            
            stmt = conn.prepareStatement("SELECT S.STAFFNAME FROM STAFF S "
                                       + "JOIN FEEDBACK FB ON S.STAFFID = FB.STAFFID WHERE FB.FEEDBACKAVAIL=1 AND S.STAFFID !=?");
            stmt.setMaxRows(1);
            stmt.setString(1, b.getStaffID());
            rs = stmt.executeQuery();
            if(rs.next()){
                return rs.getString(1);
            }
            

            
            

        }catch(Exception e){
            e.printStackTrace();
        }
        
        return "Nothing";
    }
    
    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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

}
