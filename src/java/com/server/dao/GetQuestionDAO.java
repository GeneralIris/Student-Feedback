

package com.server.dao;

import com.server.model.Question;
import com.server.model.Feedback;
import com.server.model.Student;
import com.server.model.RatingType;


import com.server.utils.dbConnection;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;
import java.util.List;

public class GetQuestionDAO {
    
    //private static List<String> newquestions = new LinkedList<String>();
    
    private static List<Question> newquestions = new LinkedList<Question>();
    
    //private static List<String> newAnswers = new LinkedList<String>();
    
    private static List<RatingType> newAnswers = new LinkedList<RatingType>();
    
    
    
    private static ResultSet rs =null;
    private static PreparedStatement stmt = null;
    private static Connection conn = null;
    
    public static List<Question> getQuestionDB (Student a,Feedback b){
        return getQuestionDBPerform(a,b);
    }
    public static List<RatingType> getAnswerDB (Student a,Feedback b){
        return getAnswerDBPerform(a,b);
    }
    
    
    
    
    private static List<Question> getQuestionDBPerform (Student a,Feedback b){
        
        //String studId,int feedbackid
        try{
            
            conn = dbConnection.prepConnection();
            stmt = conn.prepareStatement("SELECT Q.QUESTIONDESC FROM QUESTION Q "
                                       + "JOIN STUDENTANSWER SA ON SA.QUESTIONID = Q.QUESTIONID "
                                       + "JOIN STUDENT S ON SA.STUDENTID=S.STUDENTID WHERE S.STUDENTID=? AND Q.FEEDBACKID =? ORDER BY Q.QUESTIONID ");
            
            
            stmt.setString(1, a.getStudentID());
            stmt.setInt(2, b.getFeedbackID());
            
            rs = stmt.executeQuery();
            
            while(rs.next()){
                newquestions.add(new Question(rs.getString(1)));
            }
            
            return newquestions;
            
        }catch(Exception e){
            e.printStackTrace();
        }

        return newquestions;
    }
    
    
    
    private static List<RatingType> getAnswerDBPerform (Student a,Feedback b){
        
        
        try{
            
            conn = dbConnection.prepConnection();
            stmt = conn.prepareStatement("SELECT R.RATINGTYPEDESC ,Q.QUESTIONID FROM RATINGTYPE R "
                                       + " JOIN STUDENTANSWER SA ON SA.RATINGTYPEID = R.RATINGTYPEID "
                                       + " JOIN STUDENT S ON SA.STUDENTID=S.STUDENTID "
                                       + " JOIN QUESTION Q ON SA.QUESTIONID = Q.QUESTIONID WHERE S.STUDENTID=? AND Q.FEEDBACKID =? ORDER BY Q.QUESTIONID ");
            
            stmt.setString(1, a.getStudentID());
            stmt.setInt(2, b.getFeedbackID());
            
            rs = stmt.executeQuery();
            
            while(rs.next()){
                newAnswers.add(new RatingType(rs.getString(1)));
            }
            
            return newAnswers;
            
        }catch(Exception e){
            e.printStackTrace();
        }

        return newAnswers;
    }
    
    
    
}
