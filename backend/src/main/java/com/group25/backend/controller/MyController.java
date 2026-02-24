package com.group25.backend.controller;

import com.group25.skillsbuild_app.model.User;
import com.group25.skillsbuild_app.repo.UserRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MyController {
    @Autowired
    private UserRepository userRepository;
    private BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    // Redirect
    @GetMapping("/")
    public String home() {
        return "redirect:/login";   // loads login.jsp
    }

    //Login page
    @GetMapping("/login")
    public String login(HttpSession session) {
        if (session.getAttribute("user") != null) {
            return "redirect:/dashboard";
        }
        return "login";
    }

    // Register page
    @GetMapping("/register")
    public String register(HttpSession session) {
        if (session.getAttribute("user") != null) {
            return "redirect:/dashboard";
        }
        return "register";
    }

    // Handle register POST
    @PostMapping("/register")
    public String handleRegister(@RequestParam String username,
                                 @RequestParam String email,
                                 @RequestParam String password,
                                 Model model) {
        String special_Characters = (".*[!@#$%^&*()_+=\\[\\]{}|;:'\",.<>?/`~-].*");

        //When a user registers we can check and ensure they create a strong password:
        if(password.length() < 6) {
            model.addAttribute("error", "Password is too short");
            return "register";
        }
        if(!password.matches(special_Characters)) {
            model.addAttribute("error", "Password must contain at least one special character");
            return "register";
        }

        // Check if username exists
        if (userRepository.existsByUsername(username)) {
            model.addAttribute("error", "Username already exists");
            return "register";
        }

        // Check if email exists
        if (userRepository.existsByEmail(email)) {
            model.addAttribute("error", "Email already exists");
            return "register";
        }
        // Create and save new user
        String hashed_Password = passwordEncoder.encode(password);
        User newUser = new User(username, hashed_Password, email, "USER");
        userRepository.save(newUser);

        model.addAttribute("success", "Registration successful! Please login.");
        return "register";
    }

    // Handle login POST
    @PostMapping("/login")
    public String handleLogin(@RequestParam String username,
                              @RequestParam String password,
                              HttpSession session,
                              Model model) {
        User user = userRepository.findByUsername(username);

        if (user != null && passwordEncoder.matches(password, user.getPassword())) {
            session.setAttribute("user", user);
            return "redirect:/dashboard";
        } else {
            model.addAttribute("error", "Invalid username or password");
            return "login";
        }
    }

    // Dashboard page
    @GetMapping("/dashboard")
    public String showDashboard(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        model.addAttribute("username", user.getUsername());

        return "dashboard";   // loads dashboard.jsp
    }

    // Logout
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
}
