package com.eco.quest.api.ecoquest_api.dto;

import java.math.BigDecimal;

public record ProfileDto
(
    String id
    ,String  nome
    ,BigDecimal  pontos
    ,Long  diasConsecutivos
    ,BigDecimal  experience
    ,Long  level
    ,String  photo
) {
    
}
