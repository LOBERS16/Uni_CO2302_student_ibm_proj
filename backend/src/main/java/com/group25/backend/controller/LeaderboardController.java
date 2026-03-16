package com.group25.backend.controller;

import com.group25.backend.service.LeaderboardService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LeaderboardController {
    private final LeaderboardService leaderboardService;
    public LeaderboardController(LeaderboardService leaderboardService) {
        this.leaderboardService = leaderboardService;
    }
    @GetMapping("/leaderboard")
    public String showLeaderboard(Model model) throws Exception {
        model.addAttribute("users",leaderboardService.getLeaderboard());
        return "leaderboard";
    }
}
