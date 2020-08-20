package com.dht.www.event.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dht.www.event.model.dao.EventDao;

@Service
public class EventServiceImpl implements EventService {
	
	@Autowired
	private EventDao eventDao;
	
}