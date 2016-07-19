package com.taoduoduo.servlet;

import javax.servlet.*;  
import javax.servlet.http.*;  
import java.io.*;  
import java.util.*;  
import org.apache.commons.fileupload.*;  
import org.apache.commons.fileupload.servlet.*;  
import org.apache.commons.fileupload.disk.*;  
import com.taoduoduo.product.*;
import com.taoduoduo.category.*;
 
// Servlet 文件上传  
public class FileUp extends HttpServlet  
{  
	
    private String filePath;    // 文件存放目录  
    private String tempPath;    // 临时文件目录  
    Product p=new Product();
    // 初始化  
    public void init(ServletConfig config) throws ServletException  
    {  
        super.init(config);  
        // 从配置文件中获得初始化参数  
        filePath = config.getInitParameter("filepath");  
        tempPath = config.getInitParameter("temppath");  
        
       /* ServletContext context = getServletContext();  */
 
/*        filePath = context.getRealPath(filePath);  
        tempPath = context.getRealPath(tempPath);  */
        System.out.println("文件存放目录、临时文件目录准备完毕 ...");  
    }  
      
    // doPost  
    public void doPost(HttpServletRequest req, HttpServletResponse res)  
        throws IOException, ServletException  
    {  
    	req.setCharacterEncoding("UTF-8");
        res.setContentType("text/plain;charset=UTF-8");  
        PrintWriter pw = res.getWriter();  
        try{  
            DiskFileItemFactory diskFactory = new DiskFileItemFactory();  
            // threshold 极限、临界值，即硬盘缓存 1M  
            diskFactory.setSizeThreshold(4 * 1024);  
            // repository 贮藏室，即临时文件目录  
            diskFactory.setRepository(new File(tempPath));  
          
            ServletFileUpload upload = new ServletFileUpload(diskFactory);  
            // 设置允许上传的最大文件大小 4M  
            upload.setSizeMax(4 * 1024 * 1024);  
            // 解析HTTP请求消息头  
            List fileItems = upload.parseRequest(req);  
            Iterator iter = fileItems.iterator();  
            while(iter.hasNext())  
            {  
                FileItem item = (FileItem)iter.next();  
                if(item.isFormField())  
                {  
                    System.out.println("处理表单内容 ...");  
                    processFormField(item, pw);  
                    
                }else{  
                	
                    System.out.println("处理上传的文件 ...");  
                    processUploadFile(item, pw); 
                    res.setHeader("refesh","0;url=admin/admin.jsp?id=3");
                }  
            }// end while()  
            ProductMrg.get_instance().add(p);
            pw.close(); 
            
        }catch(Exception e){  
            System.out.println("使用 fileupload 包时发生异常 ...");  
            e.printStackTrace();  
        }// end try ... catch ...  
    }// end doPost()  
 
 
    // 处理表单内容  
    private void processFormField(FileItem item, PrintWriter pw)  
        throws Exception  
    {  
    	
    	if(item.getFieldName().equals("name")){
    		p.setName(item.getString());
    	}
    	if(item.getFieldName().equals("price")){
    		p.setPrice(Double.parseDouble(item.getString()));
    	}
    	if(item.getFieldName().equals("category")){
    		String realname=item.getString();
    		p.setCategoryid(CategoryMrg.get_instance().getIdByName(realname));
    	}
    	if(item.getFieldName().equals("time")){
    		p.setTime(item.getString());
    	}
    	if(item.getFieldName().equals("stock")){
    		p.setStock(Integer.parseInt(item.getString()));
    	}
    	if(item.getFieldName().equals("descr")){
    		p.setDescr(item.getString());
    	}
    	p.setShelf(0);
    	p.setSallerid(1);
/*        String name = item.getFieldName();  
        String value = item.getString();          
        pw.println(name + " : " + value + "\r\n"); */ 
    }  
      
    // 处理上传的文件  
    private void processUploadFile(FileItem item, PrintWriter pw)  
        throws Exception  
    {  
        // 此时的文件名包含了完整的路径，得注意加工一下  
        String filename = item.getName();         
        System.out.println("完整的文件名：" + filename);  
        int index = filename.lastIndexOf("\\");  
        filename = filename.substring(index + 1, filename.length());  
        String[] temp=filename.split("\\.");
        filename=p.getName()+"."+temp[1];
        p.setImage(filename);
        long fileSize = item.getSize();  
 
        if("".equals(filename) && fileSize == 0)  
        {             
            System.out.println("文件名为空 ...");  
            return;  
        }  
 
        File uploadFile = new File(filePath + "/" + filename);  
        item.write(uploadFile);  
        pw.println(filename + " 文件保存完毕 ...");  
        pw.println("文件大小为 ：" + fileSize + "\r\n"); 
        
        
    }  
      
    // doGet  
    public void doGet(HttpServletRequest req, HttpServletResponse res)  
        throws IOException, ServletException  
    {  
        doPost(req, res);  
    }  
} 

