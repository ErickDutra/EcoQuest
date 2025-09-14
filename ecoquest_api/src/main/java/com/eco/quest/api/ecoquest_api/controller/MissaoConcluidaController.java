package com.eco.quest.api.ecoquest_api.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.eco.quest.api.ecoquest_api.dto.CompletarMissaoDTO;
import com.eco.quest.api.ecoquest_api.model.MissoesConcluidas;
import com.eco.quest.api.ecoquest_api.service.MissaoConcluidaService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;


@RestController
@RequestMapping("/missao-concluida")
public class MissaoConcluidaController {

    private final MissaoConcluidaService missaoConcluidaService;

    public MissaoConcluidaController(MissaoConcluidaService missaoConcluidaService) {
        this.missaoConcluidaService = missaoConcluidaService;
    }

    @PostMapping
    public ResponseEntity<String> completarMissao(@RequestBody CompletarMissaoDTO dto) {
        Optional<String> resultado = missaoConcluidaService.completarMissao(dto);
        return resultado.map(ResponseEntity::ok).orElse(ResponseEntity.badRequest().body("Erro ao completar missão"));
    }

     @GetMapping("/{profileId}")
    public ResponseEntity<List<MissoesConcluidas>> getMissoesConcluidas(@PathVariable String profileId) {
        List<MissoesConcluidas> missoes = missaoConcluidaService.getMissoesByidProfile(profileId);
        return ResponseEntity.ok(missoes);
    }
    
}
