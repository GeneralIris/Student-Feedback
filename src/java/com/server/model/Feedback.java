/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.server.model;

public class Feedback implements java.io.Serializable{
    
    private int FeedbackID;
    private String FeedbackDesc;
    private String StaffID;
    private int FeedBackAvail;

    public Feedback(int FeedbackID, String FeedbackDesc, String StaffID,int FeedBackAvail) {
        this.FeedbackID = FeedbackID;
        this.FeedbackDesc = FeedbackDesc;
        this.StaffID = StaffID;
        this.FeedBackAvail=FeedBackAvail;
    }
    public Feedback(String FeedbackDesc, String StaffID , int FeedBackAvail) {
        this.FeedbackID=0;
        this.FeedbackDesc = FeedbackDesc;
        this.StaffID = StaffID;
        this.FeedBackAvail=FeedBackAvail;
    }
    
    public Feedback(String FeedbackDesc, String StaffID) {
        this.FeedbackID=0;
        this.FeedbackDesc = FeedbackDesc;
        this.StaffID = StaffID;
        this.FeedBackAvail=0;
    }
    
    public Feedback(int FeedbackID) {
        this.FeedbackID=FeedbackID;
        this.FeedbackDesc = "";
        this.StaffID = "";
        this.FeedBackAvail=0;
    }

    public Feedback(int FeedbackID, int FeedBackAvail) {
        this.FeedbackID = FeedbackID;
        this.FeedBackAvail = FeedBackAvail;
        this.FeedbackDesc = "";
        this.StaffID = "";
    }

    public int getFeedBackAvail() {
        return FeedBackAvail;
    }

    
    
    

    public int getFeedbackID() {
        return FeedbackID;
    }

    public String getFeedbackDesc() {
        return FeedbackDesc;
    }

    public String getStaffID() {
        return StaffID;
    }

    public void setFeedbackID(int FeedbackID) {
        this.FeedbackID = FeedbackID;
    }

    public void setFeedbackDesc(String FeedbackDesc) {
        this.FeedbackDesc = FeedbackDesc;
    }

    public void setStaffID(String StaffID) {
        this.StaffID = StaffID;
    }

    public void setFeedBackAvail(int FeedBackAvail) {
        this.FeedBackAvail = FeedBackAvail;
    }

    @Override
    public String toString() {
        return "Feedback{" + "FeedbackID=" + FeedbackID + ", FeedbackDesc=" + FeedbackDesc + ", StaffID=" + StaffID + ", FeedBackAvail=" + FeedBackAvail + '}';
    }

    
    
    
    
    
    
    
}
