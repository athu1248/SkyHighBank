package model;

import java.sql.Date;

public class Transaction {
	private String transactionID;
	private Date datetime;
	private String payerAccNo;
	private String payeeAccNo;
	private float amount;
	private float payerBalance;
	private float payeeBalance;
	private String type;
	private String comments;
	private boolean isPayer;
	
	
	public String getTransactionID() {
		return transactionID;
	}
	public void setTransactionID(String transactionID) {
		this.transactionID = transactionID;
	}
	
	
	public Date getDatetime() {
		return datetime;
	}
	public void setDatetime(Date date) {
		this.datetime = date;
	}
	
	
	public String getPayerAccNo() {
		return payerAccNo;
	}
	public void setPayerAccNo(String payerAccNo) {
		this.payerAccNo = payerAccNo;
	}
	
	
	public String getPayeeAccNo() {
		return payeeAccNo;
	}
	public void setPayeeAccNo(String payeeAccNo) {
		this.payeeAccNo = payeeAccNo;
	}
	
	
	public float getAmount() {
		return amount;
	}
	public void setAmount(float amount) {
		this.amount = amount;
	}
	
	
	public float getPayerBalance() {
		return payerBalance;
	}
	public void setPayerBalance(float payerBalance) {
		this.payerBalance = payerBalance;
	}
	
	
	public float getPayeeBalance() {
		return payeeBalance;
	}
	public void setPayeeBalance(float payeeBalance) {
		this.payeeBalance = payeeBalance;
	}
	
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	
	
	public boolean isPayer() {
		return isPayer;
	}
	public void setPayer(boolean isPayer) {
		this.isPayer = isPayer;
	}

}
