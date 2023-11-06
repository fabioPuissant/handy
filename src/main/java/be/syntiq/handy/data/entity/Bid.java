package be.syntiq.handy.data.entity;

import jakarta.persistence.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(name="bids")
public class Bid {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne
    @JoinColumn(name = "job_id")
    private JobPost jobPost;
    @ManyToOne
    @JoinColumn(name = "bid_by_user_id")
    private User bidByUser;
    private BigDecimal bidAmount;
    private LocalDateTime bidDate;
    private String status;
}
