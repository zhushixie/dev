package com.kevin.controllers;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kevin.entity.Rest;
//文件上传测试
@Controller
public class FileController {
	@RequestMapping(value="/fileMana")
	public String fileMana(){
		return "fileMana";
	}
	@RequestMapping(value="/filePdfMana")
	public String filePdfMana(){
		return "filePdfMana";
	}
	@RequestMapping(value="/myTestSinFile")
	public String myTestSinFile(){
		return "myTestSinFile";
	}
	@RequestMapping(value="/myTestMulFile")
	public String myTestMulFile(){
		return "myTestMulFile";
	}
	@RequestMapping(value="/myTestEditFile")
	public String myTestEditFile(){
		return "myTestEditFile";
	}
	@RequestMapping(value="/myTestAddFile")
	public String myTestAddFile(){
		return "myTestAddFile";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("/uploadImg")
    @ResponseBody
    public Rest upload(@RequestParam("file") MultipartFile multipartFile, HttpSession session,HttpServletRequest request){
 
        if (!StringUtils.isEmpty(multipartFile) && multipartFile.getSize()>0){
            String filename = multipartFile.getOriginalFilename();
            String suffix = filename.substring(filename.lastIndexOf(".") + 1);
            if (filename.endsWith("jpg")||filename.endsWith("png")){
 
            	System.out.println(request.getContextPath());
            	String realPath ="E:/javaPro/dev/src/main/webapp"+"/img/"+new Date().getTime()+"."+suffix;
            	
                File newfile = new File(realPath);
                try {
                    multipartFile.transferTo(newfile);
                    return Rest.successRet(null);
                } catch (IOException e) {
                    e.printStackTrace();
                    return Rest.errorRet(1,"文件上传异常");
                }
            }else {
                return Rest.errorRet(2,"不支持该上传类型");
            }
        }else {
            return Rest.errorRet(3,"文件为空");
        }
    }
	@RequestMapping("/uploadPdf")
    @ResponseBody
    public Rest uploadPdf(@RequestParam("file") MultipartFile multipartFile, HttpSession session,HttpServletRequest request){
 
        if (!StringUtils.isEmpty(multipartFile) && multipartFile.getSize()>0){
            String filename = multipartFile.getOriginalFilename();
            String suffix = filename.substring(filename.lastIndexOf(".") + 1);
            if (filename.endsWith("doc")||filename.endsWith("pdf")){
 
            	System.out.println(request.getContextPath());
            	String realPath ="E:/javaPro/dev/src/main/webapp"+"/file/"+new Date().getTime()+"."+suffix;
            	
                File newfile = new File(realPath);
                try {
                    multipartFile.transferTo(newfile);
                    return Rest.successRet(null);
                } catch (IOException e) {
                    e.printStackTrace();
                    return Rest.errorRet(1,"文件上传异常");
                }
            }else {
                return Rest.errorRet(2,"不支持该上传类型");
            }
        }else {
            return Rest.errorRet(3,"文件为空");
        }
    }
}
