package com.eco.quest.api.ecoquest_api.model;

import java.math.BigDecimal;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
@Entity
public class Profile {
    
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private String id;
    private String  nome;
    private BigDecimal  pontos;
    private Long  diasConsecutivos;
    private BigDecimal  experience;
    private Long  level;
    private String  photo;
}
