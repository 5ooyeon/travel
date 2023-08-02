package com.ja.travel.couponMessage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ja.travel.couponMessage.service.CouponMessageService;
import com.ja.travel.dto.CouponDto;
import com.ja.travel.dto.MessageDto;
import com.ja.travel.dto.UserDto;
import org.springframework.web.bind.annotation.*;

@RestController
public class RestCouponMessageController {
	
	
	@Autowired
	private CouponMessageService couponMessageService;
	
		
	//쿠폰받기버튼 눌러서 쿠폰받기
	@RequestMapping("/getCoupon")
	public Map<String, Object> getCoupon(HttpSession session, @RequestParam("couponId") Integer couponId) {
		
		Map<String, Object> map = new HashMap<>();
		UserDto sessionUser = (UserDto) session.getAttribute("sessionuser");
		int userId = sessionUser.getUser_id();
		System.out.println(userId);
		couponMessageService.insertUserCoupon2(couponId, userId);
		
		map.put("result", "success");
		
		
		return map;
	}
	
	@RequestMapping("/hasCoupon")
	public Map<String, Object> hasCoupon(HttpSession session, @RequestParam("couponId") Integer couponId) {
		System.out.println(couponId);
		Map<String, Object> map = new HashMap<>();
		UserDto sessionUser = (UserDto) session.getAttribute("sessionuser");
		int userId = sessionUser.getUser_id();
		
		map.put("hasCoupon", couponMessageService.hasCoupon(userId, couponId));
		map.put("isExpired", couponMessageService.isExpired(couponId));
		map.put("isExhausted", couponMessageService.isExhausted(couponId));
		return map;
	}
	
	// 받은메시지 리스트 띄우기
	@RequestMapping("/reloadMessageGet")
	public Map<String, Object> reloadMessageGet(HttpSession session){
		Map<String, Object> map = new HashMap<>();
		
		UserDto sessionUser = (UserDto) session.getAttribute("sessionuser");
		int userId = sessionUser.getUser_id();
		
		List<Map<String, Object>> messageGetList = couponMessageService.getMessageGotById(userId);
		
		map.put("userId", userId);
		map.put("result", "success");
		map.put("messageGetList", messageGetList);
		return map;
	}
	
	// 보낸메시지 리스트 띄우기
	@RequestMapping("/reloadMessageSend")
	public Map<String, Object> reloadMessageSend(HttpSession session){
		Map<String, Object> map = new HashMap<>();
		
		UserDto sessionUser = (UserDto) session.getAttribute("sessionuser");
		int userId = sessionUser.getUser_id();
		
		List<MessageDto> messageSendList = couponMessageService.getMessageSendById(userId);
		
		map.put("result", "success");
		map.put("messageSendList", messageSendList);
		return map;
	}
	
	//받은 메시지 읽으면 읽은날자 필드 업데이트
	@RequestMapping("/refreshMessageRead")
	public Map<String, Object> refreshMessageRead(@RequestParam("messageId") Integer messageId){
		Map<String, Object> map = new HashMap<>();
		System.out.println(messageId);
		couponMessageService.changeMessageReadStatus(messageId);
		map.put("result", "success");
		return map;		
	}
	
	//보낸 메시지 휴지통으로 이동
	@RequestMapping("/deleteMessageGet")
	public Map<String, Object> deleteMessageGet(@RequestParam("messageId") Integer messageId) {
		Map<String, Object> map = new HashMap<>();
		
		couponMessageService.moveMessageGetToTrashCan(messageId);
		map.put("result", "success");
		return map;
	}
	
	//받은 메시지 휴지통으로 이동
	@RequestMapping("/deleteMessageSend")
	public Map<String, Object> deleteMessageSend(@RequestParam("messageId") Integer messageId) {
		Map<String, Object> map = new HashMap<>();
		
		couponMessageService.moveMessageSendToTrashCan(messageId);
		
		map.put("result", "success");
		return map;
	}
	
	// 휴지통 리스트 띄우기
	@RequestMapping("/reloadTrash")
	public Map<String, Object> reloadTrash(HttpSession session) {
		Map<String, Object> map = new HashMap<>();
		
		UserDto sessionUser = (UserDto) session.getAttribute("sessionuser");
		int userId = sessionUser.getUser_id();
		
		List<Map<String, Object>> list = couponMessageService.getMessageInTrash(userId);
		
		
		map.put("result", "success");
		map.put("list", list);
		map.put("userId", userId);
		return map;
	}
	
