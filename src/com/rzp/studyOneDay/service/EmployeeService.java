package com.rzp.studyOneDay.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	
	@Transactional(readOnly=true)
	public Employee getByLastName(String lastName){
		return employeeRepository.getByLastName(lastName);
	}
	
	@Transactional
	public void save(Employee employee){
		if(employee.getId() == null){
			employee.setCreateTime(new Date());
		}
		employeeRepository.saveAndFlush(employee);
	}
	
}
