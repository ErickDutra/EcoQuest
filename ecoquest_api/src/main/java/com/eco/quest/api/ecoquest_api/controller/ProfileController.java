package com.eco.quest.api.ecoquest_api.controller;

import com.eco.quest.api.ecoquest_api.dto.ProfileDto;
import com.eco.quest.api.ecoquest_api.service.ProfileService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/profiles")
public class ProfileController {

    
    private ProfileService profileService;

    public ProfileController(ProfileService profileService){
    this.profileService = profileService;
}
    @PostMapping
    public ResponseEntity<ProfileDto> createProfile(@RequestBody ProfileDto profileDto) {
        ProfileDto createdProfile = profileService.createProfile(profileDto);
        return ResponseEntity.ok(createdProfile);
    }

    @GetMapping
    public ResponseEntity<List<ProfileDto>> getAllProfiles() {
        List<ProfileDto> profiles = profileService.getAllProfiles();
        return ResponseEntity.ok(profiles);
    }

    @GetMapping("/{id}")
    public ResponseEntity<ProfileDto> getProfileById(@PathVariable String id) {
        Optional<ProfileDto> profile = profileService.getProfileById(id);
        return profile.map(ResponseEntity::ok).orElse(ResponseEntity.notFound().build());
    }

    @PutMapping("/{id}")
    public ResponseEntity<ProfileDto> updateProfile(@PathVariable String id, @RequestBody ProfileDto profileDto) {
        Optional<ProfileDto> updatedProfile = profileService.updateProfile(id, profileDto);
        return updatedProfile.map(ResponseEntity::ok).orElse(ResponseEntity.notFound().build());
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteProfile(@PathVariable String id) {
        boolean deleted = profileService.deleteProfile(id);
        return deleted ? ResponseEntity.noContent().build() : ResponseEntity.notFound().build();
    }
}