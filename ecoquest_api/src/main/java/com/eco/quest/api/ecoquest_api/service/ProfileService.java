package com.eco.quest.api.ecoquest_api.service;

import com.eco.quest.api.ecoquest_api.dto.ProfileDto;
import com.eco.quest.api.ecoquest_api.model.Profile;
import com.eco.quest.api.ecoquest_api.repository.ProfileRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class ProfileService {

    final ProfileRepository profileRepository;

    public ProfileService(ProfileRepository profileRepository){
        this.profileRepository = profileRepository;
    }

    

    public ProfileDto createProfile(ProfileDto profileDto) {
        Profile profile = new Profile();
        profile.setNome(profileDto.nome());
        profile.setPontos(profileDto.pontos());
        profile.setDiasConsecutivos(profileDto.diasConsecutivos());
        profile.setExperience(profileDto.experience());
        profile.setLevel(profileDto.level());
        profile.setPhoto(profileDto.photo());
        Profile savedProfile = profileRepository.save(profile);
        return new ProfileDto(savedProfile.getId(), savedProfile.getNome(), savedProfile.getPontos(),
                              savedProfile.getDiasConsecutivos(), savedProfile.getExperience(),
                              savedProfile.getLevel(), savedProfile.getPhoto());
    }

    public List<ProfileDto> getAllProfiles() {
        return profileRepository.findAll().stream()
                .map(profile -> new ProfileDto(profile.getId(), profile.getNome(), profile.getPontos(),
                                               profile.getDiasConsecutivos(), profile.getExperience(),
                                               profile.getLevel(), profile.getPhoto()))
                .collect(Collectors.toList());
    }

    public Optional<ProfileDto> getProfileById(String id) {
        return profileRepository.findById(id)
                .map(profile -> new ProfileDto(profile.getId(), profile.getNome(), profile.getPontos(),
                                               profile.getDiasConsecutivos(), profile.getExperience(),
                                               profile.getLevel(), profile.getPhoto()));
    }

    public Optional<ProfileDto> updateProfile(String id, ProfileDto profileDto) {
        return profileRepository.findById(id).map(profile -> {
            profile.setNome(profileDto.nome());
            profile.setPontos(profileDto.pontos());
            profile.setDiasConsecutivos(profileDto.diasConsecutivos());
            profile.setExperience(profileDto.experience());
            profile.setLevel(profileDto.level());
            profile.setPhoto(profileDto.photo());
            Profile updatedProfile = profileRepository.save(profile);
            return new ProfileDto(updatedProfile.getId(), updatedProfile.getNome(), updatedProfile.getPontos(),
                                  updatedProfile.getDiasConsecutivos(), updatedProfile.getExperience(),
                                  updatedProfile.getLevel(), updatedProfile.getPhoto());
        });
    }

    public boolean deleteProfile(String id) {
        if (profileRepository.existsById(id)) {
            profileRepository.deleteById(id);
            return true;
        }
        return false;
    }
}