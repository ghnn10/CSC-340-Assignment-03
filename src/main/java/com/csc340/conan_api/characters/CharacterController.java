package com.csc340.conan_api.characters;

import org.apache.catalina.connector.Response;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import jakarta.validation.Valid;

import java.util.List;

@RestController 
@RequestMapping("/api/characters")
public class CharacterController {

    private final CharacterService service;

    public CharacterController(CharacterService service){
        this.service = service;
    }

    @GetMapping 
    public List<DCCharacter> list(@RequestParam(required = false) String name, @RequestParam (required = false) Roles roles){
        return service.search(name, roles);
    }
    
    @GetMapping("/{id}")
    public DCCharacter get(@PathVariable Long id){
        return service.findById(id);
    }

    @PostMapping 
    @ResponseStatus(HttpStatus.CREATED)
    public DCCharacter create(@Valid @RequestBody DCCharacter dcCharacter){
        return service.create(dcCharacter);
    } 

    @PutMapping("/{id}")
    public DCCharacter update(@PathVariable Long id, @Valid @RequestBody  DCCharacter updated){
        return service.update(id, updated);
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@Valid @PathVariable Long id){
        service.delete(id);
    }

    @GetMapping(params = "roles")
    public List<DCCharacter> findByRoles(@Valid @RequestParam Roles roles){
        return service.findByRoles(roles);
    }

    @GetMapping(params = "name")
    public List<DCCharacter> findByName(@Valid @RequestParam String name){
        return service.findByNameContainingIgnoreCase(name);
    }

    @GetMapping("/pulse")
    public ResponseEntity<String> checkPulse() {
        return ResponseEntity.ok("Pulse check successful");
    }

}
