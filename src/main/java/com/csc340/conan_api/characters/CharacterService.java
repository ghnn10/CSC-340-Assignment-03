package com.csc340.conan_api.characters;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;

@Service
public class CharacterService {
    
    private final CharacterRepository repository;

    private static final String UPLOAD_DIR = "src/main/resources/static/thumbnails/";

    public CharacterService(CharacterRepository repository){
        this.repository = repository;
    }

    public List<DCCharacter> findAll(){
        return repository.findAll();
    }

    public DCCharacter findById(Long id){
        return repository.findById(id).orElseThrow(() -> new CharacterNotFoundException(id));
    }

    public List<DCCharacter> findByRoles(Roles roles){
        return repository.findByRoles(roles);
    }

    public List<DCCharacter> findByNameContainingIgnoreCase(String name){
        return repository.findByNameContainingIgnoreCase(name);
    }

    public DCCharacter create(DCCharacter dcCharacter){
        return repository.save(dcCharacter);
    }

    public List<DCCharacter> search(String name,Roles roles){
        boolean hasName = name != null && !name.isBlank();

        if(hasName && roles != null){
            return repository.findByNameContainingIgnoreCaseAndRoles(name,roles);
        }
        if(hasName){
            return repository.findByNameContainingIgnoreCase(name.trim());
        }
        if(roles!=null){
            return repository.findByRoles(roles);
        }
        return repository.findAll();
    }


    public DCCharacter update(Long id, DCCharacter updated){
        DCCharacter existing = findById(id);
        existing.setName(updated.getName());
        existing.setRoles(updated.getRoles());
        existing.setDescription(updated.getDescription());
        existing.setAge(updated.getAge());
        return repository.save(existing);
    }

    public void delete(Long id){
        findById(id);   // throws 404 if missing
        repository.deleteById(id);
    }

    public void saveThumbnail(DCCharacter dcCharacter, MultipartFile file) {
        String originalFileName = file.getOriginalFilename();
        try {
            String fileExtension = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
            String newFileName = "character_" + dcCharacter.getId() + "." + fileExtension;
            Path path = Paths.get(UPLOAD_DIR + newFileName);
            InputStream inputStream = file.getInputStream();
            Files.createDirectories(Paths.get(UPLOAD_DIR)); // Ensure the directory exists
            Files.copy(inputStream, path, StandardCopyOption.REPLACE_EXISTING);
            dcCharacter.setThumbnailUrl( newFileName);
            repository.save(dcCharacter);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
