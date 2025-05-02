package backend.exemple.backend.controllers;

import backend.exemple.backend.models.Menu;
import backend.exemple.backend.services.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;

@RestController
@RequestMapping("/api")
public class MenuController {
    
    private final MenuService menuService;

    @Autowired
    public MenuController(MenuService menuService) {
        this.menuService = menuService;
    }

    @GetMapping("/menu")
    public ResponseEntity<List<Menu>> getAllMenu() {
        List<Menu> menusARecuperer = 
            menuService.getAllMenu()
                .stream()
                .filter(menu -> menu.getId() == 1).
                toList();
        return ResponseEntity.ok(menuService.getAllMenu());
    }
} 