package com.bst.ticket.service;

import java.util.List;
import java.util.Map;


public interface NoticeService {

public List<Map<String, Object>> noticeListINFO(Map<String, Object> pmap)throws Exception;

public  Map<String,Object> getNoticeDetail(int ntc_id) throws Exception;

public int noticeDelete(Integer ntc_id);

public List<Map<String, Object>> noticeAdmin(Map<String,Object>aMap);

public int noticeInsert(Map<String, Object> aMap);

} 
