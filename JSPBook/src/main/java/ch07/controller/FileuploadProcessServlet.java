package ch07.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/fileuploadProcess")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 1,  // 1MB
    maxFileSize = 1024 * 1024 * 10,       // 10MB
    maxRequestSize = 1024 * 1024 * 50     // 50MB
)
public class FileuploadProcessServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private static final String UPLOAD_DIR = "D:/upload";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        File uploadDir = new File(UPLOAD_DIR);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        out.println("<h2>업로드 결과</h2>");
        for (Part part : request.getParts()) {
            if (part.getName().equals("files") && part.getSize() > 0) {
                String fileName = part.getSubmittedFileName();
                part.write(UPLOAD_DIR + File.separator + fileName);
                out.println("<p>업로드 파일명: " + fileName + "</p>");
            }
        }
    }
}
