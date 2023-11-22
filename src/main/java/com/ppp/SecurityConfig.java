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
		http.csrf(csrf -> csrf.disable())
				.authorizeHttpRequests(
						(authorize) -> authorize
						.antMatchers("/pages-/**").permitAll()
						.antMatchers("/index").permitAll()
						.antMatchers("user-pages-register").permitAll()
						.antMatchers("/static/**").permitAll()
						.antMatchers("/users").permitAll()
						.antMatchers("user/pages-groupe-register/save").permitAll()
						.antMatchers("/Users")
						.hasRole("ADMIN"))
//				.formLogin(form -> form
//						.loginPage("/login")
//						.loginProcessingUrl("/login")
//						.defaultSuccessUrl("/users")
//						.permitAll())
				.logout(logout -> logout.logoutRequestMatcher(new AntPathRequestMatcher("/logout")).permitAll());
				
		return http.build();
		
	}

	@Bean
	public AuthenticationManager authManager(HttpSecurity http, PasswordEncoder passwordEncoder,
			UserDetailsService userDetailsService) throws Exception {
		return http.getSharedObject(AuthenticationManagerBuilder.class).userDetailsService(userDetailsService)
				.passwordEncoder(passwordEncoder).and().build();
	}
	
	 public void configure(WebSecurity web) throws Exception {
	        web
	            .ignoring()
	            .antMatchers("/assets/**");
	    }

}
