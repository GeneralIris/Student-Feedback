/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.server.model;

/**
 *
 * @author General IRIS
 */
public class Student implements java.io.Serializable{
    
    private String studentID,userName;

    
    
    public Student(String sID,String u){
        this.studentID=sID;
        this.userName=u;
    }
    
    public Student(String sID){
        this.studentID=sID;
        this.userName="";
    }

    public String getStudentID() {
        return studentID;
    }

    public String getUserName() {
        return userName;
    }

    public void setStudentID(String studentID) {
        this.studentID = studentID;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
    
    
}
