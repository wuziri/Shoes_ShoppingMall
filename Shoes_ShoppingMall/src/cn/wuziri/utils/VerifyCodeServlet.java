package cn.wuziri.utils;

import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class VerifyCodeServlet extends HttpServlet {

	private int w = 70;
	private int h = 35;
 	private Random r = new Random();
 	// {"宋体", "华文楷体", "黑体", "华文新魏", "华文隶书", "微软雅黑", "楷体_GB2312"}
	private String[] fontNames  = {"宋体", "华文楷体", "黑体", "微软雅黑", "楷体_GB2312"};
	private String codes  = "23456789abcdefghjkmnopqrstuvwxyzABCDEFGHJKMNPQRSTUVWXYZ";
	private Color bgColor  = new Color(255, 255, 255);
	private String text ;
	
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		BufferedImage image = new BufferedImage(w, h, BufferedImage.TYPE_INT_RGB); 
		Graphics2D g2 = (Graphics2D)image.getGraphics(); 
		g2.setColor(this.bgColor);
		g2.fillRect(0, 0, w, h);
		
		StringBuilder sb = new StringBuilder();
		// 向图片中画4个字符
		for(int i = 0; i < 4; i++)  {
			String s = codes.charAt(r.nextInt(codes.length())) + ""; 
			sb.append(s); 
			float x = i * 1.0F * w / 4; 
			g2.setFont(randomFont()); 
			g2.setColor(randomColor()); 
			g2.drawString(s, x, h-5); 
		}
		this.text = sb.toString(); 
		drawLine(image); 
		System.out.println(text);
		request.getSession().setAttribute("vCode", text);
		ImageIO.write(image, "JPEG", response.getOutputStream());
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
	public void init() throws ServletException {
		// Put your code here
	}

	private Color randomColor () {
		int red = r.nextInt(150);
		int green = r.nextInt(150);
		int blue = r.nextInt(150);
		return new Color(red, green, blue);
	}
	
	private Font randomFont () {
		int index = r.nextInt(fontNames.length);
		String fontName = fontNames[index];
		int style = r.nextInt(4);
		int size = r.nextInt(5) + 24; 
		return new Font(fontName, style, size);
	}
	
	private void drawLine (BufferedImage image) {
		int num  = 3;
		Graphics2D g2 = (Graphics2D)image.getGraphics();
		for(int i = 0; i < num; i++) {
			int x1 = r.nextInt(w);
			int y1 = r.nextInt(h);
			int x2 = r.nextInt(w);
			int y2 = r.nextInt(h); 
			g2.setStroke(new BasicStroke(1.5F)); 
			g2.setColor(Color.BLUE); 
			g2.drawLine(x1, y1, x2, y2);
		}
	}
	
	
}
