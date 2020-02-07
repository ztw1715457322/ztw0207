package com.ztw.student.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.xiaofeng.student.entity.Area;
import com.xiaofeng.student.entity.Student;
import com.xiaofeng.student.entity.Subject;

public interface StudentService {
	PageInfo<Student> list(int page, String name,int[] selSubId );
	List<Area> listAreasByParentId(int parentId);
	List<Subject> listAllSubjects();
	void addStudent(Student stu, int[] selSubId);
	Student getById(int id);
	void updateStudent(Student stu, int[] selSubId);
	void delBatch(int[] ids);

}
