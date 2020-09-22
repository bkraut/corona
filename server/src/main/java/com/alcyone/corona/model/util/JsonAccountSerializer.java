package com.alcyone.corona.model.util;

import java.io.IOException;

import com.alcyone.corona.model.Account;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;

public class JsonAccountSerializer extends JsonSerializer<Account> {
	
	@Override
	public void serialize(Account account, JsonGenerator generator, SerializerProvider arg2) throws IOException, JsonProcessingException {
		generator.writeString(account.getUuid());
	}
}
