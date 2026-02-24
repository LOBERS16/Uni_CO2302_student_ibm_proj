package com.example.cw1.model;

public class Course{

    private String code;
    private String title;
    private String category;
    private String difficulty;
    private int durationMins;

    public Course(String code, String title, String category, String difficulty, int durationMins) {
        this.code = code;
        this.title = title;
        this.category = category;
        this.difficulty = difficulty;
        this.durationMins = durationMins;
    }

    public String getCode() { return code; }
    public String getTitle() { return title; }
    public String getCategory() { return category; }
    public String getDifficulty() { return difficulty; }
    public int getDurationMins() { return durationMins; }
}