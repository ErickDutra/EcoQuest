package com.eco.quest.api.ecoquest_api.service;

import java.math.BigDecimal;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.eco.quest.api.ecoquest_api.dto.RegistrarDTO;
import com.eco.quest.api.ecoquest_api.model.Login;
import com.eco.quest.api.ecoquest_api.model.Profile;
import com.eco.quest.api.ecoquest_api.repository.LoginRepository;
import com.eco.quest.api.ecoquest_api.repository.ProfileRepository;

@Service
public class RegistrarService {

    private final ProfileRepository profileRepository;
    private final LoginRepository loginRepository;

    public RegistrarService(ProfileRepository profileRepository,  LoginRepository loginRepository) {
        this.profileRepository = profileRepository;
        this.loginRepository = loginRepository;
    }

    public Optional<Profile> registrarUsuario(RegistrarDTO dto) {
        Profile profile = new Profile();
        Login login = new Login();
        profile.setNome(dto.nome());
        profile.setPontos(BigDecimal.ZERO);
        profile.setExperience(BigDecimal.ZERO);
        profile.setLevel(0L);
        profile.setDiasConsecutivos(0L);
        login.setEmail(dto.email());
        login.setProfile(profile);
        login.setSenha(dto.senha());
        loginRepository.save(login);
        Profile savedProfile = profileRepository.save(profile);
        return Optional.of(savedProfile);
    }
}
