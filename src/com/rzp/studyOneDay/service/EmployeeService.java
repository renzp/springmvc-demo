package com.rzp.studyOneDay.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.rzp.studyOneDay.Entity.Employee;
import com.rzp.studyOneDay.repository.EmployeeRepository;

@Service
public class EmployeeService {
   
	@Autowired
	EmployeeRepository employeeRepository;
	
	public Page<Employee> getPage(int pageNo,int pageSize){
		PageRequest pageRequest = new PageRequest(pageNo-1, pageSize);
		return employeeRepository.findAll(pageRequest);
	}
}
