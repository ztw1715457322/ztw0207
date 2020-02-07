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
	public PageInfo<Student> list(int page, String name,int[] selSubId) {
		PageHelper.startPage(page, 3);
		if(selSubId.length>0)
			return new PageInfo<Student>(stuMapper.listBySub(name,selSubId));
		else
			return new PageInfo<Student>(stuMapper.list(name));
	}


	@Override
	public List<Area> listAreasByParentId(int parentId) {
		return stuMapper.listAreasByParentId(parentId);
	}

	@Override
	public List<Subject> listAllSubjects() {
		return stuMapper.listAllSubjects();
	}


	@Override
	public void addStudent(Student stu, int[] selSubId) {
		stuMapper.add(stu);
		for (int subId : selSubId) {
			stuMapper.addStuSub(stu.getId(),subId);
		}
		
		
	}


	@Override
	public Student getById(int id) {
		return stuMapper.getById(id) ;
	}


	@Override
	public void updateStudent(Student stu, int[] selSubId) {
		stuMapper.update(stu);
		stuMapper.delSubjectByStuId(stu.getId());
		for (int i = 0; i < selSubId.length; i++) {
			stuMapper.addStuSub(stu.getId(),selSubId[i]);	
		}
	}
	@Override
	public void delBatch(int[] ids) {
		stuMapper.delBathcSubjectByStuIds(ids);
		stuMapper.delBatch(ids);
	}
	
	
}
