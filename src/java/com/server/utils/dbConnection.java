/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.server.utils;


import java.sql.*;

/**
 *
 * @author General IRIS
 */
public class dbConnection {
    
    public static Connection prepConnection(){
        return dbInitialization();
    }
    
    private static Connection dbInitialization(){
        Connection conn = null;
        
        String url = "jdbc:derby://localhost/ITFeedBackDatabase";
        String user = "test";
        String pass = "test";
        
        try{
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            
            conn = DriverManager.getConnection(url, user, pass);
        
        }catch(ClassNotFoundException e){
            e.printStackTrace();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return conn;
    }
    
    
}
