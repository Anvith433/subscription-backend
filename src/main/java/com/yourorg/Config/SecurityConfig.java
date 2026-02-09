package com.yourorg.Config;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
@Configuration 
@EnableWebSecurity
public class SecurityConfig {

    @Autowired 
    private UserDetailsService userDetailsService;

    @Bean
    public SecurityFilterChain filter (HttpSecurity http) throws Exception{
     return http
    .csrf(customizer -> customizer.disable())
    
    .authorizeHttpRequests(Request->Request.anyRequest().authenticated())
    .httpBasic(Customizer.withDefaults())
    .sessionManagement(session ->session.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
    .build();
    }

    @Bean 
    public PasswordEncoder passwordEncoder()
    {
        return new BCryptPasswordEncoder();
    }
    


    
    
}
