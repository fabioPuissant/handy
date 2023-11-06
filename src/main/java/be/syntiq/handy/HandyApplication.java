package be.syntiq.handy;

import be.syntiq.handy.data.entity.Review;
import be.syntiq.handy.data.entity.User;
import be.syntiq.handy.data.repository.ReviewRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;

import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.UUID;

@SpringBootApplication
public class HandyApplication {

	public static void main(String[] args) {
		SpringApplication.run(HandyApplication.class, args);
	}
	@Bean
	public CorsFilter corsFilter() {
		UrlBasedCorsConfigurationSource urlBasedCorsConfigurationSource = new UrlBasedCorsConfigurationSource();
		CorsConfiguration corsConfig = new CorsConfiguration();
		corsConfig.setAllowCredentials(true);
		corsConfig.setAllowedOrigins(Arrays.asList("http://localhost:3000", "http://localhost:4200"));
		corsConfig.setAllowedHeaders(Arrays.asList("Origin", "Access-Control-Allow-Origin", "Content-Type", "Accept",
				"JWT-Token", "Authorization", "Origin Accept",
				"X-Requested-With", "Access-Control-Request-Method", "Access-Control-Request-Headers"));
		corsConfig.setExposedHeaders(Arrays.asList("Origin", "Content-Type", "Accept", "Jwt-Token", "Authorization",
				"Access-Control-Allow-Origin", "Access-Control-Allow-Origin", "Access-Control-Allow-Credentials", "Filename"));
		corsConfig.setAllowedMethods(Arrays.asList("GET", "POST", "DELETE", "PATCH", "OPTIONS", "PUT"));
		urlBasedCorsConfigurationSource.registerCorsConfiguration("/**", corsConfig);

		return new CorsFilter(urlBasedCorsConfigurationSource);
	}
/*
	/**
	 * This method seeds the database with data
	 * @param reviewRepository
	 * @return CommandLineRunner

	@Bean
	CommandLineRunner run (ReviewRepository reviewRepository) {
		User poster =  User.builder()
				.email("jane.doe@gmail.com")
				.username("janeyDoDo")
				.build();
		User handy =  User.builder()
				.email("john.doe@gmail.com")
				.username("johnny_does")
				.build();

		return args -> {

			reviewRepository.save(
					new Review(
							null, "first review", "some description of the first review",
							LocalDateTime.now(), LocalDateTime.now(),handy, poster,
							null
					)
			);			reviewRepository.save(
					new Review(
							null, "second review", "some description of the second review",
							LocalDateTime.now(), LocalDateTime.now()
					)
			);			reviewRepository.save(
					new Review(
							null, "third review", "some description of the third review",
							LocalDateTime.now(), LocalDateTime.now()
					)
			);
		};
	}
	*/
}
