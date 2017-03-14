package com.whut.work.question.dao.impl;

import com.whut.work.base.dao.Impl.BaseDaoImpl;
import com.whut.work.question.dao.IQuestionCollectionDao;
import com.whut.work.question.model.QuestionCollection;
import org.springframework.stereotype.Component;

/**
 * @author Justerdu 2017-03-09
 */
@Component
public class QuestionCollectionDaoImpl extends BaseDaoImpl<QuestionCollection> implements IQuestionCollectionDao {
    public QuestionCollectionDaoImpl(){
        super(QuestionCollection.class);
    }

}
