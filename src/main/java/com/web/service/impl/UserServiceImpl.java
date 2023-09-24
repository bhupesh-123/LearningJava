package com.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.UserDao;
import com.web.model.User;
import com.web.service.UserService;

@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
@Service("userService")
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserDao userDao;
	
	@Override
	public void create(User user) {
		
		userDao.create(user);
	}

	@Override
	public void update(User user) {
		userDao.update(user);
	}

	@Override
	public User edit(Long userId) {
		return userDao.edit(userId);
	}

	@Override
	public void delete(Long userId) {
		System.out.println("userId ..........: "+userId);

				userDao.delete(userId);
		
	}

	@Override
	public User find(Long userId) {
		
		return userDao.find(userId);
	}

	@Override
	public List<User> getAll() {
		return userDao.getAll();
	}

}
