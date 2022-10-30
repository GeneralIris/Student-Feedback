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
public class Staff implements java.io.Serializable{
    
    private String staffID,userName;
    private int roleID,statusID;
    
    
    public Staff(String sI,String u,int r,int s){
        this.staffID=sI;
        this.userName=u;
        this.roleID=r;
        this.statusID=s;
    }

    public String getStaffId() {
        return staffID;
    }
    

    public String getUserName() {
        return userName;
    }

    public int getRoleID() {
        return roleID;
    }

    public int getStatusID() {
        return statusID;
    }

    
    public void setStaffID(String staffID) {
        this.staffID=staffID;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    public void setStatusID(int statusID) {
        this.statusID = statusID;
    }
    
    
    
    
}
