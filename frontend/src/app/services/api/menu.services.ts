import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { Observable, catchError, throwError } from 'rxjs';
import { Menu } from '../../models/menu.model';

@Injectable({
  providedIn: 'root'
})
export class MenuService {
  private apiUrl = 'http://localhost:8080/api/menu';

  constructor(private http: HttpClient) { }

  getMenus(): Observable<Menu[]> {
    return this.http.get<Menu[]>(this.apiUrl)
      .pipe(
        catchError(this.handleError)
      );
  }

  private handleError(error: HttpErrorResponse) {
    let errorMessage = 'Une erreur s\'est produite';
    if (error.error instanceof ErrorEvent) {
      errorMessage = `Erreur client: ${error.error.message}`;
    } else {
      errorMessage = `Erreur serveur: ${error.status} - ${error.message}`;
    }
    console.error(errorMessage);
    return throwError(() => errorMessage);
  }
}
