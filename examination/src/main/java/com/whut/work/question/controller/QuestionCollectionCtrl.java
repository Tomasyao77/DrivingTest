package com.whut.work.question.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.whut.work.base.model.Page;
import com.whut.work.question.model.QuestionCollection;
import com.whut.work.question.service.IQuestionCollectionService;

/**
 * @Func 收藏表相关接口设计
 * @author Justerdu 2017-03-09
 */
@Controller
@RequestMapping("/questionCollection")
public class QuestionCollectionCtrl {

    @Autowired
    private IQuestionCollectionService questionCollectionService;

    @RequestMapping(value="/addToQuestionCollection",method= RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> addToQuestionCollection(int questionId, int userId){
    	
        Map<String,Object> returnMap = new HashMap<String,Object>();

        try {
            Map<String,Object> questionCollectionResult = questionCollectionService.addToQuestionCollection(questionId, userId);

            returnMap.put("value", questionCollectionResult);
            returnMap.put("success", true);
        } catch (Exception e) {
            returnMap.put("message", "异常：操作失败!");
            returnMap.put("success", false);
            e.printStackTrace();
        }
        return returnMap;
    }

    @RequestMapping(value="/getQuestionListOfQuestionCollection",method= RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> getQuestionListOfQuestionCollection(Integer currentPage, Integer pageSize){
    	
        Map<String,Object> returnMap = new HashMap<String,Object>();

        try {
            Page<QuestionCollection> questionCollectionResult = questionCollectionService.getQuestionListOfQuestionCollection(currentPage, pageSize);

            returnMap.put("page", questionCollectionResult);
            returnMap.put("success", true);
        } catch (Exception e) {
            returnMap.put("message", "异常：操作失败!");
            returnMap.put("success", false);
            e.printStackTrace();
        }
        return returnMap;
    }

    @RequestMapping(value="/removeQuestionFromQuestionCollection",method= RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> removeQuestionFromQuestionCollection(Integer id){
        Map<String,Object> returnMap = new HashMap<String,Object>();

        try {
            Map<String,Object> questionCollectionResult = questionCollectionService.removeQuestionFromQuestionCollection(id);

            returnMap.put("value", questionCollectionResult);
            returnMap.put("success", true);
        } catch (Exception e) {
            returnMap.put("message", "异常：操作失败!");
            returnMap.put("success", false);
            e.printStackTrace();
        }
        return returnMap;
    }

    /**
     * @Func 根据用户ID获取其收藏题目集
     * @author Justerdu 2017-03-09
     */
    @RequestMapping(value="/getQuestionListOfQuestionCollectionByUserId",method= RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> getQuestionListOfQuestionCollectionByUserId(Integer currentPage, Integer pageSize, Integer userId){
    	
        Map<String,Object> returnMap = new HashMap<String,Object>();

        try {
            Page<QuestionCollection> questionCollectionResult = questionCollectionService.getQuestionListOfQuestionCollectionByUserId(currentPage, pageSize, userId);

            returnMap.put("page", questionCollectionResult);
            returnMap.put("success", true);
        } catch (Exception e) {
            returnMap.put("message", "异常：操作失败!");
            returnMap.put("success", false);
            e.printStackTrace();
        }
        return returnMap;
    }
    
    /**
     * @Func 根据用户ID和题目ID判断是否已收藏该题目
     * @author Justerdu 2017-03-10
     */
    @RequestMapping(value="/determineCollectionByUserIdAndQuestionId",method= RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> determineCollectionByUserIdAndQuestionId(Integer userId, Integer questionId){
        Map<String,Object> returnMap = new HashMap<String,Object>();

        try {
            returnMap = questionCollectionService.determineCollectionByUserIdAndQuestionId(userId, questionId);
            
            returnMap.put("success", true);
        } catch (Exception e) {
            returnMap.put("message", "异常：操作失败!");
            returnMap.put("success", false);
            e.printStackTrace();
        }
        return returnMap;
    }
}
