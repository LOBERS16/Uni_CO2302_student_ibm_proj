package org.example.model;

import java.time.LocalDateTime;
import java.time.Duration;

public class Course {
    private Long id;
    private String name;
    private String courseId;
    private LocalDateTime startTime;
    private LocalDateTime pauseTime;
    private long totalSeconds;
    private CourseStatus status;
    private static Long idCounter = 0L;

    public enum CourseStatus {
        ACTIVE, PAUSED, COMPLETED
    }

    public Course() {
        this.id = ++idCounter;
        this.status = CourseStatus.ACTIVE;
        this.startTime = LocalDateTime.now();
        this.totalSeconds = 0;
    }

    public Course(String name, String courseId) {
        this();
        this.name = name;
        this.courseId = courseId;
    }

    public void pause() {
        if (status == CourseStatus.ACTIVE) {
            this.status = CourseStatus.PAUSED;
            this.pauseTime = LocalDateTime.now();
            updateTotalTime();
        }
    }

    public void resume() {
        if (status == CourseStatus.PAUSED) {
            this.status = CourseStatus.ACTIVE;
            this.startTime = LocalDateTime.now();
        }
    }

    public void complete() {
        if (status == CourseStatus.ACTIVE) {
            updateTotalTime();
        }
        this.status = CourseStatus.COMPLETED;
    }

    private void updateTotalTime() {
        if (pauseTime != null && startTime != null) {
            totalSeconds += Duration.between(startTime, pauseTime).getSeconds();
        }
    }

    public String getFormattedTime() {
        long hours = totalSeconds / 3600;
        long minutes = (totalSeconds % 3600) / 60;
        long seconds = totalSeconds % 60;
        return String.format("%02d:%02d:%02d", hours, minutes, seconds);
    }

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getCourseId() { return courseId; }
    public void setCourseId(String courseId) { this.courseId = courseId; }
    public LocalDateTime getStartTime() { return startTime; }
    public void setStartTime(LocalDateTime startTime) { this.startTime = startTime; }
    public LocalDateTime getPauseTime() { return pauseTime; }
    public void setPauseTime(LocalDateTime pauseTime) { this.pauseTime = pauseTime; }
    public long getTotalSeconds() { return totalSeconds; }
    public void setTotalSeconds(long totalSeconds) { this.totalSeconds = totalSeconds; }
    public CourseStatus getStatus() { return status; }
    public void setStatus(CourseStatus status) { this.status = status; }
}