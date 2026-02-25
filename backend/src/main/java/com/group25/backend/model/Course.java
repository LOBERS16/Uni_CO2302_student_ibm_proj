package com.group25.backend.model;

public class Course {

    private final String code;
    private final String title;
    private final String category;
    private final int durationMins;
    private final String languages;

    public Course(String code, String title, String category, int durationMins, String languages) {
        this.code = code;
        this.title = title;
        this.category = category;
        this.durationMins = durationMins;
        this.languages = languages;
    }

    public String getCode() { return code; }
    public String getTitle() { return title; }
    public String getCategory() { return category; }
    public int getDurationMins() { return durationMins; }
    public String getLanguages() { return languages; }
}