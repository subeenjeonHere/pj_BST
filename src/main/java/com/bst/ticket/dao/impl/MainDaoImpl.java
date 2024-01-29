package com.bst.ticket.dao.impl;

import com.bst.ticket.dao.MainDao;
import lombok.Data;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;
import java.util.Map;

@Repository
public class MainDaoImpl implements MainDao {
    Logger logger = LoggerFactory.getLogger(MainDaoImpl.class);

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    /*
       작성자 : 한은지
       작성일자 : 24.01.24
       기능 : 티켓리스트(DaoImpl)
    */
    @Override
    public List<Map<String, Object>> ticketList(Map<String, Object> tmap) throws Exception {
        logger.info("Dao : ticketList 호출");
        return sqlSessionTemplate.selectList("mainTicketList",tmap);
    }

    /*
       작성자 : 한은지
       작성일자 : 24.01.26
       기능 : 검색창(DaoImpl)
    */
    @Override
    public List<Map<String, Object>> searchDetail(Map<String, Object> smap) throws Exception {
        logger.info("Dao : searchDetail 호출");
        List<Map<String, Object>> smList;
        smList = sqlSessionTemplate.selectList("searchDetail",smap);
        logger.info(smList.toString());
        return smList;
    }
}