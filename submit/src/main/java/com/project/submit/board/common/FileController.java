package com.project.submit.board.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.print.DocFlavor.INPUT_STREAM;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FileController {

	private static final String downAddress = "C:\\board\\article_image";
	
	
	@RequestMapping(value="/download.do")
	public void download(@RequestParam("imageFileName") String imageFileName,@RequestParam("articleNO") 
	int articleNO,HttpServletResponse response) throws IOException {
		
		OutputStream out = response.getOutputStream();
		
		String downFile=downAddress+"\\"+articleNO+"\\"+imageFileName;
		
		File file = new File(downFile);
		
		FileInputStream in = new FileInputStream(file);
		
		byte[] buffer = new byte[1024 * 8];
		while (true) {
			int count = in.read(buffer);
			if (count == -1)
				break;
			out.write(buffer, 0, count);
		}
		
		in.close();
		out.close();
		
		
		
	}
	
	
}
