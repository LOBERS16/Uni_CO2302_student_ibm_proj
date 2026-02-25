package com.group25.backend.controller;

// temp transfer data
import com.group25.backend.service.TempCourseSelectionStore;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.group25.backend.model.Course;
import com.group25.backend.service.CourseCatalog;
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

    private final CourseCatalog courseCatalog;
    private final TempCourseSelectionStore selectionStore;

    public CourseController(CourseCatalog courseCatalog, TempCourseSelectionStore selectionStore) {
        this.courseCatalog = courseCatalog;
        this.selectionStore = selectionStore;
    }

    @GetMapping("/courses_list")
    public String courses(
            @RequestParam(required = false) String searchText,
            @RequestParam(required = false) String category,
            @RequestParam(required = false) Integer maxDurationMins,
            Model model
    ) {
        List<Course> results = new ArrayList<>();

        for (Course course : courseCatalog.getCourses()) {
            if (!matchesSearch(course, searchText)) continue;
            if (!matchesExactOrAny(course.getCategory(), category)) continue;
            if (!matchesMaxDuration(course.getDurationMins(), maxDurationMins)) continue;
            results.add(course);
        }

        results.sort(Comparator.comparing(c -> c.getCode().toLowerCase(Locale.ROOT)));

        String menuState =
                "Search & Filter"
                        + " | Search=\"" + safe(searchText) + "\""
                        + " | Category=" + safeAny(category)
                        + " | Duration<=" + (maxDurationMins == null ? "Any" : maxDurationMins + " mins")
                        + " | Results=" + results.size();

        model.addAttribute("menuState", menuState);
        model.addAttribute("courses", results);

        model.addAttribute("searchText", searchText);
        model.addAttribute("category", category);
        model.addAttribute("maxDurationMins", maxDurationMins);

        // temp point score
        model.addAttribute("points", selectionStore.getPoints());
        model.addAttribute("selectedCodes", selectionStore.getSelectedCodes());

        model.addAttribute("categories", List.of(
                "Artificial Intelligence",
                "Artificial Intelligence Labs",
                "Cybersecurity",
                "Data Science",
                "Cloud"
        ));

        return "courses"; // resolves to /WEB-INF/views/courses.jsp if prefix/suffix set
    }

    private boolean matchesSearch(Course course, String searchText) {
        if (searchText == null || searchText.trim().isEmpty()) return true;

        String s = searchText.trim().toLowerCase(Locale.ROOT);

        return course.getCode().toLowerCase(Locale.ROOT).contains(s)
                || course.getTitle().toLowerCase(Locale.ROOT).contains(s);
    }

    private boolean matchesExactOrAny(String value, String filter) {
        if (filter == null || filter.trim().isEmpty()) return true;
        return value != null && value.equalsIgnoreCase(filter.trim());
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

    @PostMapping("/courses_list/tick")
    @ResponseBody
    public int tickCourse(@RequestParam String code, @RequestParam boolean checked) {
        selectionStore.setSelected(code, checked);

        int points = selectionStore.getPoints();
        System.out.println("[TICK] code=" + code + " checked=" + checked
                + " | points=" + points
                + " | selected=" + selectionStore.getSelectedCodes());

        return points;
    }
}