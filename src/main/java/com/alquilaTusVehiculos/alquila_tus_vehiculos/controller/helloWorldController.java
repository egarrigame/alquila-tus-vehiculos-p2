package com.alquilaTusVehiculos.alquila_tus_vehiculos.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class helloWorldController {

    @GetMapping("/hello")
    public String hello() {
        return "¡Hola Mundo!";
    }
}

