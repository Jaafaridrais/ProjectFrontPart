package com.zjs.cashretracted.dao;

import java.util.List;

import com.zjs.cashretracted.model.CashRetracted;
import com.zjs.cashretracted.model.Compte;

public interface CashRetractedDAO {
	
	public void persistCashRetracted(CashRetracted cashRetracted);	  
	public  CashRetracted findCashRetractedbyId(Integer id);	 
	public  CashRetracted updateCashRetracted(CashRetracted cashRetracted); 
	public  List<CashRetracted> findCashRetractedbyCompte(Compte compte);	
	public  List<CashRetracted> getAllCashes();
	public void detacherCashRetracted(CashRetracted cashRetracted);	
	public int getNumberofCashCorrected();
	public int getNumberofCashCorrectedByCompte(Compte compte);
}
