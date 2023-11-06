package be.syntiq.handy.service;

import be.syntiq.handy.data.entity.Review;
import be.syntiq.handy.data.repository.ReviewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collection;

@Service
public class ReviewService {
    @Autowired
    private ReviewRepository reviewRepository;

    public void createReview(Review review) {
        this.reviewRepository.save(review);
        this.reviewRepository.flush();
    }

    public Collection<Review> getAllReviews() {
        return this.reviewRepository.findAll();
    }
}
