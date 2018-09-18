package cn.iankeri.hotel.actions;

import java.math.BigDecimal;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import cn.iankeri.hotel.entities.Record;
import cn.iankeri.hotel.entities.Room;
import cn.iankeri.hotel.services.OrderService;
import cn.iankeri.hotel.services.RoomService;
import cn.iankeri.hotel.services.RoomTypeService;
import cn.iankeri.hotel.services.UserService;
import cn.iankeri.hotel.utils.DateUtils;
import cn.iankeri.hotel.web.CriteriaOrder;
import cn.iankeri.hotel.web.Page;

public class OrderAction extends ActionSupport implements ServletRequestAware,
ModelDriven<Record>,Preparable{

	//Service 层
	@Autowired
	private UserService userService;
	
	@Autowired
	private RoomService roomService;
	
	@Autowired
	private RoomTypeService roomTypeService;
	
	@Autowired
	private OrderService orderService;
	
	private Record model;
	
	public void setModel(Record model) {
		this.model = model;
	}
	
	// web资源
	private HttpServletRequest request;
	
	//分页
	private Integer pageNo;
	
	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
	
	//客户到店开房
	public String bookNow() {
		try {
			orderService.bookNow(model);
			
			request.setAttribute("record", orderService.getRecord4BackShow(model.getUser().getId()));
			
			request.setAttribute("totalPrice", orderService.getTotalPrice(model));
			//作为success.jsp页面显示具体信息的参考
			request.setAttribute("type", "bookNow");
			//插入记录后回显
			request.setAttribute("msg", "入住成功");
		} catch (Exception e) {
			request.setAttribute("msg", "订购失败");
			e.printStackTrace();
		}
		return "bookNow";
	}
	
	public void prepareBookNow() {
		model = new Record();
	}
	
	//退房前退房页面的信息检查 AJAX
	private String returnData;
	
	public String getReturnData() {
		return returnData;
	}
	
	public void setReturnData(String returnData) {
		this.returnData = returnData;
	}
	
	private Integer id;
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	//退房时的信息显示
	public String getCheckOutRecord() {
		try {
			//System.out.println("userId:" + id);
			Record record = orderService.getUserRecording(id);
			//System.out.println("record:" + record);
			request.setAttribute("type", "checkOut");
			returnData = orderService.getCheckOutJson(id, record.getRoom().getId());
			//System.out.println(returnData);
		} catch (Exception e) {
			e.printStackTrace();
			returnData = "0";
		}
		return "ajax-success";
	}
	
	public String getCheckOutPage() {
		
		return "checkOutPage";
	}
	
	//用户退房
	public String checkOut() {
		try {
			//System.out.println("model" + model);
			orderService.checkOut(model);
				
			request.setAttribute("record", orderService.getRecord4BackShow(model.getUser().getId()));
			request.setAttribute("totalPrice", orderService.getTotalPrice(model));
			request.setAttribute("msg", "退房成功");
			request.setAttribute("type", "checkOut");
		} catch (Exception e) {
			request.setAttribute("msg", "退房失败");
			e.printStackTrace();
		}
		return "checkOut";
	}
	
	
	public void prepareCheckOut() {
		model = orderService.getRecord4BackShow(id);
	}
	
	//获取预定登记页面
	public String getRegisterPage() {
		return "registerPage";
	}
	
	//获取指定用户的预定记录
	public String getRegisterRecord() {
		try {
			//System.out.println("userId" + id);
			Record record = orderService.getPreBookRecord(id);
			//System.out.println(record);
			
			//System.out.println(record.getDepartureTime());
			returnData = orderService.getRedisterJson(id, record.getRoom().getId(),record);
			//System.out.println("register:" + returnData);
		} catch (Exception e) {
			e.printStackTrace();
			returnData = "0";
		}
		
		return "ajax-success";
	}
	
	//用户预定入住时登记
	public String checkIn() {
		try {
			orderService.checkIn(model);
			//System.out.println("modelInCheckIn:" + model);
			request.setAttribute("record", orderService.getRecord4BackShow(model.getUser().getId()));
			request.setAttribute("totalPrice", orderService.getTotalPrice(model));
			request.setAttribute("msg", "登记成功");
			request.setAttribute("type", "checkIn");
		} catch (Exception e) {
			request.setAttribute("msg", "退房失败");
			e.printStackTrace();
		}
		return "checkIn";
	}
	
	public void prepareCheckIn() {
		model = orderService.getPreBookRecord(id);
	}
	
	public String getRoomOrder() {
//		System.out.println("model.roomId" + model.getRoom().getId());
		request.setAttribute("room", roomService.getRoom(model.getRoom().getId()));
		if(request.getAttribute("type") != null && request.getAttribute("type").equals("ini"))
			pageNo = 1;
		if(pageNo == null)
			pageNo = 1;
		CriteriaOrder co = new CriteriaOrder(model, pageNo);
		Page<Record> page = orderService.getRoomOrderPage(co);
//		System.out.println(page.getList());
		request.setAttribute("consumes", orderService.getRoomOrderConsume(model.getRoom().getId()));
		request.setAttribute("roomOrderPage", page);
		return "roomOrder";
	}
	public void prepareGetRoomOrder() {
		model = new Record();
	}
	
	public String getRecords() {
		if(pageNo == null)
			pageNo = 1;
		CriteriaOrder co = new CriteriaOrder(model, pageNo);
		Page<Record> page = orderService.getRoomOrderPage(co);
		request.setAttribute("consumes", orderService.getEveryOrdersConsume());
		request.setAttribute("orderPage", page);
		return "records";
	}
	
	public void prepareGetRecords() {
		model = new Record();
	}
	
	public String getRenewPage() {
		return "renewPage";
	}
	
	public String renew() {
		orderService.renew(model);
		request.setAttribute("record", orderService.getRecord4BackShow(model.getUser().getId()));
		request.setAttribute("totalPrice", orderService.getTotalPrice(model));
		request.setAttribute("msg", "续订成功");
		request.setAttribute("type", "bookNow");
		return "renew";
	}
	
	public void prepareRenew() {
		model = orderService.getPreBookRecord(id);
	}
	
	public String getOverdues() {
		if(pageNo == null)
			pageNo = 1;
		
		CriteriaOrder co = new CriteriaOrder(model, pageNo);
		co.setIsOverdue(true);
		
		Page<Record> page = orderService.getRoomOrderPage(co);
		request.setAttribute("consumes", orderService.getEveryOrdersConsume());
		request.setAttribute("orderPage", page);
		return "overdues";
	}
	
	public void prepareGetOverdues() {
		model = new Record();
	}
	
	@Override
	public void prepare() throws Exception {}

	@Override
	public Record getModel() {
		return model;
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;
	}
}
