package com.csc340.conan_api.characters;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;

@Controller
@RequestMapping("/characters")
public class CharacterUiController {

    private final CharacterService service;

    public CharacterUiController(CharacterService service) {
        this.service = service;
    }

    @GetMapping
    public String gallery(@RequestParam(required = false) String name,
      @RequestParam(required = false) Roles role, Model model) {
        model.addAttribute("myChars", service.search(name, role));
        model.addAttribute("name", name == null ? "" : name);
        model.addAttribute("selectedRole", role == null ? "" : role.name());
        return "index";
    }

    @GetMapping("/about")
    public String about() {
        return "about";
    }

    @GetMapping("/{id}")
    public String details(@PathVariable Long id, Model model) {
        try{
            DCCharacter myChar = service.findById(id);
            model.addAttribute("myChar", myChar);
            return "details";
        } catch (RuntimeException exception) {
            model.addAttribute("errorMessage",
                exception.getMessage() == null ? "Character not found" : exception.getMessage());
            return "error";
    }

    }

    @GetMapping("/new")
    public String newForm(Model model){
        DCCharacter myChar = new DCCharacter();
        model.addAttribute("myChar",myChar);
        model.addAttribute("formTitle","Add a Character");
        model.addAttribute("formAction", "/characters");
        return "character-form";
    }

    @PostMapping
    public String createCharacter(@Valid @ModelAttribute DCCharacter dcCharacter, MultipartFile imageFile) {
        DCCharacter createdChar = service.create(dcCharacter);
        if (imageFile != null && !imageFile.isEmpty()) {
            service.saveThumbnail(createdChar, imageFile);
        }
        return "redirect:/characters/" + createdChar.getId();
    }

    @PostMapping("/{id}/delete")
    public String deleteCharacter(@PathVariable Long id){
        service.delete(id);
        return "redirect:/characters";
    }

    @GetMapping("/{id}/edit")
    public String editForm(@PathVariable Long id, Model model){
        DCCharacter myChar = service.findById(id);
        model.addAttribute("myChar", myChar);
        model.addAttribute("formTitle", "Edit Character");
        model.addAttribute("formAction", "/characters/"+id);
        return "character-form";
    }

    @GetMapping("/{id}/image")
    public String getImg(@PathVariable Long id){
        DCCharacter myChar = service.findById(id);
        if (myChar != null && myChar.getThumbnailUrl() != null && !myChar.getThumbnailUrl().isEmpty()) {
            return "redirect:/thumbnails/" + myChar.getThumbnailUrl();
        }
        return "redirect:/thumbnails/character-placeholder.svg";
    }

    @PostMapping("{id}")
    public String updateCharacter(@PathVariable Long id, DCCharacter dcCharacter, MultipartFile imageFile){
        DCCharacter updatedCharacter = service.update(id, dcCharacter);
        if (imageFile != null && !imageFile.isEmpty()) {
            service.saveThumbnail(updatedCharacter, imageFile);
        }
        return "redirect:/characters/" + updatedCharacter.getId();
    }

}
