package com.eco.quest.api.ecoquest_api.model;

import java.util.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
@Entity
public class MissoesConcluidas {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private String id;
   
    @ManyToOne
    private Profile profile;

    @ManyToOne
    private Mission mission;

    private Date dataConclusao;

}
