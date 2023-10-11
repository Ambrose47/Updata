CREATE DATABASE ESMS2

CREATE TABLE lecturer(
	lecturer_id VARCHAR(10) NOT NULL,
	lecturer_name VARCHAR(50) NOT NULL,
	lecturer_email VARCHAR(50) NOT NULL,
	lecturer_phone VARCHAR(50) NOT NULL,
	CONSTRAINT pk_lecturer_id PRIMARY KEY (lecturer_id)
);

CREATE TABLE slot_lecturer(
	exam_slot_id VARCHAR(10) NOT NULL,
	lecturer_id VARCHAR(10) NOT NULL,
	CONSTRAINT fk_exam_slot_id FOREIGN KEY (exam_slot_id) REFERENCES exam_slot(exam_slot_id),
	CONSTRAINT fk_lecturer_id FOREIGN KEY (lecturer_id) REFERENCES lecturer(lecturer_id)
);

CREATE TABLE exam_slot(
	exam_slot_id VARCHAR(10) NOT NULL,
	exam_slot_date VARCHAR(10) NOT NULL,
	exam_slot_time VARCHAR(10) NOT NULL,
	exam_slot_hour REAL NOT NULL,
	exam_schedule_id VARCHAR(10) NOT NULL,
	CONSTRAINT pk_exam_slot_id PRIMARY KEY (exam_slot_id),
	CONSTRAINT fk_exam_schedule_id FOREIGN KEY (exam_schedule_id) REFERENCES exam_schedule(exam_schedule_id)
);

CREATE TABLE exam_schedule(
	exam_schedule_id VARCHAR(10) NOT NULL,
	CONSTRAINT pk_exam_schedule PRIMARY KEY (exam_schedule_id)
);

CREATE TABLE classroom(
	room_id VARCHAR(10) NOT NULL,
	CONSTRAINT pk_room_id PRIMARY KEY (room_id)
);

CREATE TABLE schedule_classroom(
	exam_schedule_id VARCHAR(10) NOT NULL,
	room_id VARCHAR(10) NOT NULL,
	CONSTRAINT fk_exam_schedule_id FOREIGN KEY (exam_schedule_id) REFERENCES exam_schedule(exam_schedule_id),
	CONSTRAINT fk_room_id FOREIGN KEY (room_id) REFERENCES classroom(room_id)
);

CREATE TABLE course(
	course_id VARCHAR(10) NOT NULL,
	course_name VARCHAR(50) NOT NULL,
	course_hour REAL NOT NULL,
	exam_schedule_id VARCHAR(10) NOT NULL,
	CONSTRAINT pk_course_id PRIMARY KEY (course_id),
	CONSTRAINT fk_exam_schedule_id FOREIGN KEY (exam_schedule_id) REFERENCES exam_schedule(exam_schedule_id)
);

CREATE TABLE student(
	student_id VARCHAR(10) NOT NULL,
	student_name VARCHAR(50) NOT NULL,
	student_email VARCHAR(50) NOT NULL,
	CONSTRAINT pk_student_id PRIMARY KEY (student_id)
);

CREATE TABLE course_student(
	course_id VARCHAR(10) NOT NULL,
	student_id VARCHAR(10) NOT NULL,
	CONSTRAINT fk_course_id FOREIGN KEY (course_id) REFERENCES course(course_id),
	CONSTRAINT fk_student_id FOREIGN KEY (student_id) REFERENCES student(student_id)
);

CREATE TABLE major(
	major_id VARCHAR(10) NOT NULL,
	major_name VARCHAR(10) NOT NULL,
	CONSTRAINT pk_major_id PRIMARY KEY (major_id)
);

CREATE TABLE course_major(
	course_id VARCHAR(10) NOT NULL,
	major_id VARCHAR(10) NOT NULL,
	CONSTRAINT fk_course_id FOREIGN KEY (course_id) REFERENCES course(course_id),
	CONSTRAINT fk_major_id FOREIGN KEY (major_id) REFERENCES major(major_id)
);

CREATE TABLE semeter(
	semeter_id VARCHAR(10) NOT NULL,
	semeter_name VARCHAR(50) NOT NULL,
	CONSTRAINT pk_semeter_id PRIMARY KEY (semeter_id)
);

CREATE TABLE course_semeter(
	course_id VARCHAR(10) NOT NULL,
	semeter_id VARCHAR(10) NOT NULL,
	CONSTRAINT fk_course_id FOREIGN KEY (course_id) REFERENCES course(course_id),
	CONSTRAINT fk_semeter_id FOREIGN KEY (semeter_id) REFERENCES semeter(semeter_id)
);


