package com.eco.quest.api.ecoquest_api.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.eco.quest.api.ecoquest_api.dto.MissionDto;
import com.eco.quest.api.ecoquest_api.service.MissionService;

@RestController
@RequestMapping("/missions")
public class MissionController {

    private final MissionService missionService;

    public MissionController(MissionService missionService) {
        this.missionService = missionService;
    }

    @PostMapping
    public ResponseEntity<MissionDto> createMission(@RequestBody MissionDto missionDto) {
        MissionDto created = missionService.createMission(missionDto);
        return ResponseEntity.ok(created);
    }

    @GetMapping
    public ResponseEntity<List<MissionDto>> getAllMissions() {
        List<MissionDto> missions = missionService.getAllMissions();
        return ResponseEntity.ok(missions);
    }

    @GetMapping("/{id}")
    public ResponseEntity<MissionDto> getMissionById(@PathVariable String id) {
        Optional<MissionDto> mission = missionService.getMissionById(id);
        return mission.map(ResponseEntity::ok).orElse(ResponseEntity.notFound().build());
    }

    @PutMapping("/{id}")
    public ResponseEntity<MissionDto> updateMission(@PathVariable String id, @RequestBody MissionDto missionDto) {
        MissionDto updated = missionService.updateMission(missionDto);
        return ResponseEntity.ok(updated);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteMission(@PathVariable String id) {
        missionService.deleteMission(id);
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/available/{profileId}")
    public ResponseEntity<List<MissionDto>> getAvailableMissions(@PathVariable String profileId) {
        List<MissionDto> availableMissions = missionService.getAvailableMissions(profileId);
        return ResponseEntity.ok(availableMissions);
    }
}
