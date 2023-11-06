package be.syntiq.handy.data.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotEmpty;
import lombok.*;

import java.time.LocalDateTime;
import java.util.UUID;

@Entity
@Table(name="reviews")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class Review {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID reviewId;
    private String title;
    private LocalDateTime reviewDate;
    @NotEmpty
    private String comment;

    @ManyToOne
    @JoinColumn(name = "reviewed_user_id")
    private User reviewed_user;

    @ManyToOne
    @JoinColumn(name = "reviewed_by_user_id")
    private User reviewed_by_user;

    @ManyToOne
    @JoinColumn(name = "job_id")
    private JobPost jobPost;

    @Min(0)
    @Max(5)
    @Column(name = "rating")
    private int rating;


}
