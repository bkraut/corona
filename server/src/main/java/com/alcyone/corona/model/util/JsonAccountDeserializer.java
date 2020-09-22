package com.alcyone.corona.model.util;

import java.io.IOException;

import com.alcyone.corona.model.Account;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.BeanProperty;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.deser.ContextualDeserializer;

public class JsonAccountDeserializer extends JsonDeserializer<Account> implements ContextualDeserializer {

	@Override
	public Account deserialize(JsonParser parser, DeserializationContext arg1) throws IOException, JsonProcessingException {
		String uuid = parser.getText();
		Account account= new Account();
		account.setUuid(uuid);
		return account;
	}

	@Override
	public JsonDeserializer<?> createContextual(DeserializationContext ctxt, BeanProperty property)
			throws JsonMappingException {
		// TODO Auto-generated method stub
		return new JsonAccountDeserializer();
	}
	
}
