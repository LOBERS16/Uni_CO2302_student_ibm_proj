package com.group25.backend.service;

import org.springframework.stereotype.Service;

import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

@Service
public class TempCourseSelectionStore {

    // Shared "global" set (thread-safe)
    private final Set<String> selectedCodes = ConcurrentHashMap.newKeySet();

    public void setSelected(String courseCode, boolean selected) {
        if (selected) selectedCodes.add(courseCode);
        else selectedCodes.remove(courseCode);
    }

    public boolean isSelected(String courseCode) {
        return selectedCodes.contains(courseCode);
    }

    public int getPoints() {
        return selectedCodes.size();
    }

    public Set<String> getSelectedCodes() {
        return Set.copyOf(selectedCodes);
    }

    public void clear() {
        selectedCodes.clear();
    }
}