/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.server.model;


public class RatingType implements java.io.Serializable{
    
    private int RatingTypeID;
    private String RatingTypeDesc;

    public RatingType(int RatingTypeID, String RatingTypeDesc) {
        this.RatingTypeID = RatingTypeID;
        this.RatingTypeDesc = RatingTypeDesc;
    }

    public RatingType(String RatingTypeDesc) {
        this.RatingTypeID = 0;
        this.RatingTypeDesc = RatingTypeDesc;
    }

    public int getRatingTypeID() {
        return RatingTypeID;
    }

    public String getRatingTypeDesc() {
        return RatingTypeDesc;
    }

    public void setRatingTypeID(int RatingTypeID) {
        this.RatingTypeID = RatingTypeID;
    }

    public void setRatingTypeDesc(String RatingTypeDesc) {
        this.RatingTypeDesc = RatingTypeDesc;
    }
    
    
    
    
    
}
