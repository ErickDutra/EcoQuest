package com.eco.quest.api.ecoquest_api.controller;

import java.util.Optional;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.eco.quest.api.ecoquest_api.dto.RegistrarDTO;
import com.eco.quest.api.ecoquest_api.model.Profile;
import com.eco.quest.api.ecoquest_api.service.RegistrarService;

@RestController
@RequestMapping("/registrar")
public class RegistrarController {

    private final RegistrarService registrarService;

    public RegistrarController(RegistrarService registrarService) {
        this.registrarService = registrarService;
    }

    @PostMapping
    public ResponseEntity<Profile> registrarUsuario(@RequestBody RegistrarDTO dto) {
        Optional<Profile> profile = registrarService.registrarUsuario(dto);
        return profile.map(ResponseEntity::ok).orElse(ResponseEntity.badRequest().build());
    }
}
