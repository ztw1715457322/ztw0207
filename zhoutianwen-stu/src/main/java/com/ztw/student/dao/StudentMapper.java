package com.ztw.student.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.xiaofeng.student.entity.Area;
import com.xiaofeng.student.entity.Student;
import com.xiaofeng.student.entity.Subject;

public interface StudentMapper {
	
	List<Student> list(String name);
	@Select("SELECT id,name FROM stu_area WHERE parentId=#{value}")
	List<Area> listAreasByParentId(int parentId);


	@Select("SELECT id,name FROM stu_subject ")
	List<Subject> listAllSubjects();

	
	void add(Student stu);

	@Insert("INSERT INTO stu_student_subject(student_id,subject_id) "
			+ "VALUES(#{stuId},#{subId}) ")
	void addStuSub(@Param("stuId") Integer stuId,@Param("subId") int subId);
	
}
