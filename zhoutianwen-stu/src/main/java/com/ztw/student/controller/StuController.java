package com.ztw.student.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.xiaofeng.student.entity.Area;
import com.xiaofeng.student.entity.Student;
import com.xiaofeng.student.entity.Subject;
import com.xiaofeng.student.service.StudentService;

@Controller
public class StuController {

	@Autowired
	StudentService stuService;
	

	@RequestMapping("list")
	public String list(HttpServletRequest request,@RequestParam(defaultValue="1") int page,
			@RequestParam(defaultValue="") String name) {
		
		PageInfo<Student> pageStudent = stuService.list(page,name);
		request.setAttribute("pageStudent", pageStudent);
		
		return "list";
	}
	

	@RequestMapping("toAdd")
	public String toAdd(HttpServletRequest request) {
		// 获取中国的所有的直接子节点  也就是所有的省 和直辖市
		List<Area> provinces= stuService.listAreasByParentId(1);
		// 获取所有的选秀的课程
		List<Subject> subjects = stuService.listAllSubjects();
		
		request.setAttribute("provinces", provinces);
		request.setAttribute("subjects", subjects);
		
		return "add";
	}
	

	@RequestMapping("add")
	public String add(Student stu,int[] selSubId ) {
		
		stuService.addStudent(stu,selSubId);
		
		
		return "redirect:list";
	}
	

	@RequestMapping("getAeas")
	@ResponseBody
	public List<Area> getAeas(int parentId){
		List<Area> areas= stuService.listAreasByParentId(parentId);
		return areas;
	}
}
