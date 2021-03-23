package com.personal.robottestpoc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/user")
public class UserController {


    @Autowired
    private GetUserById getUserById;

    @GetMapping
    public String getUsersNames(@RequestParam(name = "name") final String name) {
        return name;
    }

    @GetMapping("/{id}")
    public User getUserById(@PathVariable final int id) {
        return getUserById.execute(id);
    }

}
