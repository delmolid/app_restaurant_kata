# Application de Restaurant - Bon appétit.fr

Une application web moderne pour la gestion de menus de restaurant, construite avec Angular et Spring Boot.

## 🚀 Technologies Utilisées

### Frontend
- Angular 17
- TypeScript
- HTML/CSS
- RxJS

### Backend
- Spring Boot 3.2.3
- Java 17
- MySQL
- JPA/Hibernate

## 📋 Prérequis

- Node.js (v18 ou supérieur)
- Java JDK 17
- MySQL
- MAMP/XAMPP (pour la base de données)

## 🛠️ Installation

### Configuration de la Base de Données
1. Démarrer MAMP/XAMPP
2. Créer une base de données MySQL nommée `menudb`
3. Le script de création des tables se trouve dans `backend/src/main/resources/menudb.sql`

### Backend (Spring Boot)
```bash
cd backend
./gradlew bootRun
```
Le serveur backend démarre sur http://localhost:8080

### Frontend (Angular)
```bash
cd frontend
npm install
ng serve
```
L'application frontend est accessible sur http://localhost:4200

## 🌟 Fonctionnalités

- Affichage des menus disponibles
- Images des plats
- Descriptions détaillées
- Prix
- Interface utilisateur responsive

## 📁 Structure du Projet

```
app_restaurant_kata/
├── backend/                 # Application Spring Boot
│   ├── src/
│   │   ├── main/
│   │   │   ├── java/      # Code source Java
│   │   │   └── resources/ # Configuration et SQL
│   └── build.gradle       # Configuration Gradle
│
└── frontend/              # Application Angular
    ├── src/
    │   ├── app/          # Composants et services
    │   └── assets/       # Images et ressources statiques
    └── package.json      # Dépendances npm
```

## 🔧 Configuration

### Backend
Le fichier `application.properties` contient la configuration de :
- La base de données (port: 8889, user: root, password: root)
- Le port du serveur (8080)
- Les logs

### Frontend
Les services sont configurés pour communiquer avec le backend sur :
- URL de l'API : http://localhost:8080/api
- Port frontend : 4200

## 🚀 Démarrage rapide

1. Démarrer MAMP et activer MySQL
2. Lancer le backend : `cd backend && ./gradlew bootRun`
3. Lancer le frontend : `cd frontend && ng serve`
4. Ouvrir http://localhost:4200 dans le navigateur

## 👥 Contribution

1. Fork le projet
2. Créer une branche (`git checkout -b feature/AmazingFeature`)
3. Commit les changements (`git commit -m 'Add some AmazingFeature'`)
4. Push vers la branche (`git push origin feature/AmazingFeature`)
5. Ouvrir une Pull Request


## ✨ Auteur

Molid NOUR AWALEH

## 🐛 Résolution des problèmes courants

- Si erreur de connexion à la base de données : vérifier que MAMP est lancé et le port MySQL est 8889
- Si erreur CORS : vérifier que le backend est bien lancé sur le port 8080
- Si les menus ne s'affichent pas : vérifier les logs du backend et de la console du navigateur