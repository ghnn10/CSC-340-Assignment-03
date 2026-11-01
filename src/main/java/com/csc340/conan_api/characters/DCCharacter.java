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
    private Roles roles;

    @Positive 
    private Integer age;

    private String firstAppearance;

    @NotNull
    @NotBlank 
    private String background;

    @NotNull
    @NotBlank 
    private String personality;

    public DCCharacter(){

    }

    public Long getId(){
        return id;
    }

    public String getName(){
        return name;
    }

    public void setName(String name){
        this.name = name;
    }

    public String getDescription(){
        return description;
    }

    public void setDescription(String description){
        this.description = description;
    }

    public Roles getRoles(){
        return roles;
    }

    public void setRoles(Roles roles){
        this.roles = roles;
    }

    public Integer getAge(){
        return age;
    }

    public void setAge(Integer age){
        this.age = age;
    }

    public String getFirstAppearance() {
        return firstAppearance;
    }

    public void setFirstAppearance(String firstAppearance) {
        this.firstAppearance = firstAppearance;
    }
    
    public String getBackground() {
        return background;
    }

    public void setBackground(String background) {
        this.background = background;
    }

    public String getPersonality() {
        return personality;
    }

    public void setPersonality(String personality) {
        this.personality = personality;
    }

}