package Servlets;

import java.io.IOException;
import java.util.Collections;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.api.client.googleapis.auth.oauth2.GoogleCredential;
import com.google.api.client.http.FileContent;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.services.drive.Drive;
import com.google.api.services.drive.model.File;

/**
 * Servlet implementation class AddNewDriveDocument
 */
public class AddNewDriveDocument extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddNewDriveDocument() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(true);
		
		String accessToken = (String) session.getAttribute("accessToken");
		
		String newDocumentName = request.getParameter("newDocument");
		
		GoogleCredential credential = new GoogleCredential().setAccessToken(accessToken);
		Drive drive =
		    new Drive.Builder(new NetHttpTransport(), JacksonFactory.getDefaultInstance(), credential)
		        .setApplicationName("GutbrodGomez")
		        .build();
		
		File fileMetadata = new File();
		fileMetadata.setId(newDocumentName + ".docx");
		fileMetadata.setMimeType("application/vnd.google-apps.document");
		File file =  drive.files().insert(fileMetadata)
		        .setFields("id, parents")
		        .execute();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
