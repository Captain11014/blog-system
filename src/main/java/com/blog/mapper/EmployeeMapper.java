package com.blog.mapper;


import com.blog.model.Employee;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author 姓陈的
 * 2023/3/31 22:04
 */
@Mapper
public interface EmployeeMapper {

    /**
     * 查询所有信息
     * @return
     */
    List<Employee> getEmployeeList();

}
