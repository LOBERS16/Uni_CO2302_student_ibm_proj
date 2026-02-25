package com.group25.backend.service;

import com.group25.backend.model.Course;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

@Service
public class CourseCatalog {

    private final List<Course> courses;

    public CourseCatalog() {
        this.courses = loadCourses();
        System.out.println("Loaded courses: " + courses.size());
    }

    public List<Course> getCourses() {
        return courses;
    }

    private List<Course> loadCourses() {
        List<Course> list = new ArrayList<>();

        try (BufferedReader br = new BufferedReader(
                new InputStreamReader(
                        new ClassPathResource("courseList/courses.csv").getInputStream(),
                        StandardCharsets.UTF_8
                )
        )) {
            String line;
            boolean first = true;

            while ((line = br.readLine()) != null) {
                if (first) { first = false; continue; } // skip header row
                if (line.trim().isEmpty()) continue;

                String[] p = splitCsvLine(line);

                if (p.length < 5) {
                    System.out.println("Skipping bad CSV line: " + line);
                    continue;
                }

                String code = p[0].trim();
                String title = p[1].trim();
                String category = p[2].trim();
                int durationMins = Integer.parseInt(p[3].trim());
                String languages = p[4].trim();

                list.add(new Course(code, title, category, durationMins, languages));
            }

        } catch (Exception e) {
            System.out.println("courses.csv load failed: " + e.getMessage());
            e.printStackTrace();
        }

        return list;
    }

    private String[] splitCsvLine(String line) {
        List<String> parts = new ArrayList<>();
        StringBuilder current = new StringBuilder();
        boolean inQuotes = false;

        for (int i = 0; i < line.length(); i++) {
            char ch = line.charAt(i);

            if (ch == '"') {
                inQuotes = !inQuotes;
                continue;
            }

            if (ch == ',' && !inQuotes) {
                parts.add(current.toString());
                current.setLength(0);
                continue;
            }

            current.append(ch);
        }

        parts.add(current.toString());
        return parts.toArray(new String[0]);
    }
}