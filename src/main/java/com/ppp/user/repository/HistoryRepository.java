package com.ppp.user.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ppp.user.model.Groupe;

@Repository
public interface HistoryRepository extends JpaRepository<Groupe, Long> {

}
