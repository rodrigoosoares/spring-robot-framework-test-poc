package com.personal.robottestpoc;

import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.List;

@Component
public class GetUserById {

    private static final List<User> preloadedUsers = Arrays.asList(
        User.builder().id(1).name("User1").email("user1@email.com").build(),
        User.builder().id(2).name("User2").email("user2@email.com").build(),
        User.builder().id(3).name("User3").email("user3@email.com").build()
        );


    public User execute(final int id) {
        return preloadedUsers.stream().filter(user -> user.getId() == id).findFirst().orElse(null);
    }
}
