package com.ppp.user.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ppp.user.model.Groupe;

@Repository
public interface GroupRepository extends JpaRepository<Groupe, Long> {
	Groupe findByName(String getGroup);

}
