package be.syntiq.handy.data.entity;

import jakarta.persistence.*;
import lombok.*;
import org.springframework.cglib.core.Local;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Set;
import java.util.UUID;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class JobPost {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @ManyToOne
    @JoinColumn(name = "posted_by_user_id")
    private User postedByUser;

    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;

    private String title;
    private String description;
    private LocalDateTime postDate;
    private LocalDateTime startDate;
    private LocalDateTime endDate;
    private String status;


    @OneToOne
    @JoinColumn(name = "accepted_bid_id")
    private Bid acceptedBid;

    @OneToMany
    @JoinColumn(name = "job_post")
    private Set<Bid> bids;

    private String location;
    private BigDecimal estimatedBudget;
    private BigDecimal actualCost;
}
