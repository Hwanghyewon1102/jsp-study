package ch07;

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
import java.util.Collection;

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
        
        Collection<Part> fileParts = request.getParts();
        
        
        out.println("<h2>업로드 결과</h2>");
        int fileCount = 1;
		for (Part part : fileParts) {
			// 파일만 필터링
			if(part.getName().startsWith("uploadFile")) {
				String fileName = part.getSubmittedFileName(); // 원본 파일 이름
				
				// 파일만 필터링 - 방법2
				// fileName은 파일 필드가 아닌 일반 폼 필드에서는 항상 null
				if (fileName == null || fileName.isEmpty()) continue;
				
				part.write(uploadDir + File.separator + fileName); // 파일 저장
				out.println("업로드된 파일 " + fileCount + ": " + fileName + "<br>");
				fileCount++;
			}
		}
        }
    }

