/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.server.model;

public class Question implements java.io.Serializable{
    private int QuestionID;
    private String QuestionDesc;
    private int FeedBackID;

    public Question(int QuestionID, String QuestionDesc, int FeedBackID) {
        this.QuestionID = QuestionID;
        this.QuestionDesc = QuestionDesc;
        this.FeedBackID = FeedBackID;
    }

    
    
    public Question(String QuestionDesc, int FeedBackID) {
        this.QuestionID=0;
        this.QuestionDesc = QuestionDesc;
        this.FeedBackID = FeedBackID;
    }

    public Question(String QuestionDesc) {
        this.QuestionID=0;
        this.QuestionDesc = QuestionDesc;
        this.FeedBackID = 0;
    }
    
    

    public String getQuestionDesc() {
        return QuestionDesc;
    }

    public int getFeedBackID() {
        return FeedBackID;
    }

    public void setQuestionDesc(String QuestionDesc) {
        this.QuestionDesc = QuestionDesc;
    }

    public void setFeedBackID(int FeedBackID) {
        this.FeedBackID = FeedBackID;
    }

    @Override
    public String toString() {
        return "Question{" + "QuestionDesc=" + QuestionDesc + ", FeedBackID=" + FeedBackID + '}';
    }
    
    
    
    
}
