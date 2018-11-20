package ro.amihaescu.springreact.controller;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import ro.amihaescu.springreact.model.Beer;
import ro.amihaescu.springreact.repository.BeerRepository;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@RestController
public class BeerController {

    private BeerRepository repository;

    public BeerController(BeerRepository repository) {
        this.repository = repository;
    }

    @GetMapping("/beers")
    @CrossOrigin
    public List<Beer> allBeers(){
        return repository.findAll();
    }

    @GetMapping("/good-beers")
    @CrossOrigin
    public List<Beer> goodBeers(){
        return repository.findAll()
                .stream()
                .filter(beer -> "Budweiser".equals(beer.getName()))
                .collect(Collectors.toList());
    }

}
