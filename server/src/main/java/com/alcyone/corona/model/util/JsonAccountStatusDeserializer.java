package com.alcyone.corona.model.util;

import java.io.IOException;

import com.alcyone.corona.model.AccountStatus;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.BeanProperty;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.deser.ContextualDeserializer;

public class JsonAccountStatusDeserializer extends JsonDeserializer<AccountStatus> implements ContextualDeserializer {

	@Override
	public AccountStatus deserialize(JsonParser parser, DeserializationContext arg1) throws IOException, JsonProcessingException {
		//ICrudService crudService = (ICrudService) ctx.getBean("crudService");
		String uuid = parser.getText();
		AccountStatus status = new AccountStatus();
		status.setUuid(uuid);
		return status;
	}

	@Override
	public JsonDeserializer<?> createContextual(DeserializationContext ctxt, BeanProperty property)
			throws JsonMappingException {
		// TODO Auto-generated method stub
		return new JsonAccountStatusDeserializer();
	}
	
}
