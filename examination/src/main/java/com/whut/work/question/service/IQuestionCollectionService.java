package com.whut.work.question.service;

import com.whut.work.base.model.Page;
import com.whut.work.question.model.QuestionCollection;

import java.util.Map;

public interface IQuestionCollectionService {

    //将收藏题目加入收藏表中
    public Map<String,Object> addToQuestionCollection(int questionId, int userId) throws Exception;

    //获取收藏表中的收藏题目
    public Page<QuestionCollection> getQuestionListOfQuestionCollection(Integer currentPage, Integer pageSize) throws Exception;

    //从收藏表中移除收藏题目
    public Map<String,Object> removeQuestionFromQuestionCollection(Integer id) throws Exception;

    //根据用户ID获取其收藏题目集
    public Page<QuestionCollection> getQuestionListOfQuestionCollectionByUserId(Integer currentPage, Integer pageSize, Integer userId) throws Exception;

    //根据用户ID和题目ID判断是否已收藏该题目
    public Map<String,Object> determineCollectionByUserIdAndQuestionId(Integer userId, Integer questionId) throws Exception;
}
