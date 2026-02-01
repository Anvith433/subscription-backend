package com.yourorg.Subscriptions;
import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.*;
import com.yourorg.Subscriptions.Subscription;

@Repository
public interface SubscriptionRepository extends JpaRepository<Subscription, Long> {
    Optional<Subscription> findByName(String name);
    Optional<Subscription> findById(long id);
    Subscription save(Subscription subscription);
    Subscription deleteById(int id);
    
}
