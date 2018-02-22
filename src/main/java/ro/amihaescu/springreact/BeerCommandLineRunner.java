package ro.amihaescu.springreact;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;
import ro.amihaescu.springreact.model.Beer;
import ro.amihaescu.springreact.repository.BeerRepository;

import java.util.stream.Stream;

@Component
public class BeerCommandLineRunner implements CommandLineRunner {

    @Autowired
    private BeerRepository repository;

    @Override
    public void run(String... strings) throws Exception {
        Stream.of("Kentucky Brunch Brand Stout", "Good Morning", "Very Hazy", "King Julius",
                "Budweiser", "Coors Light", "PBR").forEach(name ->
                repository.save(new Beer(name)));

        repository.findAll().forEach(System.out::println);
    }
}
