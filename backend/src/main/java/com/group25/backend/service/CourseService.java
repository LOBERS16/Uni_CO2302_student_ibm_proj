package org.example.service;

import org.example.model.Course;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

@Service
public class CourseService {
    private final ConcurrentHashMap<Long, Course> courses = new ConcurrentHashMap<>();

    public Course startCourse(String name, String courseId) {
        Course course = new Course(name, courseId);
        courses.put(course.getId(), course);
        return course;
    }

    public void pauseCourse(Long id) {
        Course course = courses.get(id);
        if (course != null && course.getStatus() == Course.CourseStatus.ACTIVE) {
            course.pause();
        }
    }

    public void resumeCourse(Long id) {
        Course course = courses.get(id);
        if (course != null && course.getStatus() == Course.CourseStatus.PAUSED) {
            course.resume();
        }
    }

    public void completeCourse(Long id) {
        Course course = courses.get(id);
        if (course != null && course.getStatus() != Course.CourseStatus.COMPLETED) {
            course.complete();
        }
    }

    public List<Course> getAllCourses() {
        return new ArrayList<>(courses.values());
    }

    public List<Course> getActiveCourses() {
        return courses.values().stream()
                .filter(c -> c.getStatus() != Course.CourseStatus.COMPLETED)
                .toList();
    }

    public Course getCourse(Long id) {
        return courses.get(id);
    }
}