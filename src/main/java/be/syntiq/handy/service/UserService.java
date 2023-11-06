package be.syntiq.handy.service;

import be.syntiq.handy.data.entity.User;
import be.syntiq.handy.data.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collection;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

    Collection<User> getAllUsers(){
        return this.userRepository.findAll();
    }
}
