package cn.iankeri.hotel.actions;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import cn.iankeri.hotel.dao.RoomTypeDao;
import cn.iankeri.hotel.entities.Room;
import cn.iankeri.hotel.entities.RoomType;
import cn.iankeri.hotel.entities.User;
import cn.iankeri.hotel.services.RoomService;
import cn.iankeri.hotel.services.RoomTypeService;
import cn.iankeri.hotel.services.UserService;
import cn.iankeri.hotel.web.CriteriaRoomType;
import cn.iankeri.hotel.web.Page;
import cn.iankeri.hotel.web.RoomTypeImgs4Update;

public class RoomTypeAction extends ActionSupport implements ServletRequestAware,
	ModelDriven<RoomType>,Preparable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Autowired
	private RoomTypeService roomTypeService;
	
	@Autowired
	private RoomService roomService;
	
	@Autowired
	private UserService userService;
	
	private HttpServletRequest request;
	
	private RoomType model;
	
	public void setModel(RoomType model) {
		this.model = model;
	}
	
	//��ҳ
	private Integer pageNo;
	
	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
	
	public String getRoomTypes() {
		if(pageNo == null)
			pageNo = 1;
		CriteriaRoomType crt = new CriteriaRoomType(model, pageNo);
		Page<RoomType> page = roomTypeService.getRoomTypePage(crt);
		request.setAttribute("peoples", roomTypeService.getPeoples());
		request.setAttribute("roomLeaves", roomTypeService.getRoomLeaves());
		request.setAttribute("roomAll", roomTypeService.getRoomAll());
		request.setAttribute("roomTypePage", page);
		return "roomTypes";
	}
	
	public void prepareGetRoomTypes() {
		model = new RoomType();
	}
	//����ת���� roomType-add.jsp
	public String getAddRoomTypePage() {
		request.setAttribute("RTNum", roomTypeService.getNextValidRTId());
		return "addRoomTypePage";
	}
	
	//ͼƬ�ϴ�
	private List<File> roomTypeImages;
	private List<String> roomTypeImagesFileName;
	private List<String> roomTypeImagesContentType;
	
	
	public List<File> getRoomTypeImages() {
		return roomTypeImages;
	}

	public void setRoomTypeImages(List<File> roomTypeImages) {
		this.roomTypeImages = roomTypeImages;
	}

	public List<String> getRoomTypeImagesFileName() {
		return roomTypeImagesFileName;
	}

	public void setRoomTypeImagesFileName(List<String> roomTypeImagesFileName) {
		this.roomTypeImagesFileName = roomTypeImagesFileName;
	}

	public List<String> getRoomTypeImagesContentType() {
		return roomTypeImagesContentType;
	}

	public void setRoomTypeImagesContentType(List<String> roomTypeImagesContentType) {
		this.roomTypeImagesContentType = roomTypeImagesContentType;
	}

	public String saveRoomType() {
		try {
//			System.out.println("�ļ�������" + roomTypeImages.size());
			//�ϴ�ͼƬ����ͼƬ���ƴ����ַ���
			model = roomTypeService.uploadRoomTypeImage(roomTypeImages, roomTypeImagesFileName, model);
			roomTypeService.saveOrUpdate(model);
			String[] imgs = new String[10];
			imgs = model.getRoomImg().split(";");
			request.setAttribute("imgs", imgs);
			request.setAttribute("msg", "�¿ͷ����� " + model.getRoomTypeName() + " ��Ϣ����ɹ���");
			return "save";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "������������ʧ�ܣ�");
		}
		
		return "saveRoomType";
	}
	
	private Integer id;
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getRoomType() {
		RoomType rt = roomTypeService.getRoomType(id);
		List<String> imgs = Arrays.asList(rt.getRoomImg().split(";"));
		request.setAttribute("imgs", imgs);
		request.setAttribute("roomType", rt);
		return "getRoomType";
	}
	public void prepareSaveRoomType() {
		model = new RoomType();
	}
	
	public String editRoomType() {
		String[] imgs = new String[10];
		imgs = model.getRoomImg().split(";");
		request.setAttribute("imgs", imgs);
		return "editPage";
	}
	
	public void prepareEditRoomType() {
		model = roomTypeService.getRoomType(id);
	}
	
	//�ֱ���һ��ͼƬ���޸�
	private RoomTypeImgs4Update roomTypeImgs4Update;

	public void setRoomTypeImgs4Update(RoomTypeImgs4Update roomTypeImgs4Update) {
		this.roomTypeImgs4Update = roomTypeImgs4Update;
	}

	public RoomTypeImgs4Update getRoomTypeImgs4Update() {
		return roomTypeImgs4Update;
	}
	
	public String save() {
		try {
			if(roomTypeImgs4Update != null)
				model = roomTypeService.updateRoomTypeImage(roomTypeImgs4Update, model);
			roomTypeService.saveOrUpdate(model);
			//�޸ĺ���ʾ��ͼƬ
			String[] imgs = new String[10];
			imgs = model.getRoomImg().split(";");
			request.setAttribute("imgs", imgs);
			request.setAttribute("msg", "���� " + model.getRoomTypeName() + " ��Ϣ�޸ĳɹ���");
		} catch (Exception e) {
			request.setAttribute("msg", "���� " + model.getRoomTypeName() + " ��Ϣ�޸�ʧ�ܣ�");
		}
		return "save";
	}
	
	public void prepareSave() {
		model = roomTypeService.getRoomType(id);
	}
	
	//��ȡָ�����͵Ŀͷ���Ϣ,����ѡ���ض��Ŀͷ�����
	public String getRTRooms() {
		if(pageNo == null)
			pageNo = 1;
		request.setAttribute("roomType", roomTypeService.getRoomType(id));
		request.setAttribute("roomPage", roomService.getRTRoomPage(id, pageNo));
		return "getRTRooms";
	}
	
	public String getBookNowPage() {
		request.setAttribute("room", roomService.getRoom(id));
		return "bookNowPage";
	}
	
	//����ҳ�������˺�ajax��ȡ�û���Ϣ
	private String returnData;
	
	public String getReturnData() {
		return returnData;
	}
	
	public void setReturnData(String returnData) {
		this.returnData = returnData;
	}
	
	public String getUser() throws UnsupportedEncodingException {
		try {
			returnData = userService.getUserJson(id);
		}catch (Exception e) {
			e.printStackTrace();
			returnData = "0";
		}
		return "ajax-success";
	}
	
	@Override
	public void prepare() throws Exception {}

	@Override
	public RoomType getModel() {
		return model;
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;
	}

	
	
}
