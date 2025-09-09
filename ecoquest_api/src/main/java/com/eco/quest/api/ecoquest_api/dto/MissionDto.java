package com.eco.quest.api.ecoquest_api.dto;

import java.math.BigDecimal;

import com.eco.quest.api.ecoquest_api.model.Categoria;
import com.eco.quest.api.ecoquest_api.model.Dificuldade;

public record MissionDto(  String id,
     String titulo,
     String descricao,
     String icon,
     Long quantidadeAtual,
     Long quantidadeTotal,
     Dificuldade nivelDificuldade,
     BigDecimal experience,
     BigDecimal points,
     Categoria categoria) {
}
