package com.zjs.cashretracted.form;

import java.io.Serializable;
import java.util.List;

import com.zjs.cashretracted.model.Transaction;

public class TransactionBean implements Serializable {

	private static final long serialVersionUID = 1L;

	private Transaction selected;
	private List<Transaction> transactions ;
	
	public Transaction getSelected() {
		return selected;
	}
	public void setSelected(Transaction selected) {
		this.selected = selected;
	}
	public List<Transaction> getTransactions() {
		return transactions;
	}
	public void setTransactions(List<Transaction> transactions) {
		this.transactions = transactions;
	}
	
	
	
}
