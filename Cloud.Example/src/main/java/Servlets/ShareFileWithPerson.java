package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.api.client.googleapis.auth.oauth2.GoogleCredential;
import com.google.api.client.googleapis.batch.BatchRequest;
import com.google.api.client.googleapis.batch.json.JsonBatchCallback;
import com.google.api.client.googleapis.json.GoogleJsonError;
import com.google.api.client.http.HttpHeaders;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.services.drive.Drive;
import com.google.api.services.drive.model.File;
import com.google.api.services.drive.model.Permission;

/**
 * Servlet implementation class ShareFileWithPerson
 */
public class ShareFileWithPerson extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShareFileWithPerson() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		
		String accessToken = (String) session.getAttribute("accessToken");
		String emailToShare = request.getParameter("emailToShare");
		
		String fileId = ((File) session.getAttribute("newFilename")).getId();
		
		GoogleCredential credential = new GoogleCredential().setAccessToken(accessToken);
		Drive drive =
		    new Drive.Builder(new NetHttpTransport(), JacksonFactory.getDefaultInstance(), credential)
		        .setApplicationName("GutbrodGomez")
		        .build();
		
		
		JsonBatchCallback<Permission> callback = new JsonBatchCallback<Permission>() {
		    @Override
		    public void onFailure(GoogleJsonError e,
		                          HttpHeaders responseHeaders)
		            throws IOException {
		        // Handle error
		        System.err.println(e.getMessage());
		    }

		    @Override
		    public void onSuccess(Permission permission,
		                          HttpHeaders responseHeaders)
		            throws IOException {
		        System.out.println("Permission ID: " + permission.getId());
		    }
		};
		BatchRequest batch = drive.batch();
		Permission userPermission = new Permission()
		        .setType("user")
		        .setRole("writer")
		        .setEmailAddress(emailToShare);
		drive.permissions().insert(fileId, userPermission)
		        .setFields("id")
		        .queue(batch, callback);
		
		response.sendRedirect("DriveFiles.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
