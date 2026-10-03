package com.csc340.conan_api.characters;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;

@Entity 
@Table(name ="characters")
public class DCCharacter{

    @Id 
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull 
    @NotBlank 
    private String name;

    @NotNull
    @NotBlank 
    private String description;

    @NotNull 
    @Enumerated(EnumType.STRING)
    private Roles role;

   @Positive 
   private int age;

}