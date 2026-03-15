package com.group25.backend.service;

import com.group25.backend.model.CourseProgress;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@Service
public class TempCourseSelectionStore {

    private final Map<String, CourseProgress> progressMap = new ConcurrentHashMap<>();

    public void setStarted(String courseCode, boolean started) {
        CourseProgress progress = progressMap.computeIfAbsent(courseCode, k -> new CourseProgress());

        if (started) {
            progress.setStarted(true);
            if (progress.getStartedAt() == null) {
                progress.setStartedAt(LocalDateTime.now());
            }
        } else {
            progress.setStarted(false);
            progress.setStartedAt(null);

            progress.setFinished(false);
            progress.setFinishedAt(null);
        }
    }

    public void setFinished(String courseCode, boolean finished) {
        CourseProgress progress = progressMap.computeIfAbsent(courseCode, k -> new CourseProgress());

        if (finished) {
            if (!progress.isStarted()) {
                progress.setStarted(true);
                if (progress.getStartedAt() == null) {
                    progress.setStartedAt(LocalDateTime.now());
                }
            }

            progress.setFinished(true);
            if (progress.getFinishedAt() == null) {
                progress.setFinishedAt(LocalDateTime.now());
            }
        } else {
            progress.setFinished(false);
            progress.setFinishedAt(null);
        }
    }

    public CourseProgress getProgress(String courseCode) {
        return progressMap.getOrDefault(courseCode, new CourseProgress());
    }

    public Map<String, CourseProgress> getAllProgress() {
        return Map.copyOf(progressMap);
    }

    public int getFinishedPoints() {
        int count = 0;
        for (CourseProgress progress : progressMap.values()) {
            if (progress.isFinished()) {
                count++;
            }
        }
        return count;
    }

    public void clear() {
        progressMap.clear();
    }
}