/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.server.controller;

import com.server.model.StaffData;
import com.server.utils.dbConnection;

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


public class staffRegister extends HttpServlet {

    private static ResultSet rs =null;
    private static PreparedStatement stmt = null;
    private static Connection conn = null;
    

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        List<String> msg = new LinkedList<String>();
        try (PrintWriter out = response.getWriter()) {
            
            String staffname = request.getParameter("staffname");
            String staffemail = request.getParameter("staffemail");
            String staffphonenumber = request.getParameter("staffphonenumber");
            String staffusername = request.getParameter("staffusername");
            String staffpassword1 = request.getParameter("staffpassword1");
            String staffpassword2 = request.getParameter("staffpassword2");
            String staffid = request.getParameter("staffid");
            
            if(staffname.trim().equalsIgnoreCase("")||staffemail.trim().equalsIgnoreCase("")||staffphonenumber.trim().equalsIgnoreCase("")||
               staffusername.trim().equalsIgnoreCase("")||staffpassword1.trim().equalsIgnoreCase("")||staffpassword2.trim().equalsIgnoreCase("")||staffid.trim().equalsIgnoreCase("")){
                
                msg.add("Enter all inputs");
                
            }
            
            if(!staffpassword1.trim().equalsIgnoreCase(staffpassword2)){
                msg.add("Ensure password are correct!");
            }else{
                if(staffpassword1.trim().length()<8){
                    msg.add("Password must be at least than 8 ");
                }
            }
            
            if(msg.isEmpty()){
                String staffpassword = staffpassword1;
                StaffData sd = new StaffData (staffid,staffname,staffemail,staffphonenumber,staffusername,staffpassword);
                
                conn = dbConnection.prepConnection();
                
                if(checkDB(sd)){
                    
                    msg.add("Staff Already Existed!");
                    
                }
                else{
                    if(insertDB(sd).equalsIgnoreCase("Success")){
                        msg.add("Successfully added functional staff to system");
                    }else{
                        msg.add("DB problem");
                    }
                }
                
                
            }
            
            request.setAttribute("Msgs", msg);
            RequestDispatcher view = request.getRequestDispatcher("/Register.jsp");
            view.forward(request, response); 
            
            
            
            
            
            
        }
    }

    
    private static String insertDB(StaffData a){
        
        try{
            stmt = conn.prepareStatement("INSERT INTO STAFF (STAFFID,STAFFNAME,STAFFEMAIL,STAFFPHONE,USERNAME,PASSWORD,ROLEID,STATUSID) VALUES (?,?,?,?,?,?,?,?)");
            stmt.setString(1, a.getStaffid());
            stmt.setString(2, a.getStaffname());
            stmt.setString(3, a.getStaffemail());
            stmt.setString(4, a.getStaffphonenumber());
            stmt.setString(5, a.getStaffusername());
            stmt.setString(6, a.getStaffpassword());
            stmt.setInt(7, 1);
            stmt.setInt(8, 1);
            
            int b= stmt.executeUpdate();
            
            if(b==1){
                return "Success";
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return "Failed";
    }
    
    private static boolean checkDB (StaffData a){
        
        try{
            stmt = conn.prepareStatement("SELECT STAFFID FROM STAFF WHERE STAFFID=?");
            stmt.setString(1, a.getStaffid());
            rs = stmt.executeQuery();
            
            while(rs.next()){
                return true;
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return false;
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
