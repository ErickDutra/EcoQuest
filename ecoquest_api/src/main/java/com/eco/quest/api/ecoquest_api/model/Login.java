package com.eco.quest.api.ecoquest_api.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
@Entity
public class Login {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private String id;
    private Profile profile;
    private String senha ;
    private String email;

    
}
