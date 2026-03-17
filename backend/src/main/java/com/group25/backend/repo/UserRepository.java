package com.group25.backend.repo;

import com.google.cloud.firestore.DocumentSnapshot;
import com.google.cloud.firestore.Firestore;
import com.google.firebase.cloud.FirestoreClient;
import com.group25.backend.model.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.Map;

@Repository
public class UserRepository {

    private final BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

    public boolean existsByUsername(String username) throws Exception {
        Firestore db = FirestoreClient.getFirestore();
        DocumentSnapshot doc = db.collection("users").document(username).get().get();
        return doc.exists();
    }

    public boolean existsByEmail(String email) throws Exception {
        Firestore db = FirestoreClient.getFirestore();
        var snapshot = db.collection("users").whereEqualTo("email", email).get().get();
        return !snapshot.isEmpty();
    }

    public String saveUser(User user) throws Exception {
        Firestore db = FirestoreClient.getFirestore();


        Map<String, Object> data = new HashMap<>();
        data.put("username", user.getUsername());
        data.put("email", user.getEmail());
        data.put("password", user.getPassword());
        data.put("points", 0);

        db.collection("users").document(user.getUsername()).set(data).get();
        return "User " + user.getUsername() + " saved";
    }

    public User getUser(String username) throws Exception {
        Firestore db = FirestoreClient.getFirestore();
        DocumentSnapshot doc = db.collection("users").document(username).get().get();
        if (doc.exists()) {
            Map<String, Object> data = doc.getData();
            User user = new User();
            user.setUsername((String) data.get("username"));
            user.setEmail((String) data.get("email"));
            user.setPassword((String) data.get("password"));
            user.setPoints(((Long) data.get("points")).intValue());
            return user;
        }
        return null;
    }

    public void updateUserPoints(String username, int points) throws Exception {
        Firestore db = FirestoreClient.getFirestore();
        db.collection("users").document(username).update("points", points).get();
    }

    // JPA-like methods for compatibility
    public void save(User user) throws Exception {
        saveUser(user);
    }

    public User findByUsername(String username) throws Exception {
        return getUser(username);
    }
}