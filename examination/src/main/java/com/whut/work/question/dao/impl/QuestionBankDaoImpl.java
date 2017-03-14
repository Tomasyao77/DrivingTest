package com.whut.work.question.dao.impl;

import com.whut.work.base.dao.Impl.BaseDaoImpl;
import com.whut.work.question.dao.IQuestionBankDao;
import com.whut.work.question.model.QuestionBank;
import org.springframework.stereotype.Component;

/**
 * @author Justerdu 2017-03-09
 */
@Component
public class QuestionBankDaoImpl extends BaseDaoImpl<QuestionBank> implements IQuestionBankDao {
    public QuestionBankDaoImpl(){
        super(QuestionBank.class);
    }

}
