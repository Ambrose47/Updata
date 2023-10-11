package com.example.demo.service;

import com.example.demo.lecturer.Lecturer;
import com.example.demo.repository.LecturerRepository;
import com.example.demo.repository.StudentRepository;
import com.example.demo.student.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LecturerService {

    @Autowired
    private LecturerRepository lecturerRepository;

    public void save(Lecturer lecturer) {
        lecturerRepository.save(lecturer);
    }

    public void saveAll(List<Lecturer> lecturers) {
        lecturerRepository.saveAll(lecturers);
    }
}
