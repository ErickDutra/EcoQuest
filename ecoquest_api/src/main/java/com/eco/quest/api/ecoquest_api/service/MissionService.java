package com.eco.quest.api.ecoquest_api.service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;

import com.eco.quest.api.ecoquest_api.dto.MissionDto;
import com.eco.quest.api.ecoquest_api.model.Categoria;
import com.eco.quest.api.ecoquest_api.model.Mission;
import com.eco.quest.api.ecoquest_api.repository.CategoriaRepository;
import com.eco.quest.api.ecoquest_api.repository.MissionRepository;
import com.eco.quest.api.ecoquest_api.repository.MissoesConcluidasRepository;

@Service
public class MissionService {

    private final MissionRepository missionRepository;
    private final CategoriaRepository categoriaRepository;
    private final MissoesConcluidasRepository missoesConcluidasRepository;


      public MissionService(MissionRepository missionRepository, CategoriaRepository categoriaRepository, MissoesConcluidasRepository missoesConcluidasRepository) {
        this.missionRepository = missionRepository;
        this.categoriaRepository = categoriaRepository;
        this.missoesConcluidasRepository = missoesConcluidasRepository;
    }
    public List<MissionDto> getAvailableMissions(String profileId) {
       
        List<Mission> allMissions = missionRepository.findAll();
        
        
        List<String> completedMissionIds = missoesConcluidasRepository.findByProfile_Id(profileId)
                .stream()
                .map(missaoConcluida -> missaoConcluida.getMission().getId())
                .collect(Collectors.toList());
        
        
        return allMissions.stream()
                .filter(mission -> !completedMissionIds.contains(mission.getId()))
                .map(this::toDto)
                .collect(Collectors.toList());
    }

    public List<MissionDto> getCompletedMissions(String profileId) {
    List<String> completedMissionIds = missoesConcluidasRepository.findByProfile_Id(profileId)
            .stream()
            .map(missaoConcluida -> missaoConcluida.getMission().getId())
            .collect(Collectors.toList());
    
    return missionRepository.findAllById(completedMissionIds)
            .stream()
            .map(this::toDto)
            .collect(Collectors.toList());
}

  
    
    public MissionDto createMission(MissionDto dto) {
        Optional<Categoria> categoriaOpt = categoriaRepository.findById(dto.categoria().getId());
        if (categoriaOpt.isEmpty()) {
            throw new RuntimeException("Categoria não encontrada com id: " + dto.categoria().getId());
        }
        Categoria categoria = categoriaOpt.get();

        Mission mission = toEntity(dto);
        mission.setCategoria(categoria);  
        Mission saved = missionRepository.save(mission);
        return toDto(saved);
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
