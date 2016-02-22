package com.zjs.cashretracted.form;

import java.util.List;

import com.zjs.cashretracted.model.User;

public class UserBean {
	
	private User selected ;
	private List<User> users;
	
	
	
	public User getSelected() {
		return selected;
	}
	public void setSelected(User selected) {
		this.selected = selected;
	}
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}

	public User getUserById(Integer id)
	{		
		for(User u : users)
			if(u.getId().equals(id)) return u ;
		
		return null;
	}
	

}
