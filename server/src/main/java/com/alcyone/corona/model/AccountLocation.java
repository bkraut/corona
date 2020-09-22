package com.alcyone.corona.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.lang.NonNull;

import com.alcyone.corona.model.util.JsonAccountDeserializer;
import com.alcyone.corona.model.util.JsonAccountSerializer;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

@Entity
@Table(name = "account_locations")
@EntityListeners(AuditingEntityListener.class)

public class AccountLocation {
	
	@Id
    @GeneratedValue(generator = "uuid2")
    @GenericGenerator(name = "uuid2", strategy = "org.hibernate.id.UUIDGenerator")
    @Column(name = "uuid", columnDefinition = "CHAR(36)", nullable=false)
	private String uuid;
	
	@ManyToOne
    @JoinColumn(name="account_id", nullable=false)
    private Account account;
	
	@NonNull
	@Column(name = "lat", length=20, precision=16, nullable=false)
	private Double lat;
	
	@NonNull
	@Column(name = "lon", length=20, precision=16, nullable=false)
	private Double lon;
	
	@NonNull
	@Column(name = "creation_date", nullable=false)
	private Date creationDate;

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	@JsonSerialize(using = JsonAccountSerializer.class)
	public Account getAccount() {
		return account;
	}

	@JsonDeserialize(using = JsonAccountDeserializer.class)
	public void setAccount(Account account) {
		this.account = account;
	}

	public Double getLat() {
		return lat;
	}

	public void setLat(Double lat) {
		this.lat = lat;
	}

	public Double getLon() {
		return lon;
	}

	public void setLon(Double lon) {
		this.lon = lon;
	}

	public Date getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}
	
}
