package com.group25.backend.service;

import com.google.cloud.firestore.Firestore;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ExecutionException;

@Service
public class FirestoreService {

    private final Firestore firestore;

    public FirestoreService(Firestore firestore) {
        this.firestore = firestore;
    }

    public void saveUser(String username, String email, String password) throws ExecutionException, InterruptedException {
        Map<String, Object> userData = new HashMap<>();
        userData.put("username", username);
        userData.put("email", email);
        userData.put("password", password);
        userData.put("points", 0);

        firestore.collection("users").document(username).set(userData).get();
    }
}
