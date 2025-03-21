package backend.exemple.backend.models;

import jakarta.persistence.*;

@Entity
@Table(name = "menu")
public class Menu {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "menu_id")
    private Long id;
    
    @Column(name = "nom")
    private String nom;
    
    @Column(name = "image")
    private String image;
    
    @Column(name = "description")
    private String description;
    
    @Column(name = "prix")
    private double prix;

    // Getters
    public Long getId() {
        return id;
    }

    public String getNom() {
        return nom;
    }

    public String getImage() {
        return image;
    }   

    public String getDescription() {
        return description;
    }

    public double getPrix() {
        return prix;
    }
}
