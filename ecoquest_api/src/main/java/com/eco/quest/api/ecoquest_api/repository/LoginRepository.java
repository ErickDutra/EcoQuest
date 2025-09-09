package com.eco.quest.api.ecoquest_api.repository;

import java.util.Optional;

import com.eco.quest.api.ecoquest_api.model.Login;
import com.eco.quest.api.ecoquest_api.model.Profile;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LoginRepository extends JpaRepository<Login, String> {
    Optional<Login> findByEmail(String email);
    Optional<Login> findByProfile(Profile profile);
}
