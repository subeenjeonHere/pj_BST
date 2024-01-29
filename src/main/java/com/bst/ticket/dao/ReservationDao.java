package com.bst.ticket.dao;

import com.bst.ticket.vo.ReservationVO;

import java.util.List;
import java.util.Map;

public interface ReservationDao {

  List<Map<String,Object>> reserveList(Map<String, Object> mmap) throws Exception;

   int ticketReservation(ReservationVO reservationVO) throws Exception;

    int gameReserveUpdate(ReservationVO reservationVO) throws Exception;

    int reservationDelete(ReservationVO reservationVO) throws  Exception;
}
