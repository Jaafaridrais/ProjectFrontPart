package com.zjs.cashretracted.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.zjs.cashretracted.form.CashRetractedBean;
import com.zjs.cashretracted.form.CompteBean;
import com.zjs.cashretracted.form.TransactionBean;
import com.zjs.cashretracted.form.UserBean;
import com.zjs.cashretracted.model.Compte;
import com.zjs.cashretracted.model.User;
import com.zjs.cashretracted.service.CashRetractedService;
import com.zjs.cashretracted.service.CompteService;
import com.zjs.cashretracted.service.TransactionService;
import com.zjs.cashretracted.service.UserService;

@Controller
@RequestMapping(value="/admin")
public class AdminController {
	

	@Autowired
	CashRetractedService cashRetractedService;
	@Autowired
	CompteService compteService ;
	@Autowired
	UserService userService;
	@Autowired
	 TransactionService tranService;
	
	CashRetractedBean cashRetractedBean = new CashRetractedBean();
	CompteBean compteBean = new CompteBean();
	TransactionBean transactionBean =new TransactionBean();
	UserBean userBean = new UserBean();
	
	

	@RequestMapping(value={"/","/index","/home"})
	public ModelAndView home(Model model){
		ModelAndView andView = new ModelAndView();
		
		andView.setViewName("home");
		 return andView;
		 
	}
	
	
	
	// ************************************** CashRetracteds Gestion **********************************************************//
	@RequestMapping(value = "/cashes")
	public String index3(Model model) {

		cashRetractedBean = new CashRetractedBean();

		cashRetractedBean.setNbrCashesCorriges(cashRetractedService
				.getNumberofCashCorrected());
		cashRetractedBean.setCashes(cashRetractedService.getAllCashes());

		model.addAttribute("cashRetractedBean", cashRetractedBean);

		return "cashes";

	}

	
	@RequestMapping(value="/comptecashes")
	public String cashesFromCompte(Integer rib,Model model){
		
		cashRetractedBean =new CashRetractedBean();
		Compte compte = compteService.findCompteByRib(rib);
		cashRetractedBean.setCashes(cashRetractedService.findCashRetractedbyCompte(compte));
		cashRetractedBean.setNbrCashesCorriges(cashRetractedService.getNumberofCashCorrectedByCompte(compte));
		model.addAttribute("cashRetractedBean",cashRetractedBean);
	
		return "cashes";
	
		 
	}

	
	// ************************************** Comptes Gestion **********************************************************//
	
	@RequestMapping(value="/comptes")
	public String index2(Model model){
		compteBean = new CompteBean();
		compteBean.setComptes(compteService.getAllComptes());
		 model.addAttribute("compteBean",compteBean);
		 return "comptes";
		 
	}
 	
	
	@RequestMapping(value="/comptedetails")
	public String showDetailsCompte(Integer rib,Model model)
	{
		Compte cpte = compteBean.getCompteById(rib);
		compteBean.setSelected(cpte);
		model.addAttribute("compteBean",compteBean);
		return "comptedetails";
	}
	@RequestMapping(value="/editCompte")
	public String edit(Integer rib,Model model)
	{
		Compte cpte = compteBean.getCompteById(rib);
		compteBean.setSelected(cpte);
		model.addAttribute("compteBean",compteBean);
		return "comptes";
	}
	
	// ************************************** TRansactions Gestion **********************************************************//
	
	@RequestMapping(value="/transactions")
	public String index4(Model model){
		
		transactionBean =new TransactionBean();
		
		transactionBean.setTransactions(tranService.getAllTransactions());
		model.addAttribute("transactionBean",transactionBean);
	
		return "transactions";
	
		 
	}

	@RequestMapping(value="/trans")
	public String transFromCompte(Integer rib,Model model){
		
		transactionBean =new TransactionBean();
		Compte compte = compteService.findCompteByRib(rib);
		transactionBean.setTransactions(tranService.findTransactionsByCompte(compte));
		model.addAttribute("transactionBean",transactionBean);
	
		return "transactions";
	
		 
	}
	
	// ************************************** Users Gestion **********************************************************//
	@RequestMapping(value = "/users")
	public String index(Model model) {

		userBean = new UserBean();
		userBean.setUsers(userService.getAllUsers());
		model.addAttribute("userBean", userBean);

		return "users";

	}
	
	@RequestMapping(value = "/userdetails")
	public String showDetailsUser(Integer idUser ,Model model) {

		User selected = userBean.getUserById(idUser);
		userBean.setSelected(selected);
		model.addAttribute("userBean", userBean);
		return "userdetails";

	}
	
	@RequestMapping(value = "/editUser")
	public String editer(Model model) {
		userService.updateUser(userBean.getSelected());
		return index(model);
	}
	
}
