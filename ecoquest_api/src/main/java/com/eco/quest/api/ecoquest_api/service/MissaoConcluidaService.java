package com.eco.quest.api.ecoquest_api.service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.eco.quest.api.ecoquest_api.dto.CompletarMissaoDTO;
import com.eco.quest.api.ecoquest_api.dto.ProfileDto;
import com.eco.quest.api.ecoquest_api.model.Mission;
import com.eco.quest.api.ecoquest_api.model.MissoesConcluidas;
import com.eco.quest.api.ecoquest_api.model.Profile;
import com.eco.quest.api.ecoquest_api.repository.MissionRepository;
import com.eco.quest.api.ecoquest_api.repository.MissoesConcluidasRepository;
import com.eco.quest.api.ecoquest_api.repository.ProfileRepository;

@Service
public class MissaoConcluidaService {


    private final ProfileRepository profileRepository;
    private final MissionRepository missionRepository;
    private final MissoesConcluidasRepository missoesConcluidasRepository;

    public MissaoConcluidaService(
ProfileRepository profileRepository,
MissionRepository missionRepository,
MissoesConcluidasRepository missoesConcluidasRepository
    ){
        this.missionRepository = missionRepository;
        this.profileRepository = profileRepository;
        this.missoesConcluidasRepository = missoesConcluidasRepository;
    }


     public Optional<ProfileDto> completarMissao(CompletarMissaoDTO dto) {
        Optional<Profile> profileOpt = profileRepository.findById(dto.profileId());
        Optional<Mission> missionOpt = missionRepository.findById(dto.missionId());

        if (profileOpt.isPresent() && missionOpt.isPresent()) {
            Profile profile = profileOpt.get();
            Mission mission = missionOpt.get();

            boolean jaConcluida = missoesConcluidasRepository.existsByMissionAndProfile(mission, profile);
            if (jaConcluida) {
                return Optional.empty(); 
            }

            MissoesConcluidas conclusao = new MissoesConcluidas();
            conclusao.setProfile(profile);
            conclusao.setMission(mission);
            conclusao.setDataConclusao(new Date());
            missoesConcluidasRepository.save(conclusao);

            profile.setPontos(profile.getPontos().add(mission.getPoints()));
            profile.setExperience(profile.getExperience().add(mission.getExperience()));
            Profile updatedProfile = profileRepository.save(profile);

            return Optional.of(new ProfileDto(
                updatedProfile.getId(),
                updatedProfile.getNome(),
                updatedProfile.getPontos(),
                updatedProfile.getDiasConsecutivos(),
                updatedProfile.getExperience(),
                updatedProfile.getLevel(),
                updatedProfile.getPhoto()
            ));
        }
        return Optional.empty(); 
    }


     public List<MissoesConcluidas> getMissoesByidProfile(String profileId) {
        return missoesConcluidasRepository.findByProfile_Id(profileId);
    }

    
}
