package com.whut.work.question.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.whut.work.base.model.Page;
import com.whut.work.base.util.JavaStringUtil;
import com.whut.work.question.dao.impl.QuestionBankDaoImpl;
import com.whut.work.question.model.QuestionBank;
import com.whut.work.question.service.IQuestionBankService;

@Component
public class QuestionBankImpl implements IQuestionBankService{

    @Autowired
    private QuestionBankDaoImpl questionBankDao;

    public Map<String, Object> addToQuestionBank(String title, String description, String itemA, String itemB, 
    		String itemC, String itemD, String rightAnswer, String answerKeys, String chapter, String type, String remark) throws Exception {
    	
        Map<String,Object> returnMap = new HashMap<String,Object>();

        QuestionBank questionBank = new QuestionBank();
        
        questionBank.setTitle(title);
        questionBank.setDescription(description);
        questionBank.setItemA(itemA);
        questionBank.setItemB(itemB);
        questionBank.setItemC(itemC);
        questionBank.setItemD(itemD);
        questionBank.setRightAnswer(rightAnswer);
        questionBank.setAnswerKeys(answerKeys);
        questionBank.setCreateTime(new Date());
        questionBank.setChapter(chapter);
        questionBank.setType(type);
        questionBank.setRemark(remark);	// 存放图片路径

        questionBankDao.save(questionBank);
        returnMap.put("value", questionBank);
        returnMap.put("message", "将题目加入题库成功");
        returnMap.put("success", true);

        return returnMap;
    }

    public Page<QuestionBank> getQuestionListOfQuestionBank(Integer currentPage, Integer pageSize) throws Exception {
    	
        String queryHql = " from QuestionBank q ";
        String countHql = " select count(*) from QuestionBank q ";
        Page<QuestionBank> page = questionBankDao.findPage(currentPage, pageSize, queryHql, countHql);

        return page;
    }

    public Map<String, Object> removeQuestionFromQuestionBank(Integer id) throws Exception {
    	
        Map<String,Object> returnMap = new HashMap<String,Object>();
 
            String hql = " from QuestionBank q where q.id='" + id + "' ";
            String delhql = " delete QuestionBank where id='" + id + "' ";
            if(questionBankDao.findOne(hql) != null){
            	questionBankDao.deleteWithHql(delhql);
            }

        JavaStringUtil.setListInt(new ArrayList<Integer>());
        returnMap.put("message", "已从题库中删除指定题目");
        returnMap.put("success", true);
        return returnMap;
    }

    /**
	 * @Func 按照章节查找题库题目信息
	 * @author Justerdu
	 */
    public Page<QuestionBank> getQuestionListOfQuestionBankByChapter(Integer currentPage, Integer pageSize, String chapter) throws Exception {
    	
        String queryHql = " from QuestionBank q where chapter = '" + chapter + "' ";
        String countHql = " select count(*) from QuestionBank q where chapter = '" + chapter + "' ";
        Page<QuestionBank> page = questionBankDao.findPage(currentPage, pageSize, queryHql, countHql);

        return page;
    }
    
    /**
	 * @Func 按照题目类型查找题库题目信息
	 * @author Justerdu
	 */
    public Page<QuestionBank> getQuestionListOfQuestionBankByType(Integer currentPage, Integer pageSize, String type) throws Exception {
    	
        String queryHql = " from QuestionBank q where type = '" + type + "' ";
        String countHql = " select count(*) from QuestionBank q where type = '" + type + "' ";
        Page<QuestionBank> page = questionBankDao.findPage(currentPage, pageSize, queryHql, countHql);

        return page;
    }
}
