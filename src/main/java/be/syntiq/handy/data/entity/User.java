package be.syntiq.handy.data.entity;

import be.syntiq.handy.util.UserRole;
import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;
import java.util.Set;
import java.util.UUID;

@Entity
@Table(name = "users")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    private String username;
    private String email;

    @Column(name = "password_hash")
    private String passwordHash;

    @Column(name = "password_salt")
    private String passwordSalt;

    @Enumerated(EnumType.STRING)
    private UserRole role;

    @Column(name = "contact_info")
    private String contactInfo;

    @Column(name = "registration_date")
    private LocalDateTime registrationDate;

    @Column(name = "last_login_date")
    private LocalDateTime lastLoginDate;

    @Column(name = "user_status")
    private String userStatus;

    @OneToMany
    private Set<Review> reviews;

    @OneToMany
    private Set<JobPost> jobPosts;

    @OneToMany
    private Set<Bid> bids;
}
