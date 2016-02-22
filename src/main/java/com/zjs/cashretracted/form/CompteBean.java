package com.zjs.cashretracted.form;

import java.io.Serializable;
import java.util.List;
import com.zjs.cashretracted.model.Compte;


public class CompteBean implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private Compte selected ;
	private List<Compte> comptes;

	public Compte getSelected() {
		return selected;
	}

	public void setSelected(Compte selected) {
		this.selected = selected;
	}

	public List<Compte> getComptes() {
		return comptes;
	}

	public void setComptes(List<Compte> comptes) {
		this.comptes = comptes;
	}
	public Compte getCompteById(Integer rib)
	{		
		for(Compte c : comptes)
			if(c.getRib().equals(rib)) return c ;
		
		return null;
	}
}
