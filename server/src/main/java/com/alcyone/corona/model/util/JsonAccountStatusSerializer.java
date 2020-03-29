package com.alcyone.corona.model.util;

import java.io.IOException;

import com.alcyone.corona.model.AccountStatus;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;

public class JsonAccountStatusSerializer extends JsonSerializer<AccountStatus> {
	
	@Override
	public void serialize(AccountStatus status, JsonGenerator generator, SerializerProvider arg2) throws IOException, JsonProcessingException {
		generator.writeString(status.getUuid());
	}
}
