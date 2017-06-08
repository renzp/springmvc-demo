package com.rzp.studyOneDay.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.rzp.studyOneDay.Entity.Employee;

public interface EmployeeRepository extends JpaRepository<Employee, Integer> {

}
