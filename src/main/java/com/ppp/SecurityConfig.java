package com.ppp;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
	    return http.csrf(csrf -> csrf.disable())
	            .authorizeRequests(authorize -> authorize
              		.antMatchers("/assets/**").permitAll()
	            	.antMatchers("/login").permitAll()
	            	.anyRequest().permitAll()
	            )
	    
	            .formLogin(form -> form
	                .loginPage("/login")
	                .usernameParameter("username")
	                .passwordParameter("password")
	                .defaultSuccessUrl("/")
	                .failureUrl("/login?error=true")
	            )
	            .logout(logout -> logout
	                .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
	                .logoutSuccessUrl("/login")
	                .invalidateHttpSession(true)
	                .deleteCookies("JSESSIONID")
	                .permitAll()
	            )
	            
	            .build();
	}

	@Bean
	public AuthenticationManager authManager(HttpSecurity http, PasswordEncoder passwordEncoder,
			UserDetailsService userDetailsService) throws Exception {
		return http.getSharedObject(AuthenticationManagerBuilder.class).userDetailsService(userDetailsService)
				.passwordEncoder(passwordEncoder).and().build();
	}
	
//	public void configure(WebSecurity web) throws Exception {
//	    web.ignoring()
//	       .antMatchers("/assets/**", "/css/**", "/js/**", "/images/**", "/assets/");
//	}


}
