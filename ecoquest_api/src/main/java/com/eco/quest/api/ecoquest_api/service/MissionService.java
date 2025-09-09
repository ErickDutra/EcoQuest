package com.eco.quest.api.ecoquest_api.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.eco.quest.api.ecoquest_api.dto.MissionDto;
import com.eco.quest.api.ecoquest_api.model.Mission;
import com.eco.quest.api.ecoquest_api.repository.MissionRepository;

@Service
public class MissionService {

    private final MissionRepository missionRepository;

    public MissionService(MissionRepository missionRepository) {
        this.missionRepository = missionRepository;
    }

  
    public MissionDto createMission(MissionDto missionDto) {
        Mission mission = toEntity(missionDto);
        Mission savedMission = missionRepository.save(mission);
        return toDto(savedMission);
    }

    public List<MissionDto> getAllMissions() {
        return missionRepository.findAll().stream()
                .map(this::toDto)
                .toList();
    }

  
    public Optional<MissionDto> getMissionById(String id) {
        return missionRepository.findById(id)
                .map(this::toDto);
    }

   
    public MissionDto updateMission(MissionDto missionDto) {
        Optional<Mission> existingMissionOpt = missionRepository.findById(missionDto.id());
        if (existingMissionOpt.isPresent()) {
            Mission existingMission = existingMissionOpt.get();
            existingMission.setTitulo(missionDto.titulo());
            existingMission.setDescricao(missionDto.descricao());
            existingMission.setIcon(missionDto.icon());
            existingMission.setQuantidadeAtual(missionDto.quantidadeAtual());
            existingMission.setQuantidadeTotal(missionDto.quantidadeTotal());
            existingMission.setNivelDificuldade(missionDto.nivelDificuldade());
            existingMission.setExperience(missionDto.experience());
            existingMission.setPoints(missionDto.points());
            existingMission.setCategoria(missionDto.categoria());
            Mission updatedMission = missionRepository.save(existingMission);
            return toDto(updatedMission);
        }
        return null;
    }


    public void deleteMission(String id) {
        missionRepository.deleteById(id);
    }

    private MissionDto toDto(Mission mission) {
        return new MissionDto(
                mission.getId(),
                mission.getTitulo(),
                mission.getDescricao(),
                mission.getIcon(),
                mission.getQuantidadeAtual(),
                mission.getQuantidadeTotal(),
                mission.getNivelDificuldade(),
                mission.getExperience(),
                mission.getPoints(),
                mission.getCategoria()
        );
    }

    
    private Mission toEntity(MissionDto missionDto) {
        Mission mission = new Mission();
        mission.setId(missionDto.id());
        mission.setTitulo(missionDto.titulo());
        mission.setDescricao(missionDto.descricao());
        mission.setIcon(missionDto.icon());
        mission.setQuantidadeAtual(missionDto.quantidadeAtual());
        mission.setQuantidadeTotal(missionDto.quantidadeTotal());
        mission.setNivelDificuldade(missionDto.nivelDificuldade());
        mission.setExperience(missionDto.experience());
        mission.setPoints(missionDto.points());
        mission.setCategoria(missionDto.categoria());
        return mission;
    }
}
