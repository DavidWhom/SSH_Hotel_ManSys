package cn.iankeri.hotel.services;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.iankeri.hotel.dao.RoomTypeDao;
import cn.iankeri.hotel.entities.RoomType;
import cn.iankeri.hotel.web.CriteriaRoomType;
import cn.iankeri.hotel.web.Page;
import cn.iankeri.hotel.web.RoomTypeImgs4Update;

@Service
public class RoomTypeService {
	@Autowired
	private RoomTypeDao roomTypeDao;
	
	public RoomType getRoomType(Integer id) {
		return roomTypeDao.getRoomType(id);
	}
	
	public Page<RoomType> getRoomTypePage(CriteriaRoomType crt){
		return roomTypeDao.getRoomTypePage(crt);
	}
	
	public List<String> getPeoples(){
		return roomTypeDao.getPeoples();
	}
	
	public void saveOrUpdate(RoomType roomType) {
		roomTypeDao.saveOrUpdate(roomType);
	}
	
	public Map<Integer, Long> getRoomLeaves(){
		return roomTypeDao.getRoomLeaves();
	}
	
	public Map<Integer, Long> getRoomAll(){
		return roomTypeDao.getRoomAll();
	}
	
	public long getNextValidRTId() {
		return roomTypeDao.getNextValidRTId();
	}
	
	public RoomType uploadRoomTypeImage(List<File> roomTypeImages,List<String> roomTypeImagesFileName,
								RoomType model) throws IOException {
		String roomImgRealPath = ServletActionContext.getServletContext().getRealPath("img/roomImg/");
		StringBuffer sb = new StringBuffer("");
		File roomImgFile_ = new File(roomImgRealPath);
		if(roomTypeImages!=null)
			for(int i = 0; i < roomTypeImages.size(); i++) {
				sb.append(roomTypeImagesFileName.get(i));
				if(i != (roomTypeImages.size() - 1))
					sb.append(";");
				FileUtils.copyFile(roomTypeImages.get(i), new File(roomImgFile_,roomTypeImagesFileName.get(i)));			
			}
		System.out.println("sbString:" + sb.toString());
		model.setRoomImg(sb.toString());
		return model;
	}
	
	public RoomType updateRoomTypeImage(RoomTypeImgs4Update roomTypeImages,RoomType model) throws IOException {
			String roomImgRealPath = ServletActionContext.getServletContext().getRealPath("img/roomImg/");
			StringBuffer sb = new StringBuffer("");
			File roomImgFile_ = new File(roomImgRealPath);
			
			//原图片名字集合
			List<String> formerImgFileNames = new ArrayList<>();
			formerImgFileNames = Arrays.asList(model.getRoomImg().split(";"));
			
			//新图片集合
			List<File> newRoomImgFiles = new ArrayList<>();
			newRoomImgFiles.add(roomTypeImages.getRoomTypeImage1());
			newRoomImgFiles.add(roomTypeImages.getRoomTypeImage2());
			newRoomImgFiles.add(roomTypeImages.getRoomTypeImage3());
			newRoomImgFiles.add(roomTypeImages.getRoomTypeImage4());
			newRoomImgFiles.add(roomTypeImages.getRoomTypeImage5());
			
			//新图片名称集合
			List<String> newRoomImgFileNames = new ArrayList<>();
			newRoomImgFileNames.add(roomTypeImages.getRoomTypeImage1FileName());
			newRoomImgFileNames.add(roomTypeImages.getRoomTypeImage2FileName());
			newRoomImgFileNames.add(roomTypeImages.getRoomTypeImage3FileName());
			newRoomImgFileNames.add(roomTypeImages.getRoomTypeImage4FileName());
			newRoomImgFileNames.add(roomTypeImages.getRoomTypeImage5FileName());
			
			for(int i = 0; i < 5; i++) {
				if(roomTypeImages.isUpdate[i]) {//如果原图第 i 张修改则进行处理
					formerImgFileNames.set(i, newRoomImgFileNames.get(i));//将图片新名字替换旧名字
					//上传新图片
					FileUtils.copyFile(newRoomImgFiles.get(i), new File(roomImgFile_, newRoomImgFileNames.get(i) ));			
				}
			}
			
			//形成图片存储于db中的字符串
			for(int i = 0; i < 5; i++) {
				sb.append(formerImgFileNames.get(i));
				if(i != (4))
					sb.append(";");
			}
			
			System.out.println("sbString:" + sb.toString());
			model.setRoomImg(sb.toString());
			return model;
	}
	
}
