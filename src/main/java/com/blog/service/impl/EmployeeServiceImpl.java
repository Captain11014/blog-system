package com.blog.service.impl;


import com.blog.mapper.EmployeeMapper;
import com.blog.model.Employee;
import com.blog.service.EmployeeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author 姓陈的
 * 2023/3/31 22:11
 */

@Service
public class EmployeeServiceImpl implements EmployeeService {

    @Resource
    private EmployeeMapper employeeMapper;


    /**
     * 查询所有信息
     * @return
     */
    @Override
    public List<Employee> getEmployeeList() {
        return employeeMapper.getEmployeeList();
    }
}
