package com.group25.backend.controller;

import com.group25.backend.model.User;
import com.group25.backend.repo.UserRepository;
import com.group25.backend.service.TempCourseSelectionStore;
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
    @Autowired
    private TempCourseSelectionStore courseSelectionStore;
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
    @GetMapping("/courses")
    public String courses(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        return "coursePage";
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

        try {
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
        } catch (Exception e) {
            model.addAttribute("error", "Registration failed: " + e.getMessage());
            return "register";
        }
    }

    // Handle login POST
    @PostMapping("/login")
    public String handleLogin(@RequestParam String username,
                              @RequestParam String password,
                              HttpSession session,
                              Model model) {
        try {
            User user = userRepository.findByUsername(username);

            if (user != null && passwordEncoder.matches(password, user.getPassword())) {
                session.setAttribute("user", user);
                return "redirect:/dashboard";
            } else {
                model.addAttribute("error", "Invalid username or password");
                return "login";
            }
        } catch (Exception e) {
            model.addAttribute("error", "Login failed: " + e.getMessage());
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

    // Profile page - display current user profile
    @GetMapping("/profile")
    public String showProfile(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        model.addAttribute("user", user);
        model.addAttribute("points", courseSelectionStore.getPoints());
        return "profile";  // loads profile.jsp
    }

    // Handle profile update POST
    @PostMapping("/profile")
    public String updateProfile(HttpSession session,
                               @RequestParam(required = false) String username,
                               @RequestParam(required = false) String email,
                               @RequestParam(required = false) String password,
                               Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        try {
            // Update username if provided and not blank
            if (username != null && !username.trim().isEmpty()) {
                if (!user.getUsername().equals(username) && userRepository.existsByUsername(username)) {
                    model.addAttribute("user", user);
                    model.addAttribute("points", courseSelectionStore.getPoints());
                    model.addAttribute("error", "Username already exists");
                    return "profile";
                }
                user.setUsername(username);
            }

            // Update email if provided and not blank
            if (email != null && !email.trim().isEmpty()) {
                if (!user.getEmail().equals(email) && userRepository.existsByEmail(email)) {
                    model.addAttribute("user", user);
                    model.addAttribute("points", courseSelectionStore.getPoints());
                    model.addAttribute("error", "Email already exists");
                    return "profile";
                }
                user.setEmail(email);
            }

            // Update password if provided and not blank
            if (password != null && !password.trim().isEmpty()) {
                if (password.length() < 6) {
                    model.addAttribute("user", user);
                    model.addAttribute("points", courseSelectionStore.getPoints());
                    model.addAttribute("error", "Password must be at least 6 characters");
                    return "profile";
                }
                String hashed_Password = passwordEncoder.encode(password);
                user.setPassword(hashed_Password);
            }

            // Save updated user
            userRepository.save(user);
            session.setAttribute("user", user);

            model.addAttribute("user", user);
            model.addAttribute("points", courseSelectionStore.getPoints());
            model.addAttribute("success", "Profile updated successfully!");
            return "profile";
        } catch (Exception e) {
            model.addAttribute("user", user);
            model.addAttribute("points", courseSelectionStore.getPoints());
            model.addAttribute("error", "Update failed: " + e.getMessage());
            return "profile";
        }
    }

    // Logout
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }

    // Support page
    @GetMapping("/support")
    public String support() {
        return "support";  // loads support.jsp
    }

    // Feedback page - GET (show form)
    @GetMapping("/feedback")
    public String feedbackForm() {
        return "feedback";  // loads feedback.jsp
    }

    // Feedback submission - POST
    @PostMapping("/feedback")
    public String submitFeedback(HttpSession session,
                                @RequestParam(required = false) String name,
                                @RequestParam(required = false) String email,
                                @RequestParam(required = false) String subject,
                                @RequestParam(required = false) String message,
                                Model model) {
        model.addAttribute("success", "Thank you for your feedback! We appreciate your input.");
        return "feedback";
    }
}
