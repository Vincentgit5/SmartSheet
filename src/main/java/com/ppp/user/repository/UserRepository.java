package com.ppp.user.repository;




import org.springframework.data.jpa.repository.JpaRepository;

import com.ppp.user.model.User;
import com.ppp.user.model.dto.UserDTO;

public interface UserRepository extends JpaRepository<User, Long> {
	
	User findByUsernameOrEmail(String email, String username);
	User findByEmail(String email);
	User findByUsername(String username);
	void deleteByUsername(String username);
	
}
