package com.bst.ticket.dao.impl;

import java.util.List;
import java.util.Map;

import com.bst.ticket.vo.MemberVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bst.ticket.dao.MemberDao;

@Repository
public class MemberDaoImpl implements MemberDao{
  Logger logger = LoggerFactory.getLogger(MemberDaoImpl.class);

  @Autowired
  SqlSessionTemplate sqlSessionTemplate;

  /*ex)
    작성자 : 홍길동
    작성일자 : 24.01.12
    기능 : 회원조회(service)
  */
  @Override
  public List<Map<String, Object>> memberList(Map<String, Object> mmap) throws Exception {
    logger.info("Repository : memberList 호출" + mmap);
    List<Map<String,Object>> memList = null;
    memList = sqlSessionTemplate.selectList("memberList",mmap);
    logger.info(memList.toString());
    return memList;
  }

  @Override
  public String checkPwd(Map<String, Object> mbrSeq) throws Exception {
    logger.info("Repository : checkPwd 호출");
    String selectPws = sqlSessionTemplate.selectOne("checkPwd",mbrSeq);
    logger.info(selectPws);
    return selectPws;
  }

  @Override
  public int memberUpdate(MemberVO memberVO) throws Exception {
    logger.info("Repository : memberUpdate 호출");
    return sqlSessionTemplate.update("memberUpdate",memberVO);
  }

  @Override
  public int memberDelete(int mbrSeq) throws Exception {
    logger.info("Repository : memberDelete 호출");
    return sqlSessionTemplate.delete("memberDelete",mbrSeq);
  }
}
