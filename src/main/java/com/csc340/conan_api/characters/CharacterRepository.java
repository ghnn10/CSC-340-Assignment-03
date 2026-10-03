package com.csc340.conan_api.characters;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CharacterRepository extends JpaRepository<DCCharacter, Long>{
    
    List<DCCharacter> findByRoles(Roles roles);

    List<DCCharacter> findByNameContainingIgnoreCase(String name);

    List<DCCharacter> findByNameContainingIgnoreCaseAndRoles(String name, Roles roles);
}
