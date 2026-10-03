package com.csc340.conan_api.characters;

public enum Roles {
    DETECTIVE("Detective"),
    CIVILIAN("Civilian"),
    FBI("FBI"),
    BLACK_ORGANIZATION("Black Organization"),
    POLICE("Police");


    private final String displayName;

    Roles(String displayName) {
        this.displayName = displayName;
    } 

    @Override
    public String toString() {
        return displayName;
    }
    
}
