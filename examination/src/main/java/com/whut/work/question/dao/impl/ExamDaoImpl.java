package com.whut.work.question.dao.impl;

import com.whut.work.base.dao.Impl.BaseDaoImpl;
import com.whut.work.question.dao.IExamDao;
import com.whut.work.question.model.Exam;
import org.springframework.stereotype.Component;

/**
 * @author Justerdu 2017-03-09
 */
@Component
public class ExamDaoImpl extends BaseDaoImpl<Exam> implements IExamDao {
    public ExamDaoImpl(){
        super(Exam.class);
    }

}
