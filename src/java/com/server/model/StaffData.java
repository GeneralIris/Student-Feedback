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
public class StaffData  implements java.io.Serializable{
    
    private String staffid,staffname,staffemail,staffphonenumber,staffusername,staffpassword;

    public StaffData(String staffid, String staffname, String staffemail, String staffphonenumber, String staffusername, String staffpassword) {
        this.staffid = staffid;
        this.staffname = staffname;
        this.staffemail = staffemail;
        this.staffphonenumber = staffphonenumber;
        this.staffusername = staffusername;
        this.staffpassword = staffpassword;
    }

    public String getStaffid() {
        return staffid;
    }

    public String getStaffname() {
        return staffname;
    }

    public String getStaffemail() {
        return staffemail;
    }

    public String getStaffphonenumber() {
        return staffphonenumber;
    }

    public String getStaffusername() {
        return staffusername;
    }

    public String getStaffpassword() {
        return staffpassword;
    }

    public void setStaffid(String staffid) {
        this.staffid = staffid;
    }

    public void setStaffname(String staffname) {
        this.staffname = staffname;
    }

    public void setStaffemail(String staffemail) {
        this.staffemail = staffemail;
    }

    public void setStaffphonenumber(String staffphonenumber) {
        this.staffphonenumber = staffphonenumber;
    }

    public void setStaffusername(String staffusername) {
        this.staffusername = staffusername;
    }

    public void setStaffpassword(String staffpassword) {
        this.staffpassword = staffpassword;
    }

    
    
}
