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

import org.hibernate.annotations.GenericGenerator;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.lang.NonNull;

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
	@Column(name = "device_id", length=20, nullable=false)
	private String deviceId;
	
	@NonNull
	@Column(name = "birth_year", length=11, nullable=false)
	private Integer birthYear;
	
	@NonNull
	@ManyToOne
    @JoinColumn(name="status_id", nullable=false)
    private AccountStatus status;
	
	@OneToMany(mappedBy="account")
    private List<AccountTrack> tracks;
	
	@NonNull
	@Column(name = "update_date", nullable=false)
	private Date updateDate;
	
	@NonNull
	@Column(name = "creation_date", nullable=false)
	private Date creationDate;
	
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public String getDeviceId() {
		return deviceId;
	}
	public void setDeviceId(String deviceId) {
		this.deviceId = deviceId;
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
	public List<AccountTrack> getTracks() {
		return tracks;
	}
	public void setTracks(List<AccountTrack> tracks) {
		this.tracks = tracks;
	}
	public AccountStatus getStatus() {
		return status;
	}
	public void setStatus(AccountStatus status) {
		this.status = status;
	}
	
	
	
}
