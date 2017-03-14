package com.whut.work.question.service;

import com.whut.work.base.model.Page;
import com.whut.work.question.model.WrongQuestion;

import java.util.Map;

public interface IWrongQuestionService {

    //将错题加入错题表中
    public Map<String,Object> addToWrongQuestion(int questionId, int userId) throws Exception;

    //获取错题表中的错题
    public Page<WrongQuestion> getWrongQuestionListOfWrongQuestion(Integer currentPage, Integer pageSize) throws Exception;

    //从错题表中移除错题
    public Map<String,Object> removeWrongQuestionFromWrongQuestion(Integer id) throws Exception;
    
    //根据用户ID获取其错题集
    public Page<WrongQuestion> getWrongQuestionListOfWrongQuestionByUserId(Integer currentPage, Integer pageSize, Integer userId) throws Exception;

}
