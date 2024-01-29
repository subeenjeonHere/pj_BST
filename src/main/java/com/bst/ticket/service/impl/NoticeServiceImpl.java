package com.bst.ticket.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bst.ticket.dao.NoticeDao;
import com.bst.ticket.service.NoticeService;

@Service
public class NoticeServiceImpl implements NoticeService {
    Logger logger = LoggerFactory.getLogger("NoticeServiceImpl".getClass());

    @Autowired
    private NoticeDao noticeDao;

    @Override
    public List<Map<String, Object>> noticeListINFO(Map<String, Object> pmap) throws Exception {
        List<Map<String, Object>> list = new ArrayList<>();
        logger.info("Service Detail");
        list = noticeDao.noticeListINFO(pmap);
        logger.info(list.toString());
        return list;
    }

    @Override
    public Map<String,Object> getNoticeDetail(int ntc_id) throws Exception {
        logger.info("getNoticeDetail : " + ntc_id);
        Map<String, Object> rMap = null;
        rMap = noticeDao.getNoticeDetail(ntc_id);
        return rMap;
    }

        @Override
        public List<Map<String, Object>> noticeAdmin(Map<String,Object>aMap) {
        List<Map<String, Object>> list = new ArrayList<>();
        list=noticeDao.noticeAdmin(aMap);
        return list;
        }

    @Override
    public int noticeDelete(Integer ntc_id) {
        int result=0;
        result=noticeDao.noticeDelete(ntc_id);
        return result;
    }

    @Override
    public int noticeInsert(Map<String, Object> aMap) {
        int result=0;
        result=noticeDao.noticeInsert(aMap);
        return result;
    }
    
}

