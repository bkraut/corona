package com.alcyone.corona.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.lang.NonNull;

@Entity
@Table(name = "account_statuses")
@EntityListeners(AuditingEntityListener.class)
public class AccountStatus {
	
	@Id
    @GeneratedValue(generator = "uuid2")
    @GenericGenerator(name = "uuid2", strategy = "org.hibernate.id.UUIDGenerator")
    @Column(name = "uuid", columnDefinition = "CHAR(36)", nullable=false)
	private String uuid;
	
	@NonNull
	@Column(name = "status", length=20, nullable=false)
	private String status;
	
	@NonNull
	@Column(name = "update_date", nullable=false)
	private Date updateDate;
	
	@NonNull
	@Column(name = "creation_date", nullable=false)
	private Date creationDate;
}
