package com.alcyone.corona.model;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.GenericGenerator;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.lang.NonNull;

import com.alcyone.corona.model.util.JsonAccountStatusDeserializer;
import com.alcyone.corona.model.util.JsonAccountStatusSerializer;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

@Entity
@Table(name = "accounts")
@EntityListeners(AuditingEntityListener.class)
public class Account {
	
	@Id
    @GeneratedValue(generator = "uuid2")
    @GenericGenerator(name = "uuid2", strategy = "org.hibernate.id.UUIDGenerator")
    @Column(name = "uuid", columnDefinition = "CHAR(36)", nullable=false)
	private String uuid;
	
	@NonNull
	@NotEmpty(message = "Uporabniško ime je obvezno")
	@Column(name = "username", length=20, nullable=false)
	private String username;
	
	@NonNull
	@NotNull(message = "Letnica rojstva je obvezna")
	@Column(name = "birth_year", length=11, nullable=false)
	private Integer birthYear;
	
	@ManyToOne
	@JoinColumn(name="status_id", nullable=false)
    private AccountStatus status;
	
	@OneToMany(mappedBy="account")
    private List<AccountLocation> tracks;
	
	@Column(name = "update_date", nullable=false)
	private Date updateDate;
	
	@Column(name = "creation_date", nullable=false)
	private Date creationDate;
	
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Integer getBirthYear() {
		return birthYear;
	}
	public void setBirthYear(Integer birthYear) {
		this.birthYear = birthYear;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public Date getCreationDate() {
		return creationDate;
	}
	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}
	public List<AccountLocation> getTracks() {
		return tracks;
	}
	public void setTracks(List<AccountLocation> tracks) {
		this.tracks = tracks;
	}
	@JsonSerialize(using = JsonAccountStatusSerializer.class)
	public AccountStatus getStatus() {
		return status;
	}
	@JsonDeserialize(using = JsonAccountStatusDeserializer.class) 
	public void setStatus(AccountStatus status) {
		this.status = status;
	}
	
}
