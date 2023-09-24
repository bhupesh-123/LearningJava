package com.web.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

import com.web.dao.UserDao;
import com.web.model.User;
@Repository("userDao")

/*@Scope(value="singleton")*/

public class UserDaoImpl implements UserDao {

	@Autowired
	SessionFactory sessionFactory;
	
	protected Session currentSession(){
		
		return sessionFactory.getCurrentSession();
				
	}
	
	@Override
	public void create(User user) {
		// TODO Auto-generated method stub
		currentSession().save(user);
		
	} 

	@Override
	public void update(User user) {
		// TODO Auto-generated method stub
		currentSession().update(user);
	}

	@Override
	public User edit(Long userId) {
		// TODO Auto-generated method stub
		return find(userId);
	}

	@Override
	public void delete(Long userId) {
		System.out.println("print.......  "+userId);
		User user = new User();
		user.setUserId(userId);
		
		currentSession().delete(user);
		
	}

	@Override
	public User find(Long userId) { 
		
		return (User)currentSession().get(User.class, userId);
	}

	@Override
	public List<User> getAll() {
		return currentSession().createCriteria(User.class).list();
		
		/*Criteria criteria = currentSession().createCriteria(User.class);
		criteria.*/
	}

}
