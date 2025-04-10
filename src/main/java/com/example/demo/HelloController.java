package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

  @GetMapping("/")
  public String hello() {
    return "🚀 Java App deployed successfully on EKS! via CICD Pipeline";
  }
  @GetMapping("/whoami")
  public String whoami() {
    return "This pipeline is create by $ Billionaire";
  }
}