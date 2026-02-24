package com.example.cw1.controller;

import com.example.cw1.model.Course;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Locale;

@Controller
public class CourseController {

    // sample courses
    private final List<Course> courses = List.of(
            new Course("SB-AI-101", "AI Foundations", "AI", "Beginner", 150),
            new Course("SB-AI-120", "AI Ethics Basics", "AI", "Beginner", 80),
            new Course("SB-AI-210", "Intro to Machine Learning", "AI", "Beginner", 180),
            new Course("SB-BC-101", "Blockchain Essentials", "Blockchain", "Beginner", 120),
            new Course("SB-CL-100", "Cloud Fundamentals", "Cloud", "Beginner", 140),
            new Course("SB-CY-110", "Cybersecurity Basics", "Cybersecurity", "Beginner", 160),
            new Course("SB-PS-010", "Communication for Tech", "Professional Skills", "Beginner", 60),
            new Course("SB-PS-020", "CV and LinkedIn Basics", "Professional Skills", "Beginner", 45)
    );

    @GetMapping("/courses")
    public String courses(
            @RequestParam(required = false) String searchText,
            @RequestParam(required = false) String category,
            @RequestParam(required = false) String difficulty,
            @RequestParam(required = false) Integer maxDurationMins,
            Model model
    ) {
        // filter
        List<Course> results = new ArrayList<>();

        for (Course course : courses) {
            if (!matchesSearch(course, searchText)) continue;
            if (!matchesExactOrAny(course.getCategory(), category)) continue;
            if (!matchesExactOrAny(course.getDifficulty(), difficulty)) continue;
            if (!matchesMaxDuration(course.getDurationMins(), maxDurationMins)) continue;
            results.add(course);
        }

        // sort
        results.sort(Comparator.comparing(c -> c.getCode().toLowerCase(Locale.ROOT)));

        // menu state line
        String menuState =
                "STATE: Course Hub -> Search & Filter"
                        + " | Search=\"" + safe(searchText) + "\""
                        + " | Category=" + safeAny(category)
                        + " | Difficulty=" + safeAny(difficulty)
                        + " | Duration<=" + (maxDurationMins == null ? "Any" : maxDurationMins + " mins")
                        + " | Results=" + results.size();

        // page data
        model.addAttribute("menuState", menuState);
        model.addAttribute("courses", results);

        // keep input values
        model.addAttribute("searchText", searchText);
        model.addAttribute("category", category);
        model.addAttribute("difficulty", difficulty);
        model.addAttribute("maxDurationMins", maxDurationMins);

        // dropdowns
        model.addAttribute("categories", List.of("AI", "Blockchain", "Cloud", "Cybersecurity", "Professional Skills"));
        model.addAttribute("difficulties", List.of("Beginner", "Intermediate", "Advanced"));

        return "courses";
    }

    private boolean matchesSearch(Course course, String searchText) {
        if (searchText == null || searchText.trim().isEmpty()) return true;

        String s = searchText.trim().toLowerCase(Locale.ROOT);

        return course.getCode().toLowerCase(Locale.ROOT).contains(s)
                || course.getTitle().toLowerCase(Locale.ROOT).contains(s);
    }

    private boolean matchesExactOrAny(String value, String filter) {
        if (filter == null || filter.trim().isEmpty()) return true;
        return value.equalsIgnoreCase(filter.trim());
    }

    private boolean matchesMaxDuration(int durationMins, Integer maxDurationMins) {
        if (maxDurationMins == null) return true;
        return durationMins <= maxDurationMins;
    }

    private String safe(String text) {
        return (text == null) ? "" : text.trim();
    }

    private String safeAny(String text) {
        return (text == null || text.trim().isEmpty()) ? "Any" : text.trim();
    }
}