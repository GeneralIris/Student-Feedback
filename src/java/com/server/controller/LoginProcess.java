
package com.server.controller;

import java.io.*;
import java.sql.*;


import com.server.utils.dbConnection;
import com.server.model.Staff;
import com.server.model.Student;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LoginProcess extends HttpServlet {
    
    
    
    static PreparedStatement statement;
    static PrintWriter out ;
    static HttpSession session;
    static Connection conn; 
    static ResultSet rs;
    static Staff a = null;
    static Student b = null;
    /*static final Pattern EmailRegexValidator = Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$", Pattern.CASE_INSENSITIVE);*/
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        out = response.getWriter();
        String username = request.getParameter("username");
        String userpass = request.getParameter("userpassword");
        session = request.getSession(true);
        
        remove_error_session(239329699);

        try{
            
            if(username.trim().isEmpty()){
                set_error_session(2);
            }
            if(userpass.trim().isEmpty()){
                set_error_session(1);
            }
        
            
            
            else{
                
                remove_error_session(1);
                remove_error_session(2);
                
                conn = dbConnection.prepConnection();
                
                if(conn!=null){
                    //out.println("Going to search");  
                    int checkInt = searchDatabase(username);

                    if(rs.last()){

                        //out.println("Got Data from db");
                        //Forgets user error 
                        remove_error_session(2);

                        String defaultPass = rs.getString("password");

                        if(userpass.equals(defaultPass)){


                            //If a Staff
                            if(checkInt == 1){

                                //Staff final checks
                                if(rs.getInt("statusid")==1){
                                    a = new Staff(rs.getString("staffid"),rs.getString("username"),rs.getInt("roleid"),rs.getInt("statusid"));
                                    //Active Session for Staff
                                    session.setAttribute("36F7TUs92NgC87MMd7A88pLK2H9Ri8GzpvZdbb3ZHHuB9fhrVz", a);
                                    //Forgets pass error
                                    remove_error_session(1);
                                    remove_error_session(3);
                                }
                                else{
                                    set_error_session(4);
                                }

                            //If a student  
                            }else if(checkInt ==2){
                                b = new Student (rs.getString("studentid"),rs.getString("username"));
                                //Active Session for Student
                                session.setAttribute("36F7TUs92NgC87MMd7A88pLK2H9Ri8GzpvZdbb3ZHHuB9fhrVz", b);
                                //Forgets pass error
                                remove_error_session(1);
                                remove_error_session(3);
                            }


                        }
                        else{
                            set_error_session(1);
                        }

                    }
                    else{
                        out.print("No data");
                        set_error_session(3);

                    }
                }
                    
                
                
            }
            if(statement!=null){
                statement.close();
            }
            if(rs!=null){
                rs.close();
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
            //Force to session filter (Login.jsp)
            response.sendRedirect("Login.jsp");
        
        
    }

    
    protected static int searchDatabase(String u){
        int val = -1;

        try{
            
            statement = conn.prepareStatement("SELECT staffid,roleid,statusid,username,password FROM STAFF WHERE username=?",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
            statement.setString(1, u);
            statement.setMaxRows(1);
            rs = statement.executeQuery();

           
            
            //Retrive and Restore Pointer to exact ResultSet
            if(rs.last()){
                rs.getRow();
                rs.beforeFirst();
                //out.println("Set val = 1");
                val= 1;
            }
            else{
                //out.println("Else : Student CHECKING");
                statement = conn.prepareStatement("SELECT studentid,username,password FROM STUDENT WHERE username=?",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
                statement.setString(1, u);
                statement.setMaxRows(1);
                rs = statement.executeQuery();
                
                if(rs.last()){
                    rs.getRow();
                    rs.beforeFirst();
                    val= 2;
                }
            }
            
            
        }catch(SQLException e){
            out.print("Exception detected");
            e.printStackTrace();
        }
        
        return val;
        
        
    }
    
    
    
    
    protected static void remove_error_session(int a){
        
        switch (a) {
            case 1:
                session.removeAttribute("passErr");
                break;
            case 2:
                session.removeAttribute("userErr");
                break;
            case 3:
                session.removeAttribute("loginErr");
                break;
            case 4:
                session.removeAttribute("statusErr");
                break;
            case 239329699:
                session.removeAttribute("passErr");
                session.removeAttribute("userErr");
                session.removeAttribute("loginErr");
                session.removeAttribute("statusErr");
                break;
            default:
                break;
        }

    }
    

    
    
    protected static void set_error_session(int a){
        
        switch (a) {
            case 1:
                session.setAttribute("passErr","ABfUdir77z24326255yM");
                break;
            case 2:
                session.setAttribute("userErr","G75L2584YyE2X2QHP39L");
                break;
            case 3:
                session.setAttribute("loginErr","zd4zw4Wb4MD8pX6297m8");
                break;
            case 4:
                session.setAttribute("statusErr","s84T6H27rwD5P75Ro5M2");
                break;
            default:
                break;
        }

    }
    
    
    public static boolean isMyResultSetEmpty(ResultSet rs) throws SQLException {
        return (!rs.isBeforeFirst() && rs.getRow() == 0);
    }
    
    
    
    /*
    protected static boolean validate(String emailStr) {
        Matcher matcher = EmailRegexValidator.matcher(emailStr);
        return matcher.find();
    }
    */
    
    
}

