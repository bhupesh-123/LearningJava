package com.web.dao;

import java.util.List;

import com.web.model.User;

public interface UserDao {
public void create(User user);
public void update(User user);
public User edit(Long userId );
public void delete(Long userId);
public User find(Long userId);

public List<User>getAll();

}
