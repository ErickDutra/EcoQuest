package com.eco.quest.api.ecoquest_api.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.eco.quest.api.ecoquest_api.model.Mission;
import com.eco.quest.api.ecoquest_api.model.MissoesConcluidas;
import com.eco.quest.api.ecoquest_api.model.Profile;

public interface MissoesConcluidasRepository extends JpaRepository<MissoesConcluidas, String> {
    boolean existsByMissionAndProfile( Mission mission,Profile profile);
}
