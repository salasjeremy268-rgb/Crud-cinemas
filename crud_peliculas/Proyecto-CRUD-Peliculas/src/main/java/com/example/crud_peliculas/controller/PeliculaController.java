package com.example.crud_peliculas.controller;

import com.example.crud_peliculas.model.Pelicula;
import com.example.crud_peliculas.repository.PeliculaRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class PeliculaController {

    @Autowired
    private PeliculaRepository repository;

    // READ - Listar todas las películas
    @GetMapping("/")
    public String listar(Model model) {
        model.addAttribute("lista", repository.findAll());
        model.addAttribute("pelicula", new Pelicula()); // formulario vacío
        return "index";
    }

    // CREATE - Guardar nueva película
    @PostMapping("/guardar")
    public String guardar(@ModelAttribute Pelicula pelicula) {
        repository.save(pelicula);
        return "redirect:/";
    }

    // UPDATE - Cargar datos en el formulario para editar
    @GetMapping("/editar/{id}")
    public String editar(@PathVariable Long id, Model model) {
        Pelicula pelicula = repository.findById(id)
                .orElseThrow(() -> new RuntimeException("Película no encontrada: " + id));
        model.addAttribute("pelicula", pelicula);
        model.addAttribute("lista", repository.findAll());
        return "index";
    }

    // DELETE - Eliminar una película
    @GetMapping("/eliminar/{id}")
    public String eliminar(@PathVariable Long id) {
        repository.deleteById(id);
        return "redirect:/";
    }
}
