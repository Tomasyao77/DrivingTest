package com.whut.work.question.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.whut.work.base.model.Page;
import com.whut.work.base.util.JavaStringUtil;
import com.whut.work.question.dao.impl.WrongQuestionDaoImpl;
import com.whut.work.question.model.WrongQuestion;
import com.whut.work.question.service.IWrongQuestionService;

@Component
public class WrongQuestionServiceImpl implements IWrongQuestionService{

    @Autowired
    private WrongQuestionDaoImpl wrongQuestionDao;

	public Map<String, Object> addToWrongQuestion(int questionId, int userId) throws Exception {
    	
        Map<String,Object> returnMap = new HashMap<String,Object>();

        String hql = " from WrongQuestion w where w.questionId='" + questionId + "' and w.userId='" + userId + "'";
        WrongQuestion wrongQuestion = wrongQuestionDao.findOne(hql);
        if(wrongQuestion != null) {
        	wrongQuestion.setQuestionId(questionId);
        	wrongQuestion.setUserId(userId);
        	wrongQuestion.setAmount(wrongQuestion.getAmount() + 1);
        	wrongQuestionDao.update(wrongQuestion);
        }else{
        	wrongQuestion = new WrongQuestion();
        	wrongQuestion.setQuestionId(questionId);
        	wrongQuestion.setUserId(userId);
        	wrongQuestion.setAmount(1);
        	wrongQuestionDao.save(wrongQuestion);
        }
        
        returnMap.put("value", wrongQuestion);
        returnMap.put("message", "将错题加入错题表成功");
        returnMap.put("success", true);

        return returnMap;
    }

    public Page<WrongQuestion> getWrongQuestionListOfWrongQuestion(Integer currentPage, Integer pageSize) throws Exception {
    	
        String queryHql = " from WrongQuestion w ";
        String countHql = " select count(*) from WrongQuestion w ";
        Page<WrongQuestion> page = wrongQuestionDao.findPage(currentPage, pageSize, queryHql, countHql);

        return page;
    }

    public Map<String, Object> removeWrongQuestionFromWrongQuestion(Integer id) throws Exception {
    	
        Map<String,Object> returnMap = new HashMap<String,Object>();
 
            String hql = " from WrongQuestion w where w.id='" + id + "' ";
            String delhql = " delete WrongQuestion where id='" + id + "' ";
            if(wrongQuestionDao.findOne(hql) != null){
            	wrongQuestionDao.deleteWithHql(delhql);
            }

        JavaStringUtil.setListInt(new ArrayList<Integer>());
        returnMap.put("message", "已从题库中删除指定题目");
        returnMap.put("success", true);
        return returnMap;
    }
    
    /**
     * @Func 根据用户ID获取其错题集
     * @author Justerdu 2017-03-09
     */
    public Page<WrongQuestion> getWrongQuestionListOfWrongQuestionByUserId(Integer currentPage, Integer pageSize, Integer userId) throws Exception {
    	
        String queryHql = " from WrongQuestion w where userId = '" + userId + "' ";
        String countHql = " select count(*) from WrongQuestion w where userId = '" + userId + "' ";
        Page<WrongQuestion> page = wrongQuestionDao.findPage(currentPage, pageSize, queryHql, countHql);

        return page;
    }

}
