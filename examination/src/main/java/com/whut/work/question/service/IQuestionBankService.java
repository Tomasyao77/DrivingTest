package com.whut.work.question.service;

import com.whut.work.base.model.Page;
import com.whut.work.question.model.QuestionBank;

import java.util.Map;

public interface IQuestionBankService {

    // 将题目加入题库中
    public Map<String,Object> addToQuestionBank(String title, String description, String itemA, String itemB, 
    		String itemC, String itemD, String rightAnswer, String answerKeys, String chapter, String type, String remark) throws Exception;

    // 获取题库中的题目
    public Page<QuestionBank> getQuestionListOfQuestionBank(Integer currentPage, Integer pageSize) throws Exception;

    // 从题库中移除题目
    public Map<String,Object> removeQuestionFromQuestionBank(Integer id) throws Exception;

    // 按照章节查找题库题目信息
    public Page<QuestionBank> getQuestionListOfQuestionBankByChapter(Integer currentPage, Integer pageSize, String chapter) throws Exception;

    // 按照题目类型查找题库题目信息
    public Page<QuestionBank> getQuestionListOfQuestionBankByType(Integer currentPage, Integer pageSize, String type) throws Exception;


}
