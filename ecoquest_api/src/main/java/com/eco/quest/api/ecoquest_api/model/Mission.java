package com.eco.quest.api.ecoquest_api.model;

import java.math.BigDecimal;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
@Entity
public class Mission {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private String id;
    private String titulo;
    private String descricao;
    private String icon;
    private Long quantidadeAtual;
    private Long quantidadeTotal;
    private Dificuldade nivelDificuldade;
    private BigDecimal experience;
    private BigDecimal points;
    @ManyToOne
    private Categoria categoria;

    
}
