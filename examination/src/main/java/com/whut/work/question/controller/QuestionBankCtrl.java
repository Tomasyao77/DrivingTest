package com.whut.work.question.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.whut.work.base.model.Page;
import com.whut.work.question.model.QuestionBank;
import com.whut.work.question.service.IQuestionBankService;

/**
 * @Func 题库表相关接口设计
 * @author Justerdu 2017-03-09
 */
@Controller
@RequestMapping("/questionBank")
public class QuestionBankCtrl {

    @Autowired
    private IQuestionBankService questionBankService;

    @RequestMapping(value="/addToQuestionBank",method= RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> addToQuestionBank(String title, String description, String itemA, String itemB, 
    		String itemC, String itemD, String rightAnswer, String answerKeys, String chapter,  String type, String remark){
    	
        Map<String,Object> returnMap = new HashMap<String,Object>();

        try {
            Map<String,Object> questionResult = questionBankService.addToQuestionBank(title, description, itemA, itemB,
            		itemC, itemD, rightAnswer, answerKeys, chapter, type, remark);

            returnMap.put("value", questionResult);
            returnMap.put("success", true);
        } catch (Exception e) {
            returnMap.put("message", "异常：操作失败!");
            returnMap.put("success", false);
            e.printStackTrace();
        }
        return returnMap;
    }

    @RequestMapping(value="/getQuestionListOfQuestionBank",method= RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> getQuestionListOfQuestionBank(Integer currentPage, Integer pageSize){
    	
        Map<String,Object> returnMap = new HashMap<String,Object>();

        try {
            Page<QuestionBank> questionResult = questionBankService.getQuestionListOfQuestionBank(currentPage, pageSize);

            returnMap.put("page", questionResult);
            returnMap.put("success", true);
        } catch (Exception e) {
            returnMap.put("message", "异常：操作失败!");
            returnMap.put("success", false);
            e.printStackTrace();
        }
        return returnMap;
    }

    @RequestMapping(value="/removeQuestionFromQuestionBank",method= RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> removeQuestionFromQuestionBank(Integer id){
        Map<String,Object> returnMap = new HashMap<String,Object>();

        try {
            Map<String,Object> questionResult = questionBankService.removeQuestionFromQuestionBank(id);

            returnMap.put("value", questionResult);
            returnMap.put("success", true);
        } catch (Exception e) {
            returnMap.put("message", "异常：操作失败!");
            returnMap.put("success", false);
            e.printStackTrace();
        }
        return returnMap;
    }
    
    /**
	 * @Func 按照章节查找题库题目信息
	 * @author Justerdu
	 */
    @RequestMapping(value="/getQuestionListOfQuestionBankByChapter",method= RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> getQuestionListOfQuestionBankByChapter(Integer currentPage, Integer pageSize, String chapter){
    	
        Map<String,Object> returnMap = new HashMap<String,Object>();

        try {
            Page<QuestionBank> questionResult = questionBankService.getQuestionListOfQuestionBankByChapter(currentPage, pageSize, chapter);

            returnMap.put("page", questionResult);
            returnMap.put("success", true);
        } catch (Exception e) {
            returnMap.put("message", "异常：操作失败!");
            returnMap.put("success", false);
            e.printStackTrace();
        }
        return returnMap;
    }

    /**
	 * @Func 按照题目类型查找题库题目信息
	 * @author Justerdu
	 */
    @RequestMapping(value="/getQuestionListOfQuestionBankByType",method= RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> getQuestionListOfQuestionBankByType(Integer currentPage, Integer pageSize, String type){
    	
        Map<String,Object> returnMap = new HashMap<String,Object>();

        try {
            Page<QuestionBank> questionResult = questionBankService.getQuestionListOfQuestionBankByType(currentPage, pageSize, type);

            returnMap.put("page", questionResult);
            returnMap.put("success", true);
        } catch (Exception e) {
            returnMap.put("message", "异常：操作失败!");
            returnMap.put("success", false);
            e.printStackTrace();
        }
        return returnMap;
    }

}
