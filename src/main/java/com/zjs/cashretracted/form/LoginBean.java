package com.zjs.cashretracted.form;

import java.util.List;

import com.zjs.cashretracted.model.*;

public class LoginBean {

	private User connected;
	private Compte compte;
	private List<Transaction> trans;
	private List<CashRetracted> cashes;
	private int choix =0;
	private boolean admin=false;
	
	public User getConnected() {
		return connected;
	}
	public void setConnected(User connected) {
		this.connected = connected;
		if(connected.getRole().getLibelle().equals("ROLE_ADMIN_SYSTEM") || connected.getRole().getLibelle().equals("ROLE_AGENT")) 
			admin=true;
	}
	public Compte getCompte() {
		return compte;
	}
	public void setCompte(Compte compte) {
		this.compte = compte;
	}
	public List<Transaction> getTrans() {
		return trans;
	}
	public void setTrans(List<Transaction> trans) {
		this.trans = trans;
	}
	public List<CashRetracted> getCashes() {
		return cashes;
	}
	public void setCashes(List<CashRetracted> cashes) {
		this.cashes = cashes;
	}
	public int getChoix() {
		return choix;
	}
	public void setChoix(int choix) {
		this.choix = choix;
	}
	public boolean getAdmin() {
		return admin;
	}
	public void setAdmin(boolean admin) {
		this.admin = admin;
	}
	
	
	
	
	
}
