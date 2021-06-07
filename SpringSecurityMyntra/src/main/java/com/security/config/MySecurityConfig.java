package com.security.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.password.PasswordEncoder;

@EnableWebSecurity
public class MySecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private DataSource dataSource;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth
		.jdbcAuthentication()
		.dataSource(dataSource)
		.usersByUsernameQuery("select name,password,enabled from formregister where name=?")
		.authoritiesByUsernameQuery("select name,roles from formregister where name=?")
		.passwordEncoder(passwordEncoder);
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
		.authorizeRequests()
		.antMatchers("/home-page").permitAll()
		.antMatchers("/cartpage").hasAuthority("USER")
		.antMatchers("/loginSuccess").hasAuthority("USER")
		.and().formLogin().loginPage("/myCustomLogin").loginProcessingUrl("/loginSuccess").permitAll()
		.and().httpBasic()
		.and().logout().permitAll()
		.and().exceptionHandling().accessDeniedPage("/accessDenied");

	}
}
