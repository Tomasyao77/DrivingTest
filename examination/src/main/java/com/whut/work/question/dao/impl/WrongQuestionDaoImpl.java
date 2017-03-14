package com.whut.work.question.dao.impl;

import com.whut.work.base.dao.Impl.BaseDaoImpl;
import com.whut.work.question.dao.IWrongQuestionDao;
import com.whut.work.question.model.WrongQuestion;
import org.springframework.stereotype.Component;

/**
 * @author Justerdu 2017-03-09
 */
@Component
public class WrongQuestionDaoImpl extends BaseDaoImpl<WrongQuestion> implements IWrongQuestionDao {
    public WrongQuestionDaoImpl(){
        super(WrongQuestion.class);
    }

}
