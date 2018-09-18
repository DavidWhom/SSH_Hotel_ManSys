package cn.iankeri.hotel.actions;


import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import cn.iankeri.hotel.entities.Room;
import cn.iankeri.hotel.entities.RoomType;
import cn.iankeri.hotel.services.RoomService;
import cn.iankeri.hotel.services.RoomTypeService;
import cn.iankeri.hotel.web.CriteriaRoom;
import cn.iankeri.hotel.web.Page;

public class RoomAction extends ActionSupport implements ServletRequestAware,
ModelDriven<Room>,Preparable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private HttpServletRequest request;
	
	@Autowired
	private RoomService roomService;
	
	@Autowired
	private RoomTypeService roomTypeService;
	
	private Integer pageNo;
	
	//ֵջջ������
	private Room model;
	
	public void setModel(Room model) {
		this.model = model;
	}
	
	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
	
	public String getRooms() {
		if(pageNo == null)
			pageNo = 1;
//		System.out.println("id:" + request.getAttribute("id"));
//		System.out.println("mode:" + model);
		CriteriaRoom cr = new CriteriaRoom(model, pageNo);
		Page<Room> page = roomService.getRoomPage(cr);
//		System.out.println(Arrays.asList(page.getList()));
//		System.out.println("������" + page.getTotalPageNumber());
		request.setAttribute("roomPage", page);
		return "getRooms";
	}
	
	public void prepareGetRooms() {
		model = new Room();
	}
	
	public String getAddRoomPage() {
		//��ʾ�¸�����id
		request.setAttribute("id", roomService.getNextValidRoomId());
		//�ͷ�����
		request.setAttribute("roomTypes", roomService.getRoomTypes());
		return "addRoomPage";
	}
	
	public String addRoom() {
		model.setStates(0);
//		RoomType rt = roomTypeService.getRoomType(model.getRoomType().getId());
//		model.setRoomType(rt);
		System.out.println(model);
		try {
			roomService.saveOrUpdate(model);
			//��ʾ�¸�����id
			request.setAttribute("id", roomService.getNextValidRoomId());
			//�ͷ�����
			request.setAttribute("roomTypes", roomService.getRoomTypes());
			//��ʾ������Ϣ
			request.setAttribute("msg", "�¿ͷ���Ϣ " + model.getRoomName() + " ��ӳɹ�!");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "�¿ͷ���Ϣ " + model.getRoomName() + " ���ʧ��!");
		}
		return "addRoom";
	}
	
	public void prepareAddRoom() {
		model = new Room();
	}
	
	@Override
	public void prepare() throws Exception {}

	@Override
	public Room getModel() {
		return model;
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;
	}

}
