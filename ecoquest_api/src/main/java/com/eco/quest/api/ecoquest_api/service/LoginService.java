package com.eco.quest.api.ecoquest_api.service;

import java.util.Optional;

import org.springframework.stereotype.Service;

import com.eco.quest.api.ecoquest_api.dto.LoginDto;
import com.eco.quest.api.ecoquest_api.dto.ProfileDto;
import com.eco.quest.api.ecoquest_api.model.Login;
import com.eco.quest.api.ecoquest_api.model.Profile;
import com.eco.quest.api.ecoquest_api.repository.LoginRepository;
import com.eco.quest.api.ecoquest_api.repository.ProfileRepository;

@Service
public class LoginService {

    private final LoginRepository loginRepository;
    private final ProfileRepository profileRepository;

    public LoginService(LoginRepository loginRepository, ProfileRepository profileRepository) {
        this.loginRepository = loginRepository;
        this.profileRepository = profileRepository;
    }

    // Método de login simples
    public Optional<ProfileDto> login(LoginDto loginDto) {
        Optional<Login> loginOpt = loginRepository.findByEmail(loginDto.email());
        if (loginOpt.isPresent()) {
            Login login = loginOpt.get();
            if (login.getSenha().equals(loginDto.senha())) {
                Profile profileBase =login.getProfile();
                ProfileDto profile = new ProfileDto(profileBase.getId(), profileBase.getNome(),profileBase.getPontos(), profileBase.getDiasConsecutivos(),profileBase.getExperience(), profileBase.getLevel(), profileBase.getPhoto());
                return Optional.of(profile);
            }
        }
        return Optional.empty();
    }

    // Método para editar senha
    public boolean editarSenha(String profileId, String novaSenha) {
        Optional<Profile> profileOpt = profileRepository.findById(profileId);
        if (profileOpt.isPresent()) {
            Profile profile = profileOpt.get();
            Optional<Login> loginOpt = loginRepository.findByProfile(profile);
            if (loginOpt.isPresent()) {
                Login login = loginOpt.get();
                login.setSenha(novaSenha);
                loginRepository.save(login);
                return true;
            }
        }
        return false;
    }
}
