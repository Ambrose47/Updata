package com.example.demo.lecturer;


import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "lecturer")
@Data
public class Lecturer {
    @Id
    private String lecturerId;
    private String lecturerName;
    private String lecturerEmail;
    private String lecturerPhone;


}
