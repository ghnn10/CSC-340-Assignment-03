package com.csc340.conan_api.characters;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/characters")
public class CharacterUiController {

    private final CharacterService service;

    public CharacterUiController(CharacterService service) {
        this.service = service;
    }

    @GetMapping
    public String gallery(@RequestParam(required = false) String name,
      @RequestParam(required = false) Roles roles, Model model) {
        model.addAttribute("myChars", service.search(name, roles));
        model.addAttribute("name", name == null ? "" : name);
        model.addAttribute("selectedRole", roles == null ? "" : roles.name());
        return "index"; // templates/index.ftlh
    }

    @GetMapping("/about")
    public String about() {
        return "about";
    }

    @GetMapping("/{id}")
    public String details(@PathVariable Long id, Model model) {
        DCCharacter character = service.findById(id);
        model.addAttribute("myChar", character);
        return "details";
    }
}
