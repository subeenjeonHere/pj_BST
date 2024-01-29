package com.bst.ticket.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bst.ticket.dao.CommunityDao;
import com.bst.ticket.service.CommunityService;

@Service
public class CommunityServiceImpl implements CommunityService {
    Logger logger = LoggerFactory.getLogger(CommunityServiceImpl.class);

    @Autowired
    private CommunityDao communityDao;

}
