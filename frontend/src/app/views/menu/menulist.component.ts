import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HttpClientModule } from '@angular/common/http';
import { Menu } from '../../models/menu.model';
import { MenuService } from '../../services/api/menu.services';

@Component({
  selector: 'app-menu-list',
  standalone: true,
  imports: [CommonModule, HttpClientModule],
  templateUrl: './menulist.component.html',
  styleUrls: ['./menulist.component.css']
})
export class MenuListComponent implements OnInit {
  restaurantName = 'Bon appétit.fr';
  menus: Menu[] = [];
  loading = false;
  error: string | null = null;

  constructor(private menuService: MenuService) {
    console.log('MenuListComponent construit');
  }

  ngOnInit() {
    this.loadMenus();
  }

  loadMenus() {
    this.loading = true;
    this.error = null;
    
    this.menuService.getMenus().subscribe({
      next: (data) => {
        console.log('Données reçues du serveur:', data);
        if (Array.isArray(data)) {
          console.log('Nombre de menus reçus:', data.length);
          this.menus = data;
          this.loading = false;
        } else {
          console.error('Les données reçues ne sont pas un tableau:', data);
          this.error = 'Les données reçues ne sont pas un tableau';
          this.loading = false;
        }
      },
      error: (error) => {
        console.error('Erreur détaillée:', error);
        if (error.status) {
          console.error('Status:', error.status);
          console.error('StatusText:', error.statusText);
        }
        if (error.error) {
          console.error('Message d\'erreur:', error.error);
        }
        this.error = error;
        this.loading = false;
      }
    });
  }
}
