package cn.iankeri.hotel.utils;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

public class ImageUtils {
	
	public static void uploadUserImg(File headImgFile,String headImgFileFileName,
						File styleImgFile,String styleImgFileFileName) throws IOException {
		if(styleImgFile != null)
			uploadHeadImgImg(headImgFile, headImgFileFileName);
		if(headImgFile != null)
			uploadStyleImgImg(styleImgFile, styleImgFileFileName);
	}
	
	public static void uploadHeadImgImg(File headImgFile,String headImgFileFileName) throws IOException {
		String headImgRealPath = ServletActionContext.getServletContext().getRealPath("img/headImg/");
		File headImgFile_ = new File(headImgRealPath);
		FileUtils.copyFile(headImgFile, new File(headImgFile_, headImgFileFileName));
	}
	
	public static void uploadStyleImgImg(File styleImgFile,String styleImgFileFileName) throws IOException {
		String styleImgRealPath = ServletActionContext.getServletContext().getRealPath("img/styleImg/");
		File styleImgFile_ = new File(styleImgRealPath);
		FileUtils.copyFile(styleImgFile, new File(styleImgFile_, styleImgFileFileName));
	}
	
	public static void uploadAdminImg(File styleImgFile,String styleImgFileFileName) throws IOException {
		String styleImgRealPath = ServletActionContext.getServletContext().getRealPath("img/adminImg/");
		File styleImgFile_ = new File(styleImgRealPath);
		FileUtils.copyFile(styleImgFile, new File(styleImgFile_, styleImgFileFileName));
	}
}
