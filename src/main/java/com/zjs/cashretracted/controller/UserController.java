package com.zjs.cashretracted.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zjs.cashretracted.form.CashRetractedBean;
import com.zjs.cashretracted.form.LoginBean;
import com.zjs.cashretracted.model.Compte;
import com.zjs.cashretracted.model.User;
import com.zjs.cashretracted.service.CashRetractedService;
import com.zjs.cashretracted.service.CompteService;
import com.zjs.cashretracted.service.TransactionService;
import com.zjs.cashretracted.service.UserService;

@Controller
@RequestMapping(value="/user")
public class UserController {

	@Autowired
	UserService service ;
	@Autowired
	TransactionService serviceTrans ;
	@Autowired
	CompteService compteService ;
	@Autowired 
	CashRetractedService cashRetractedService ;
	
	LoginBean loginBean= new LoginBean();
	
	@RequestMapping(value={"/","/index"})
	  public String loginApps(Model model){
	
		loginBean= new LoginBean();
		
		Date d = new Date();
		DateFormat format=new SimpleDateFormat("dd/MM/yyyy");
		

		String dateJ =format.format(d);
		model.addAttribute("dateJ", dateJ);
		
		User u = service.findUserById(3);
	
		loginBean.setConnected(u);
		
		Compte c=compteService.findCompteByUser(u);
		loginBean.setCompte(c);
		
		loginBean.setTrans(serviceTrans.findTransactionsByCompte(loginBean.getCompte()));
		loginBean.setCashes(cashRetractedService.findCashRetractedbyCompte(loginBean.getCompte()));
		Date dt =loginBean.getTrans().get(loginBean.getTrans().size()-1).getDate();
	
		String derniereTrans = format.format(dt);
		model.addAttribute("derniereTrans", derniereTrans);
		
		model.addAttribute("loginBean",loginBean);
			
		
		return "user";
	  }
	
	
	@RequestMapping("/histo")
	public String infos(Model model){
	
		
		
		loginBean.setChoix(1);
		model.addAttribute("loginBean",loginBean);
		Date d = new Date();
		DateFormat format=new SimpleDateFormat("dd/MM/yyyy");
		

		String dateJ =format.format(d);
		model.addAttribute("dateJ", dateJ);
		
		Date dt =loginBean.getTrans().get(loginBean.getTrans().size()-1).getDate();
		
		String derniereTrans = format.format(dt);
		model.addAttribute("derniereTrans", derniereTrans);
		
		return "user";
	}
	
	@RequestMapping(value="/myCashes")
	public String cashesFromCompte(Model model){
		
		loginBean.setChoix(2);
		model.addAttribute("loginBean",loginBean);
		CashRetractedBean cashRetractedBean =new CashRetractedBean();
		
		cashRetractedBean.setCashes(loginBean.getCashes());
		cashRetractedBean.setNbrCashesCorriges(cashRetractedService.getNumberofCashCorrectedByCompte(loginBean.getCompte()));
		model.addAttribute("cashRetractedBean",cashRetractedBean);
		Date d = new Date();
		DateFormat format=new SimpleDateFormat("dd/MM/yyyy");
		

		String dateJ =format.format(d);
		model.addAttribute("dateJ", dateJ);
		
		Date dt =loginBean.getTrans().get(loginBean.getTrans().size()-1).getDate();
		
		String derniereTrans = format.format(dt);
		model.addAttribute("derniereTrans", derniereTrans);
		
		return "user";
	
		 
	}
	
	@RequestMapping(value="/hideInfo")
	public String hideInfo(Model model){
		
		loginBean.setChoix(0);
		Date d = new Date();
		DateFormat format=new SimpleDateFormat("dd/MM/yyyy");
		

		String dateJ =format.format(d);
		model.addAttribute("dateJ", dateJ);
		
		Date dt =loginBean.getTrans().get(loginBean.getTrans().size()-1).getDate();
		
		String derniereTrans = format.format(dt);
		model.addAttribute("derniereTrans", derniereTrans);
		
		model.addAttribute("loginBean",loginBean);	
		
		return "user";
	
		 
	}
}
