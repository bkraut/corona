package com.alcyone.corona.model.util;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;

import com.alcyone.corona.model.AccountStatus;
import com.alcyone.corona.service.AccountStatusService;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.BeanProperty;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.deser.ContextualDeserializer;

public class JsonAccountStatusDeserializer extends JsonDeserializer<AccountStatus> implements ContextualDeserializer {

	@Autowired
	private AccountStatusService service;
	
	@Override
	public AccountStatus deserialize(JsonParser parser, DeserializationContext arg1) throws IOException, JsonProcessingException {
		String uuid = parser.getText();
		if ("".equals(uuid)) return null;
		return service.getById(uuid).get();
	}

	@Override
	public JsonDeserializer<?> createContextual(DeserializationContext ctxt, BeanProperty property)
			throws JsonMappingException {
		// TODO Auto-generated method stub
		return null;
	}
	
}
