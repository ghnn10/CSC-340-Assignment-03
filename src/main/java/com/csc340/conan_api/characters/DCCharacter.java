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
    private int age;

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

    public int getAge(){
        return age;
    }

    public void setAge(int age){
        this.age = age;
    }

    

    

    

}