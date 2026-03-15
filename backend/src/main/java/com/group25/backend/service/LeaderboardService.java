package com.group25.backend.service;
import com.group25.backend.model.User;
import com.group25.backend.repo.UserRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LeaderboardService {
    private final UserRepository userRepository;
    public LeaderboardService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }
    public List<User> getLeaderboard() {
        return userRepository.findAllByOrderByPointsDesc();
    }
}
