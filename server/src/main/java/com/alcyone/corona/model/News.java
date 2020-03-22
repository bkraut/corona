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
@Table(name = "news")
@EntityListeners(AuditingEntityListener.class)
public class News {

	@Id
    @GeneratedValue(generator = "uuid2")
    @GenericGenerator(name = "uuid2", strategy = "org.hibernate.id.UUIDGenerator")
    @Column(name = "uuid", columnDefinition = "CHAR(36)", nullable=false)
	private String uuid;
	
	@NonNull
	@Column(name = "date", nullable=false)
	private Date date;
	
	@NonNull
	@Column(name = "title", columnDefinition = "TEXT", nullable=false)
	private String title;
	
	@NonNull
	@Column(name = "subtitle", columnDefinition = "TEXT", nullable=false)
	private String subtitle;
	
	@NonNull
	@Column(name = "content", columnDefinition = "TEXT", nullable=false)
	private String content;
	
	@NonNull
	@Column(name = "author", columnDefinition = "VARCHAR(200)")
	private String author;
	
	@NonNull
	@Column(name = "url", columnDefinition = "TEXT")
	private String url;
	
	@NonNull
	@Column(name = "thumbnailUrl", columnDefinition = "TEXT")
	private String thumbnailUrl;
	
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSubtitle() {
		return subtitle;
	}

	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getThumbnailUrl() {
		return thumbnailUrl;
	}

	public void setThumbnailUrl(String thumbnailUrl) {
		this.thumbnailUrl = thumbnailUrl;
	}
	
}
