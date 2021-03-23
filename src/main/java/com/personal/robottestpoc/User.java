package com.personal.robottestpoc;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class User {

    private int id;
    private String name;
    private String email;

}
