package backend.exemple.backend.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import backend.exemple.backend.models.Menu;

@Repository
public interface MenuRepository extends JpaRepository<Menu, Long> {

    
}
