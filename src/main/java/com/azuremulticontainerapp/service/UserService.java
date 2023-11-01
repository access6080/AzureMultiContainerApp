package com.azuremulticontainerapp.service;

import com.azuremulticontainerapp.model.User;
import com.azuremulticontainerapp.repository.UserRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserService {
    private final UserRepository repo;

    public String getName(Long userId) {
        User u = repo.findById(userId)
                .orElseThrow(EntityNotFoundException::new);

        return u.getName();
    }
}
