package com.eco.quest.api.ecoquest_api.controller;

import java.util.Optional;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.eco.quest.api.ecoquest_api.dto.LoginDto;
import com.eco.quest.api.ecoquest_api.dto.ProfileDto;
import com.eco.quest.api.ecoquest_api.model.Profile;
import com.eco.quest.api.ecoquest_api.service.LoginService;

@RestController
@RequestMapping("/login")
public class LoginController {

    private final LoginService loginService;

    public LoginController(LoginService loginService) {
        this.loginService = loginService;
    }

    @PostMapping
    public ResponseEntity<ProfileDto> login(@RequestBody LoginDto loginDto) {
        Optional<ProfileDto> profile = loginService.login(loginDto);
        return profile.map(ResponseEntity::ok).orElse(ResponseEntity.badRequest().build());
    }

    @PutMapping("/{profileId}/senha")
    public ResponseEntity<String> editarSenha(@PathVariable String profileId, @RequestBody String novaSenha) {
        boolean sucesso = loginService.editarSenha(profileId, novaSenha);
        if (sucesso) {
            return ResponseEntity.ok("Senha alterada com sucesso");
        } else {
            return ResponseEntity.badRequest().body("Erro ao alterar senha");
        }
    }
}
