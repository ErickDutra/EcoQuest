package com.eco.quest.api.ecoquest_api.repository;

import com.eco.quest.api.ecoquest_api.model.Categoria;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoriaRepository extends JpaRepository<Categoria, String> {
}
