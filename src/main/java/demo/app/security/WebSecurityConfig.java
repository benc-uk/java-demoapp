package demo.app.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.oauth2.client.oidc.userinfo.OidcUserRequest;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserService;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;

@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

  @Autowired(required = false)
  private OAuth2UserService<OidcUserRequest, OidcUser> oidcUserService;

  @Override
  protected void configure(HttpSecurity http) throws Exception {
    if (oidcUserService != null) {
      http
          .authorizeRequests()
          .antMatchers("/user").authenticated()
          .antMatchers("/**").permitAll()
          .and()
          .oauth2Login()
          .userInfoEndpoint()
          .oidcUserService(oidcUserService);
    } else {
      http
          .authorizeRequests()
          .antMatchers("/**").permitAll();
    }
  }
}