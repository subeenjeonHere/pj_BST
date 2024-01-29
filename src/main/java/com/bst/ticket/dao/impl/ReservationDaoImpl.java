package com.bst.ticket.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bst.ticket.vo.ReservationVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bst.ticket.dao.ReservationDao;

@Repository
public class ReservationDaoImpl implements ReservationDao{
  Logger logger = LoggerFactory.getLogger(ReservationDaoImpl.class);

  @Autowired
  SqlSessionTemplate sqlSessionTemplate;

  @Override
  public List<Map<String, Object>> reserveList(Map<String, Object> mmap) throws Exception {
    logger.info("Ropositiry : reserveList 호출" + mmap);
    List<Map<String,Object>> memList = null;
    memList = sqlSessionTemplate.selectList("reserveList", mmap);
    logger.info(memList.toString());
    return memList;
  }

  /**********************************************************************************
   작성자 : 박병현
   작성일자 : 24.01.29
   기능 : 티켓 mbr_id 받아서 mbr_seq 조회 -> ticketInsert 진행
   **********************************************************************************/
  @Override
  public int ticketReservation(ReservationVO reservationVO) throws Exception {
    logger.info("Ropositiry : ticketReservation 호출");
    int result = 0;
    Map<String,Object> selectmbr_seq = new HashMap<>();
    selectmbr_seq.put("gm_id",reservationVO.getGm_id());
    selectmbr_seq.put("mbr_seq", sqlSessionTemplate.selectOne("mbr_seq", reservationVO));
    result = sqlSessionTemplate.insert("ticketInsert", selectmbr_seq);
    return result;
  }

  @Override
  public int gameReserveUpdate(ReservationVO reservationVO) throws Exception {
    logger.info("Ropositiry : gameReserveUpdate 호출");
    return sqlSessionTemplate.update("gameReserveUpdate", reservationVO);
  }

  @Override
  public int reservationDelete(ReservationVO reservationVO) throws Exception {
    logger.info("Ropositiry : reservationDelete 호출");
    int result = 0;
    result = sqlSessionTemplate.delete("reservationDelete", reservationVO);
    return result;
  }
}
