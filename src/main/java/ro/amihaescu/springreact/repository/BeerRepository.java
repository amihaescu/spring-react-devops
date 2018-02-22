package ro.amihaescu.springreact.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.CrossOrigin;
import ro.amihaescu.springreact.model.Beer;

public interface BeerRepository extends JpaRepository<Beer, Long> {
}
