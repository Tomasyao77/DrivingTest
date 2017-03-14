package com.whut.work.question.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.whut.work.base.model.Page;
import com.whut.work.question.model.Exam;
import com.whut.work.question.service.IExamService;

/**
 * @Func 考试表相关接口设计
 * @author Justerdu 2017-03-09
 */
@Controller
@RequestMapping("/exam")
public class ExamCtrl {

    @Autowired
    private IExamService examService;

    @RequestMapping(value="/addToExam",method= RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> addToExam(int userId, int duration, int score){
    	
        Map<String,Object> returnMap = new HashMap<String,Object>();

        try {
            Map<String,Object> examResult = examService.addToExam(userId, duration, score);

            returnMap.put("value", examResult);
            returnMap.put("success", true);
        } catch (Exception e) {
            returnMap.put("message", "异常：操作失败!");
            returnMap.put("success", false);
            e.printStackTrace();
        }
        return returnMap;
    }

    @RequestMapping(value="/getExamInfoListOfExam",method= RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> getExamInfoListOfExam(Integer currentPage, Integer pageSize){
    	
        Map<String,Object> returnMap = new HashMap<String,Object>();

        try {
            Page<Exam> examResult = examService.getExamInfoListOfExam(currentPage, pageSize);

            returnMap.put("page", examResult);
            returnMap.put("success", true);
        } catch (Exception e) {
            returnMap.put("message", "异常：操作失败!");
            returnMap.put("success", false);
            e.printStackTrace();
        }
        return returnMap;
    }

    @RequestMapping(value="/removeExamInfoFromExam",method= RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> removeExamInfoFromExam(Integer id){
        Map<String,Object> returnMap = new HashMap<String,Object>();

        try {
            Map<String,Object> examResult = examService.removeExamInfoFromExam(id);

            returnMap.put("value", examResult);
            returnMap.put("success", true);
        } catch (Exception e) {
            returnMap.put("message", "异常：操作失败!");
            returnMap.put("success", false);
            e.printStackTrace();
        }
        return returnMap;
    }

    /**
     * @Func 根据用户ID获取其考试记录
     * @author Justerdu 2017-03-09
     */
    @RequestMapping(value="/getExamInfoListOfExamByUserId",method= RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> getExamInfoListOfExamByUserId(Integer currentPage, Integer pageSize, Integer userId){
    	
        Map<String,Object> returnMap = new HashMap<String,Object>();

        try {
            Page<Exam> examResult = examService.getExamInfoListOfExamByUserId(currentPage, pageSize, userId);

            returnMap.put("page", examResult);
            returnMap.put("success", true);
        } catch (Exception e) {
            returnMap.put("message", "异常：操作失败!");
            returnMap.put("success", false);
            e.printStackTrace();
        }
        return returnMap;
    }

}
