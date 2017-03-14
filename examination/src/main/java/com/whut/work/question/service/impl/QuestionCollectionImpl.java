package com.whut.work.question.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.whut.work.base.model.Page;
import com.whut.work.base.util.JavaStringUtil;
import com.whut.work.question.dao.impl.QuestionCollectionDaoImpl;
import com.whut.work.question.model.QuestionCollection;
import com.whut.work.question.service.IQuestionCollectionService;

@Component
public class QuestionCollectionImpl implements IQuestionCollectionService{

    @Autowired
    private QuestionCollectionDaoImpl questionCollectionDao;

	public Map<String, Object> addToQuestionCollection(int questionId, int userId) throws Exception {
    	
        Map<String,Object> returnMap = new HashMap<String,Object>();

        String hql = " from QuestionCollection q where q.questionId='" + questionId + "' and q.userId='" + userId + "'";
        QuestionCollection questionCollection = questionCollectionDao.findOne(hql);
        if(questionCollection == null) {
        	questionCollection = new QuestionCollection();
        	questionCollection.setQuestionId(questionId);
        	questionCollection.setUserId(userId);
        	
        	questionCollectionDao.save(questionCollection);
        }
        returnMap.put("value", questionCollection);
        returnMap.put("message", "将收藏题目加入收藏表成功");
        returnMap.put("success", true);

        return returnMap;
    }

    public Page<QuestionCollection> getQuestionListOfQuestionCollection(Integer currentPage, Integer pageSize) throws Exception {
    	
        String queryHql = " from QuestionCollection q ";
        String countHql = " select count(*) from QuestionCollection q ";
        Page<QuestionCollection> page = questionCollectionDao.findPage(currentPage, pageSize, queryHql, countHql);

        return page;
    }

    public Map<String, Object> removeQuestionFromQuestionCollection(Integer id) throws Exception {
    	
        Map<String,Object> returnMap = new HashMap<String,Object>();
 
            String hql = " from QuestionCollection q where q.id='" + id + "' ";
            String delhql = " delete QuestionCollection where id='" + id + "' ";
            if(questionCollectionDao.findOne(hql) != null){
            	questionCollectionDao.deleteWithHql(delhql);
            }

        JavaStringUtil.setListInt(new ArrayList<Integer>());
        returnMap.put("message", "已从收藏中删除指定收藏题目");
        returnMap.put("success", true);
        return returnMap;
    }
    
    /**
     * @Func 根据用户ID获取其收藏题目集
     * @author Justerdu 2017-03-09
     */
    public Page<QuestionCollection> getQuestionListOfQuestionCollectionByUserId(Integer currentPage, Integer pageSize, Integer userId) throws Exception {
    	
        String queryHql = " from QuestionCollection q where userId = '" + userId + "' ";
        String countHql = " select count(*) from QuestionCollection q where userId = '" + userId + "' ";
        Page<QuestionCollection> page = questionCollectionDao.findPage(currentPage, pageSize, queryHql, countHql);

        return page;
    }

    /**
     * @Func 根据用户ID和题目ID判断是否已收藏该题目
     * @author Justerdu 2017-03-10
     */
    public Map<String, Object> determineCollectionByUserIdAndQuestionId(Integer userId, Integer questionId) throws Exception {
    	
        Map<String,Object> returnMap = new HashMap<String,Object>();
 
            String hql = " from QuestionCollection q where q.userId='" + userId + "' and q.questionId='" + questionId + "'";
            if(questionCollectionDao.findOne(hql) != null){
            	returnMap.put("value", "已收藏");
            }else{
            	returnMap.put("value", "未收藏");
            }
        JavaStringUtil.setListInt(new ArrayList<Integer>());
        returnMap.put("message", "根据用户ID和题目ID判断是否已收藏该题目");
        returnMap.put("success", true);
        return returnMap;
    }
}