	@RequestMapping("/deleteMessageInTrash")
	public Map<String, Object> deleteMessageInTrash(HttpSession session ,@RequestParam("messageId") Integer messageId) {
		Map<String, Object> map = new HashMap<>();
		
		
		UserDto sessionUser = (UserDto) session.getAttribute("sessionuser");
		int userId = sessionUser.getUser_id();
		couponMessageService.deleteMessageInTrash(userId, messageId);
		
		map.put("result", "success");
		return map;
	}
	
	@RequestMapping("/reloadStorage")
	public Map<String, Object> reloadStorage(HttpSession session) {

		Map<String, Object> map = new HashMap<>();
		
		UserDto sessionUser = (UserDto) session.getAttribute("sessionuser");
		int userId = sessionUser.getUser_id();
		
		List<Map<String, Object>> list = couponMessageService.getMessageInStorage(userId);
		
		
		map.put("result", "success");
		map.put("list", list);
		map.put("userId", userId);
		return map;
	}
	
	@RequestMapping("/toggleStar")
	public Map<String, Object> toggleStar(HttpSession session ,@RequestParam("messageId") Integer messageId) {
		
		Map<String, Object> map = new HashMap<>();
		
		UserDto sessionUser = (UserDto) session.getAttribute("sessionuser");
		int userId = sessionUser.getUser_id();
		
		couponMessageService.updateStar(userId , messageId);
		
		map.put("result", "success");
		
		return map;
	}
	
	@RequestMapping("/refreshStar")
	public Map<String, Object> refreshStar(HttpSession session ,@RequestParam("messageId") int messageId){
		
		Map<String, Object> map = new HashMap<>();
		
		UserDto sessionUser = (UserDto) session.getAttribute("sessionuser");
		int userId = sessionUser.getUser_id();
		System.out.println(userId);
		map.put("result", "success");
		map.put("isStored", couponMessageService.isStored(userId ,messageId));
		
		return map;
	}
	
	@RequestMapping("/deleteMessagesGet")
	public Map<String, Object> deleteMessagesGet(@RequestParam("selectedMessageIds") String[] selectedMessageIds){
		
		Map<String, Object> map = new HashMap<>();
		System.out.println("dd");
		System.out.println(selectedMessageIds);
		
		for (String messageId : selectedMessageIds) {
			// 문자열로 된 messageId를 int값으로 변환합니다.
	        int messageIdInt = Integer.parseInt(messageId);
	        // messageId를 이용하여 휴지통으로 이동하는 로직을 적용합니다.
	        couponMessageService.moveMessageGetToTrashCan(messageIdInt);
	    }		map.put("result", "success");
		return map;
	}
	
	@RequestMapping("/deleteMessagesSend")
	public Map<String, Object> deleteMessagesSend(@RequestParam("selectedMessageIds") String[] selectedMessageIds){
		
		Map<String, Object> map = new HashMap<>();
		System.out.println("dd");
		System.out.println(selectedMessageIds);
		
		for (String messageId : selectedMessageIds) {
			// 문자열로 된 messageId를 int값으로 변환합니다.
	        int messageIdInt = Integer.parseInt(messageId);
	        // messageId를 이용하여 휴지통으로 이동하는 로직을 적용합니다.
	        couponMessageService.moveMessageSendToTrashCan(messageIdInt);
	    }		map.put("result", "success");
		return map;
	}
	
	@RequestMapping("/restoreMessageInTrash")
	public Map<String, Object> restoreMessageInTrash(HttpSession session ,@RequestParam("messageId") Integer messageId) {
		
		Map<String, Object> map = new HashMap<>();
		
		UserDto sessionUser = (UserDto) session.getAttribute("sessionuser");
		int userId = sessionUser.getUser_id();
		
		couponMessageService.restoreMessageInTrash(userId, messageId);
		
		map.put("result", "success");
		return map;
		
	}
	
	@RequestMapping("getUnreadMessageCount")
	public Map<String, Object> getUnreadMessageCount(HttpSession session) {
	
		Map<String, Object> map = new HashMap<>();
		
		UserDto sessionUser = (UserDto) session.getAttribute("sessionuser");
		int userId = sessionUser.getUser_id();
		
		int count = couponMessageService.getUnreadMessageCount(userId);
		
		map.put("result", "success");
		map.put("count", count);
		return map;
		
	}
	
}
