package com.bst.ticket.dao.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bst.ticket.dao.NoticeDao;

@Repository
public class NoticeDaoImpl implements NoticeDao {

    
    Logger logger = LoggerFactory.getLogger(NoticeDaoImpl.class);

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    @Override //noticeINFOSelect DAO부분설게
    public List<Map<String, Object>> noticeListINFO(Map<String, Object> pmap) {
        List<Map<String, Object>> list = sqlSessionTemplate.selectList("noticeListINFO", pmap);
        return list;
    }

    @Override//noticeDelete DAO부분설게
    public Map<String, Object> getNoticeDetail(int ntc_id)  {
        Map<String, Object> rMap = sqlSessionTemplate.selectOne("noticeListContent", ntc_id);
        logger.info(rMap.toString());
        return rMap;
    }

    @Override
    public int noticeDelete(Integer ntc_id) {
        int result=0;
        result=sqlSessionTemplate.delete("deleteNotice", ntc_id);
        return result;
    }

    @Override   //admin Delete DAO부분설게
    public List<Map<String, Object>> noticeAdmin(Map<String,Object>aMap) {
        List<Map<String, Object>> list =sqlSessionTemplate.selectList("noticeListINFO", aMap);
        return list;
    }
    
    @Override  //admin insert dao 부분 설게
    public int noticeInsert(Map<String, Object> aMap) {
        int result=0;
        result=sqlSessionTemplate.insert("insertNotice",aMap);
        return result;
    }

}
