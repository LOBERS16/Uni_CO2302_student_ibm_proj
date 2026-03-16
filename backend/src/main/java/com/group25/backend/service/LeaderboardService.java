package com.group25.backend.service;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.QueryDocumentSnapshot;
import com.group25.backend.model.User;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.ArrayList;
import java.util.Comparator;

@Service
public class LeaderboardService {
    private final Firestore firestore;
    public LeaderboardService(Firestore firestore) {
        this.firestore = firestore;
    }
    public List<User> getLeaderboard() throws Exception{
        List<QueryDocumentSnapshot> documents = firestore.collection("users").get().get().getDocuments();
        List<User> users = new ArrayList<>();
        for(QueryDocumentSnapshot document: documents){
            User user = new User();
            user.setUsername(document.getString("username"));
            Long points = document.getLong("points");
            if(points != null){
                user.setPoints(points.intValue());
            }else{
                user.setPoints(0);
            }
            users.add(user);
        }
        users.sort(Comparator.comparingInt(User::getPoints).reversed());
        return users;
    }
}
