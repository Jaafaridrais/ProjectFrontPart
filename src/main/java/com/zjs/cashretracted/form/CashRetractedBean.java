package com.zjs.cashretracted.form;

import java.io.Serializable;
import java.util.List;

import com.zjs.cashretracted.model.CashRetracted;

public class CashRetractedBean implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private CashRetracted selected ;
	private List<CashRetracted> cashes;
	private int nbrCashesCorriges;
	private int totalcasehes =0;
	public CashRetracted getSelected() {
		return selected;
	}
	public void setSelected(CashRetracted selected) {
		this.selected = selected;
	}
	public List<CashRetracted> getCashes() {
		return cashes;
	}
	public void setCashes(List<CashRetracted> cashes) {
		this.cashes = cashes;
		totalcasehes= cashes.size();
	
	}
	public int getNbrCashesCorriges() {
		return nbrCashesCorriges;
	}
	public void setNbrCashesCorriges(int nbrCashesCorriges) {
		this.nbrCashesCorriges = nbrCashesCorriges;
	}
	public int getTotalcasehes() {
		return totalcasehes;
	}
	public void setTotalcasehes(int totalcasehes) {
		this.totalcasehes = totalcasehes;
	}
	
	
	
}
