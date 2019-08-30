package Database;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Archit
 */
public class Query {
    public String insertIntoUser_Details(String email,String user,String pass)
    {
        String query="INSERT INTO USER_DETAILS VALUES('"+email+"','"+user+"','"+pass+"','ACTIVE')";
        return query;
    }
    public String selectAll()
    {
        String query="SELECT * FROM USER_DETAILS";
        return query;
    }
     public String selectAllFromUserDetailsAccordingToEmail(String value)
    {
        String query="SELECT * FROM USER_DETAILS WHERE EMAIL='"+value+"'";
        return query;
    }
      public String selectAllFromUserDetailsAccordingToUsername(String value)
    {
        String query="SELECT * FROM USER_DETAILS WHERE USERNAME='"+value+"'";
        return query;
    }
      public String selectFromUserDetailsAccordingToEmailorUsername(String value1)
    {
        String query="SELECT * FROM USER_DETAILS WHERE EMAIL='"+value1+"' OR USERNAME='"+value1+"'";
        return query;
    }
    public String selectFromUserDetailsAccordingToEmailAndUsername(String value1,String value2)
    {
        String query="SELECT * FROM USER_DETAILS WHERE EMAIL='"+value1+"' AND PASSWORD='"+value2+"' AND STATUS='ACTIVE'";
        return query;
    }
    public String updateUserDetailsStatus(String user, String status)
    {
        String query="UPDATE USER_DETAILS SET STATUS='"+status+"' WHERE EMAIL='"+user+"'";
        return query;
    }
    public String updateUserDetailsPassword(String user, String pass)
    {
        String query="UPDATE USER_DETAILS SET PASSWORD='"+pass+"' WHERE USERNAME='"+user+"'";
        return query;
    }
    public String updateUserDetailsEmail(String user, String email)
    {
        String query="UPDATE USER_DETAILS SET EMAIL='"+email+"' WHERE USERNAME='"+user+"'";
        return query;
    }
     public String updateUserDetailsUsername(String user, String new_user)
    {
        String query="UPDATE USER_DETAILS SET USERNAME='"+new_user+"' WHERE USERNAME='"+user+"'";
        return query;
    }
    public String insertIntoDocuments(String id, String time, String doc_name, String username, String path)
    {
        String query="INSERT INTO DOCUMENTS(DOCUMENT_ID, UPLOAD_DATE, DOCUMENT_NAME, USERNAME, PATH) VALUES('"+id+"','"+time+"','"+doc_name+"','"+username+"','"+path+"')";
        return query;
    }
    public String selectFromDocumentsAccordingToUsername(String user)
    {
        String query="SELECT * FROM DOCUMENTS WHERE USERNAME='"+user+"'";
        return query;
    }
     public String selectFromDocumentsAccordingToDocumentId(String doc_id)
    {
        String query="SELECT * FROM DOCUMENTS WHERE DOCUMENT_ID='"+doc_id+"'";
        return query;
    }
    public String documentRequestApproved(String doc, String request_id)
    {
        String query="UPDATE REQUEST_DOCUMENT SET DOCUMENT_PROVIDED_ID='"+doc+"', STATUS='APPROVED' WHERE REQUEST_ID='"+request_id+"'";
        return query;
    }
     public String documentRequestDecline(String request_id)
    {
        String query="UPDATE REQUEST_DOCUMENT SET STATUS='DECLINE' WHERE REQUEST_ID='"+request_id+"'";
        return query;
    }
    public String FileRename(String path, String doc_name, String new_path)
    {
        String query="UPDATE DOCUMENTS SET DOCUMENT_NAME='"+doc_name+"', PATH='"+new_path+"' WHERE PATH='"+path+"'";
        return query;
    }
    public String FileDelete(String  path)
    {
        String query="DELETE FROM DOCUMENTS WHERE PATH='"+path+"'";
        return query;
    }
    public String FolderRename(String path, String new_path)
    {
      String query="UPDATE DOCUMENTS SET PATH='"+new_path+"' WHERE PATH='"+path+"'";
        return query;
    }
    public String updateDocumentsUsername(String user, String new_user)
    {
        String query="UPDATE DOCUMENTS SET USERNAME='"+new_user+"' WHERE USERNAME='"+user+"'";
        return query;
    }
     public String searchDocument(String user, String search)
       {
           String query="SELECT * FROM DOCUMENTS WHERE USERNAME='"+user+"'  AND DOCUMENT_NAME like '%"+search+"%'";
           return query;
       }
    public String insertIntoRequestDocument(String requester, String name, String issuer, String message, String u)
    {
        String query="INSERT INTO REQUEST_DOCUMENT(REQUESTER, DOCUMENT_NAME, ISSUER, STATUS, MESSAGE, REQUEST_ID, DOCUMENT_PROVIDED_ID) VALUES('"+requester+"','"+name+"','"+issuer+"','PENDING','"+message+"','"+u+"','null')";
        return query;
    }
     public String selectFromRequestDocumentAccordingToUsernameWithoutStatus(String user)
    {
        String query="SELECT * FROM REQUEST_DOCUMENT WHERE ISSUER='"+user+"' OR REQUESTER='"+user+"' order by TIME desc";
        return query;
    }
     public String selectFromRequestDocumentAccordingToUsername(String user)
    {
        String query="SELECT * FROM REQUEST_DOCUMENT WHERE ISSUER='"+user+"' AND STATUS='PENDING' order by TIME desc";
        return query;
    }
     public String selectFromRequestDocumentAccordingToUsernameAndApprovedStatus(String user)
    {
        String query="SELECT * FROM REQUEST_DOCUMENT WHERE REQUESTER='"+user+"' AND STATUS='APPROVED' order by TIME desc";
        return query;
    }
      public String selectFromRequestDocumentsAccordingToRequestId(String request_id)
    {
        String query="SELECT * FROM REQUEST_DOCUMENT WHERE REQUEST_ID='"+request_id+"'";
        return query;
    }
     public String insertIntoRequestDocumentIssued(String name, String issuer, String message, String u, String issued_for)
    {
        String query="INSERT INTO REQUEST_DOCUMENT(REQUESTER, ISSUER, STATUS, MESSAGE, REQUEST_ID, DOCUMENT_PROVIDED_ID) VALUES('"+issued_for+"','"+issuer+"','SHARED','"+message+"','"+u+"','"+name+"')";
        return query;
    }
     public String selectFromRequestDocumentAccordingToUsernameAndShared(String user)
    {
        String query="SELECT * FROM REQUEST_DOCUMENT WHERE ISSUER='"+user+"' AND STATUS='SHARED' order by TIME desc";
        return query;
    }
      public String selectFromRequestDocumentAccordingToUsernameAndStatusNotPendingOrDecline(String user)
    {
        String query="SELECT * FROM REQUEST_DOCUMENT WHERE REQUESTER='"+user+"' AND STATUS='SHARED' OR STATUS='APPROVED' order by TIME desc";
        return query;
    }
      public String deleteFromRequestDocumentAccordingToUsernameAndShared(String  id)
    {
        String query="DELETE FROM REQUEST_DOCUMENT WHERE REQUEST_ID='"+id+"'";
        return query;
    }
   public String updateRequestDocumentsRequester(String user, String new_user)
    {
        String query="UPDATE REQUEST_DOCUMENT SET REQUESTER='"+new_user+"' WHERE REQUESTER='"+user+"'";
        return query;
    }
   public String updateRequestDocumentsIssuer(String user, String new_user)
    {
        String query="UPDATE REQUEST_DOCUMENT SET ISSUER='"+new_user+"' WHERE ISSUER='"+user+"'";
        return query;
    }
     public String insertIntoNotifications(String id, String user, String message)
    {
        String query="INSERT INTO NOTIFICATION(NOTIFICATION_ID, USERNAME, MESSAGE) VALUES('"+id+"','"+user+"','"+message+"')";
        return query;
    }
     public String selectFromNotificationAccordingToUsername(String user)
    {
        String query="SELECT * FROM NOTIFICATION WHERE USERNAME='"+user+"' order by TIME desc";
        return query;
    }
     public String deleteFromNotification(String  id)
    {
        String query="DELETE FROM NOTIFICATION WHERE NOTIFICATION_ID='"+id+"'";
        return query;
    }
     public String updateNotificationUsername(String user, String new_user)
    {
        String query="UPDATE NOTIFICATION SET USERNAME='"+new_user+"' WHERE USERNAME='"+user+"'";
        return query;
    }
     public String insertIntoContact(String sub, String user, String message)
    {
        String query="INSERT INTO CONTACT(USERNAME, SUBJECT, MESSAGE) VALUES('"+user+"','"+sub+"','"+message+"')";
        return query;
    }
     public String selectAllFromContact()
    {
        String query="SELECT * FROM CONTACT order by TIME desc";
        return query;
    }
      public String selectAllFromContactAccordingToContactId(String id)
    {
        String query="SELECT * FROM CONTACT WHERE CONTACT_ID='"+id+"'";
        return query;
    }
       public String updateContactRespond(String id, String message)
    {
      String query="UPDATE CONTACT SET REPLY='"+message+"' WHERE CONTACT_ID='"+id+"'";
        return query;
    }
       public String updateContactUsername(String user, String new_user)
    {
        String query="UPDATE CONTACT SET USERNAME='"+new_user+"' WHERE USERNAME='"+user+"'";
        return query;
    }
      
}
