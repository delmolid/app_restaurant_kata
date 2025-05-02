import { Component } from '@angular/core';
import { MenuListComponent } from './views/menu/menulist.component';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [MenuListComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {
  title = 'frontend';
}
