package com.bst.ticket.config;

import com.bst.ticket.oauth.PrincipalOauth2UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.servlet.PathRequest;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.access.hierarchicalroles.RoleHierarchy;
import org.springframework.security.access.hierarchicalroles.RoleHierarchyImpl;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import jakarta.servlet.DispatcherType;
import lombok.RequiredArgsConstructor;

@EnableWebSecurity // 스프링 시큐리티 필터가 스프링 필터 체인에 등록됨
@EnableMethodSecurity
@Configuration
@RequiredArgsConstructor
public class SecurityConfig {

    @Autowired
    private PrincipalOauth2UserService principalOauth2UserService;

    @Bean
    public static BCryptPasswordEncoder bCryptPasswordEncoder(){
        return new BCryptPasswordEncoder();
    }

    @Bean
    RoleHierarchy roleHierarchy(){
        RoleHierarchyImpl roleHierarchy = new RoleHierarchyImpl();
        //큰 권한 순서로 '>'를 사용하여 입력
        roleHierarchy.setHierarchy("ROLE_ADMIN > ROLE_MANAGER > ROLE_USER");
        return roleHierarchy;
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
                .csrf(AbstractHttpConfigurer::disable)
                .authorizeHttpRequests(requests -> requests
                        .dispatcherTypeMatchers(DispatcherType.FORWARD).permitAll()
//                        .requestMatchers("/user/**").authenticated()
//                        .requestMatchers("/admin/**").hasRole("ADMIN")
                        .requestMatchers("/reservation/**").authenticated()
//                        .requestMatchers("/auth/**").permitAll()
                        .requestMatchers("/**").permitAll()
                        .anyRequest().authenticated())
                .formLogin(login -> login
                        .loginPage("/login")
                        .loginProcessingUrl("/loginProcess") // 로그인 버튼을 요청했을 때
                        .usernameParameter("mbr_id")
                        .passwordParameter("mbr_pwd")
                        .failureUrl("/login-error") // 비번이 틀렸을 때
                        .defaultSuccessUrl("/", true)
                        .permitAll())
                .oauth2Login(oauth -> oauth
                        .loginPage("/login")            // 구글로그인 완료된 후 후처리가 필요함
                        . userInfoEndpoint(end -> end
                                .userService(principalOauth2UserService))
                                )
                .logout(logout -> logout
                        .logoutSuccessUrl("/")
                        .permitAll())
                .exceptionHandling(exception -> exception.accessDeniedPage("/access-denied"));

        return http.build();
    }

    // resources 폴더 부분 적용코드
    @Bean
    public WebSecurityCustomizer webSecurityCustomizer() {
        return (web) -> web.ignoring()
                .requestMatchers(PathRequest.toStaticResources().atCommonLocations());
    }
}