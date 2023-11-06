package be.syntiq.handy.data.entity;

import jakarta.persistence.*;

import java.util.Set;

@Entity
@Table(name= "categories")
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String description;
    @OneToMany(mappedBy = "category")
    private Set<JobPost> jobPosts;

}
