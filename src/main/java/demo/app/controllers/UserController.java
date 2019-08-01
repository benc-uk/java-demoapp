package demo.app.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.core.oidc.user.DefaultOidcUser;

@Controller
public class UserController {

    @GetMapping("/user")
    public String getUser(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();

        model.addAttribute("username", auth.getName());
        if(auth.getName() != "anonymousUser") {
            DefaultOidcUser userDetails = (DefaultOidcUser) auth.getPrincipal();
            model.addAttribute("details", userDetails.getAttributes());
        }

        return "user";
    }
}