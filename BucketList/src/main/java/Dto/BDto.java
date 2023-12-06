package Dto;

import java.sql.Timestamp;

public class BDto {
	private int bId;
	private String bmId;
	private String bTitle;
	private String bContent;
	private Timestamp bDate;
	private String bOpen;
	private int bHit;
	
	public BDto() {
		
	}
	public BDto(int bId, String bmId, String bTitle, String bContent, Timestamp bDate, String bOpen, int bHit) {
		this.bId = bId;
		this.bmId = bmId;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bDate = bDate;
		this.bOpen = bOpen;
		this.bHit = bHit;
	}
	
	public int getbId() {
		return bId;
	}
	public void setbId(int bId) {
		this.bId = bId;
	}
	public String getbmId() {
		return bmId;
	}
	public void setbmId(String bmId) {
		this.bmId = bmId;
	}
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public String getbContent() {
		return bContent;
	}
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	public Timestamp getbDate() {
		return bDate;
	}
	public void setbDate(Timestamp bDate) {
		this.bDate = bDate;
	}
	public String getbOpen() {
		return bOpen;
	}
	public void setbOpen(String bOpen) {
		this.bOpen = bOpen;
	}
	public int getbHit() {
		return bHit;
	}
	public void setbHit(int bHit) {
		this.bHit = bHit;
	}
}
