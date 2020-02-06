package com.ztw.student.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xiaofeng.student.dao.StudentMapper;
import com.xiaofeng.student.entity.Area;
import com.xiaofeng.student.entity.Student;
import com.xiaofeng.student.entity.Subject;
import com.xiaofeng.student.service.StudentService;

@Service
public class StudentServiceImpl implements StudentService {

	@Autowired
	StudentMapper stuMapper;

	
	@Override
	public PageInfo<Student> list(int page, String name) {
		// TODO Auto-generated method stub
		PageHelper.startPage(page, 3);
		return new PageInfo<Student>(stuMapper.list(name));
	}


	@Override
	public List<Area> listAreasByParentId(int parentId) {
		// TODO Auto-generated method stub
		return stuMapper.listAreasByParentId(parentId);
	}


	@Override
	public List<Subject> listAllSubjects() {
		// TODO Auto-generated method stub
		return stuMapper.listAllSubjects();
	}


	@Override
	public void addStudent(Student stu, int[] selSubId) {
		// TODO Auto-generated method stub
		stuMapper.add(stu);
		for (int subId : selSubId) {
			stuMapper.addStuSub(stu.getId(),subId);
		}
		
		
	}
	
}
