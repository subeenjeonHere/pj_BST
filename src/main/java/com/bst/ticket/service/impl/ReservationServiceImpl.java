package com.bst.ticket.service.impl;

import java.util.List;
import java.util.Map;

import com.bst.ticket.vo.ReservationVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bst.ticket.dao.ReservationDao;
import com.bst.ticket.service.ReservationService;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ReservationServiceImpl implements ReservationService{
  Logger logger = LoggerFactory.getLogger(ReservationServiceImpl.class);

  @Autowired
  private ReservationDao reservationDao;

  @Override
  public List<Map<String, Object>> reserveList(Map<String, Object> mmap) throws Exception {
    logger.info("Service : reserveList 호출");

    return reservationDao.reserveList(mmap);
  }

  @Override
  @Transactional(isolation = Isolation.READ_COMMITTED)
  public int ticketReservation(ReservationVO reservationVO) throws Exception {
    logger.info("Service : reserveList 호출");
    int result = 0;
    reservationVO.setAddOne(true);
    result = reservationDao.ticketReservation(reservationVO);
    result = reservationDao.gameReserveUpdate(reservationVO);
    return result;
  }

  @Override
  @Transactional(isolation = Isolation.READ_COMMITTED)
  public int reservationDelete(ReservationVO reservationVO) throws Exception {
    logger.info("Service : reservationDelete 호출");
    int result = 0;
    reservationVO.setAddOne(false);
    result = reservationDao.reservationDelete(reservationVO);
    result = reservationDao.gameReserveUpdate(reservationVO);
    return result;
  }
}
