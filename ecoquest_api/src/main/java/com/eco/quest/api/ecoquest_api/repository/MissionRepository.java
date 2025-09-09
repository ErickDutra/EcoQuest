package com.eco.quest.api.ecoquest_api.repository;

import com.eco.quest.api.ecoquest_api.model.Mission;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MissionRepository extends JpaRepository<Mission, String> {
}
