package com.rzp.studyOneDay.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.rzp.studyOneDay.Entity.Employee;
import com.rzp.studyOneDay.service.EmployeeService;

@Controller
public class EmployeeController {
	@Autowired
	EmployeeService employeeService;
	@RequestMapping("/emps")
	public String list(@RequestParam(value="pageNo",required=false,defaultValue="1")String pageNoStr,
			Map<String,Object> map){
		int pageNo=1;
		try {
			pageNo=Integer.parseInt(pageNoStr);
			
			if(pageNo<1){
				pageNo=1;
			}
			
		} catch (Exception e) {}
		
		Page<Employee> page=employeeService.getPage(pageNo, 2);
		map.put("page", page);
		return "emp/list";
	}
}
