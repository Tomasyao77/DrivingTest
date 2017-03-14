package com.whut.work.question.service;

import com.whut.work.base.model.Page;
import com.whut.work.question.model.Exam;

import java.util.Map;

public interface IExamService {

    //将考试信息加入考试表中
    public Map<String,Object> addToExam(int userId, int duration, int score) throws Exception;

    //获取考试表中的考试信息
    public Page<Exam> getExamInfoListOfExam(Integer currentPage, Integer pageSize) throws Exception;

    //从考试表中移除考试信息
    public Map<String,Object> removeExamInfoFromExam(Integer id) throws Exception;
    
    //根据用户ID获取其考试记录
    public Page<Exam> getExamInfoListOfExamByUserId(Integer currentPage, Integer pageSize, Integer userId) throws Exception;

}
