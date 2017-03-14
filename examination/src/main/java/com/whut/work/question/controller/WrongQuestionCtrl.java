package com.whut.work.question.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.whut.work.base.model.Page;
import com.whut.work.question.model.WrongQuestion;
import com.whut.work.question.service.IWrongQuestionService;

/**
 * @Func 错题表相关接口设计
 * @author Justerdu 2017-03-09
 */
@Controller
@RequestMapping("/wrongQuestion")
public class WrongQuestionCtrl {

    @Autowired
    private IWrongQuestionService wrongQuestionService;

    @RequestMapping(value="/addToWrongQuestion",method= RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> addToWrongQuestion(int questionId, int userId){
    	
        Map<String,Object> returnMap = new HashMap<String,Object>();

        try {
            Map<String,Object> wrongQuestionResult = wrongQuestionService.addToWrongQuestion(questionId, userId);

            returnMap.put("value", wrongQuestionResult);
            returnMap.put("success", true);
        } catch (Exception e) {
            returnMap.put("message", "异常：操作失败!");
            returnMap.put("success", false);
            e.printStackTrace();
        }
        return returnMap;
    }

    @RequestMapping(value="/getWrongQuestionListOfWrongQuestion",method= RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> getWrongQuestionListOfWrongQuestion(Integer currentPage, Integer pageSize){
    	
        Map<String,Object> returnMap = new HashMap<String,Object>();

        try {
            Page<WrongQuestion> wrongQuestionResult = wrongQuestionService.getWrongQuestionListOfWrongQuestion(currentPage, pageSize);

            returnMap.put("page", wrongQuestionResult);
            returnMap.put("success", true);
        } catch (Exception e) {
            returnMap.put("message", "异常：操作失败!");
            returnMap.put("success", false);
            e.printStackTrace();
        }
        return returnMap;
    }

    @RequestMapping(value="/removeWrongQuestionFromWrongQuestion",method= RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> removeWrongQuestionFromWrongQuestion(Integer id){
        Map<String,Object> returnMap = new HashMap<String,Object>();

        try {
            Map<String,Object> wrongQuestionResult = wrongQuestionService.removeWrongQuestionFromWrongQuestion(id);

            returnMap.put("value", wrongQuestionResult);
            returnMap.put("success", true);
        } catch (Exception e) {
            returnMap.put("message", "异常：操作失败!");
            returnMap.put("success", false);
            e.printStackTrace();
        }
        return returnMap;
    }
    
    /**
     * @Func 根据用户ID获取其错题集
     * @author Justerdu 2017-03-09
     */
    @RequestMapping(value="/getWrongQuestionListOfWrongQuestionByUserId",method= RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> getWrongQuestionListOfWrongQuestionByUserId(Integer currentPage, Integer pageSize, Integer userId){
    	
        Map<String,Object> returnMap = new HashMap<String,Object>();

        try {
            Page<WrongQuestion> wrongQuestionResult = wrongQuestionService.getWrongQuestionListOfWrongQuestionByUserId(currentPage, pageSize, userId);

            returnMap.put("page", wrongQuestionResult);
            returnMap.put("success", true);
        } catch (Exception e) {
            returnMap.put("message", "异常：操作失败!");
            returnMap.put("success", false);
            e.printStackTrace();
        }
        return returnMap;
    }

}
