package backend.exemple.backend.services;

import backend.exemple.backend.repositories.MenuRepository;
import backend.exemple.backend.models.Menu;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MenuService {
    private final MenuRepository menuRepository;

    @Autowired
    public MenuService(MenuRepository menuRepository) {
        this.menuRepository = menuRepository;
    }

    public List<Menu> getAllMenu() {
        return menuRepository.findAll();
    }
}
