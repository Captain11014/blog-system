package com.blog.service;

import com.blog.model.Employee;

import java.util.List;

/**
 * @author 姓陈的
 * 2023/3/31 22:09
 */
public interface EmployeeService {


    /**
     * 查询所有信息
     * @return
     */
    List<Employee> getEmployeeList();


}
