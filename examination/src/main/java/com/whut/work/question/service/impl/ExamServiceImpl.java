package com.whut.work.question.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.whut.work.base.model.Page;
import com.whut.work.base.util.JavaStringUtil;
import com.whut.work.question.dao.impl.ExamDaoImpl;
import com.whut.work.question.model.Exam;
import com.whut.work.question.service.IExamService;

@Component
public class ExamServiceImpl implements IExamService{

    @Autowired
    private ExamDaoImpl examDao;

	public Map<String, Object> addToExam(int userId, int duration, int score) throws Exception {
    	
        Map<String,Object> returnMap = new HashMap<String,Object>();

        Exam exam = new Exam();
        
        exam.setUserId(userId);
        exam.setDuration(duration);
        exam.setScore(score);
        exam.setExamTime(new Date());
        
        examDao.save(exam);
        
        returnMap.put("value", exam);
        returnMap.put("message", "将考试信息加入考试表成功");
        returnMap.put("success", true);

        return returnMap;
    }

    public Page<Exam> getExamInfoListOfExam(Integer currentPage, Integer pageSize) throws Exception {
    	
        String queryHql = " from Exam e ";
        String countHql = " select count(*) from Exam e ";
        Page<Exam> page = examDao.findPage(currentPage, pageSize, queryHql, countHql);

        return page;
    }

    public Map<String,Object> removeExamInfoFromExam(Integer id) throws Exception {
    	
        Map<String,Object> returnMap = new HashMap<String,Object>();
 
            String hql = " from Exam e where e.id='" + id + "' ";
            String delhql = " delete Exam where id='" + id + "' ";
            if(examDao.findOne(hql) != null){
            	examDao.deleteWithHql(delhql);
            }

        JavaStringUtil.setListInt(new ArrayList<Integer>());
        returnMap.put("message", "已从考试表中删除指定考试信息");
        returnMap.put("success", true);
        return returnMap;
    }

    /**
     * @Func 根据用户ID获取其考试记录
     * @author Justerdu 2017-03-09
     */
    public Page<Exam> getExamInfoListOfExamByUserId(Integer currentPage, Integer pageSize, Integer userId) throws Exception {
    	
        String queryHql = " from Exam e where userId = '" + userId + "' ";
        String countHql = " select count(*) from Exam e where userId = '" + userId + "' ";
        Page<Exam> page = examDao.findPage(currentPage, pageSize, queryHql, countHql);

        return page;
    }
}
