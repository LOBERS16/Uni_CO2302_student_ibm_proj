package org.example.controller;

import org.example.model.Course;
import org.example.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class CourseController {

    @Autowired
    private CourseService courseService;

    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("activeCourses", courseService.getActiveCourses());
        model.addAttribute("allCourses", courseService.getAllCourses());
        return "index";
    }

    @PostMapping("/course/start")
    public String startCourse(@RequestParam String name, @RequestParam(required = false) String courseId) {
        courseService.startCourse(name, courseId);
        return "redirect:/";
    }

    @PostMapping("/course/{id}/pause")
    public String pauseCourse(@PathVariable Long id) {
        courseService.pauseCourse(id);
        return "redirect:/";
    }

    @PostMapping("/course/{id}/resume")
    public String resumeCourse(@PathVariable Long id) {
        courseService.resumeCourse(id);
        return "redirect:/";
    }

    @PostMapping("/course/{id}/complete")
    public String completeCourse(@PathVariable Long id) {
        courseService.completeCourse(id);
        return "redirect:/";
    }
}