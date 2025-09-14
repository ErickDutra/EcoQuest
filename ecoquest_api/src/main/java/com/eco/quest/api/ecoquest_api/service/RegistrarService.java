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
       
        if (loginRepository.findByEmail(dto.email()).isPresent()) {
            return Optional.empty(); 
        }

        
        Profile profile = Profile.builder()
            .nome(dto.nome())
            .pontos(BigDecimal.ZERO)
            .experience(BigDecimal.ZERO)
            .level(1L)
            .diasConsecutivos(0L)
            .build();
        Profile savedProfile = profileRepository.save(profile);

       
        Login login = Login.builder()
            .email(dto.email())
            .senha(dto.senha()) 
            .profile(savedProfile)
            .build();
        loginRepository.save(login);

        return Optional.of(savedProfile);
    }
}
