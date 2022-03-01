package co.udea.grades.api.repository;

import co.udea.grades.api.model.Hero;
import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.JpaRepository;

@Repository
public interface HeroRepository extends JpaRepository<Hero, Integer> {
    Hero findByName(String name);
}
