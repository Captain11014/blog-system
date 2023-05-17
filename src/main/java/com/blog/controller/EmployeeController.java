package com.blog.controller;

import com.blog.model.Employee;
import com.blog.service.EmployeeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author 姓陈的
 * 2023/3/31 21:50
 */
@Controller
public class EmployeeController {

    @Resource
    private EmployeeService employeeService;


    @ResponseBody
    @GetMapping("/getEmployeeList")
    public List<Employee> toSuccess(Model model){

        List<Employee> employeeList = employeeService.getEmployeeList();
//        model.addAttribute("employeeList",employeeList);
        return employeeList;
    }

}
