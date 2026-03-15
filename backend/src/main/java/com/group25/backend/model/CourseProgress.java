package com.group25.backend.model;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class CourseProgress {

    private boolean started;
    private boolean finished;
    private LocalDateTime startedAt;
    private LocalDateTime finishedAt;

    public boolean isStarted() {
        return started;
    }

    public boolean isFinished() {
        return finished;
    }

    public LocalDateTime getStartedAt() {
        return startedAt;
    }

    public LocalDateTime getFinishedAt() {
        return finishedAt;
    }

    public void setStarted(boolean started) {
        this.started = started;
    }

    public void setFinished(boolean finished) {
        this.finished = finished;
    }

    public void setStartedAt(LocalDateTime startedAt) {
        this.startedAt = startedAt;
    }

    public void setFinishedAt(LocalDateTime finishedAt) {
        this.finishedAt = finishedAt;
    }

    private static final DateTimeFormatter FORMATTER = DateTimeFormatter.ofPattern("HH:mm dd/MM/yyyy");

    public String getStartedAtFormatted() {
        return startedAt == null ? null : startedAt.format(FORMATTER);
    }

    public String getFinishedAtFormatted() {
        return finishedAt == null ? null : finishedAt.format(FORMATTER);
    }
}