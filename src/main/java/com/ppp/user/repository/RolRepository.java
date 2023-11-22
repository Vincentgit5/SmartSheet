package com.ppp.user.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ppp.user.model.User;

@Repository
public interface RolRepository extends JpaRepository<User, Long> {

}
