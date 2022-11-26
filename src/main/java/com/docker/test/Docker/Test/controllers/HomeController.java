package com.docker.test.Docker.Test.controllers;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

@RestController
public class HomeController {

    @GetMapping("/")
    public ResponseEntity<?> home(){
        Map<String, Object> data = new HashMap<>();
        data.put("welcome Message" , "Welcome to first spring-boot docker demo");
        data.put("message", "Java api is working fine");
        data.put("languages", Arrays.asList("Java", "Python", "JavaScript"));
        data.put("code",2345);
        return new ResponseEntity<>(data, HttpStatus.OK);
    }
}
