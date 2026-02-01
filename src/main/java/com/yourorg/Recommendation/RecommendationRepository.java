package com.yourorg.Recommendation;
import com.yourorg.Recommendation.Recommendation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.*;

@Repository
public interface RecommendationRepository extends JpaRepository<Recommendation, Long> {
    Optional<Recommendation> findByTitle(String title);
    Optional<Recommendation> findById(long id);
    Recommendation save(Recommendation recommendation);

    Recommendation deleteById(int id);


    
}
