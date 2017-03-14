package com.whut.work.question.model;

/**
 * @Func 考试表
 * @author Justerdu 2017-03-09
 */
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="TB_EXAM")
public class Exam {

    @Id
    @GeneratedValue
    private Integer id;		
    @Column(name="USER_ID")
    private Integer userId;		// 	用户ID
    @Column(name="DURATION")
    private Integer duration;	// 	考试时长（分钟）
    @Column(name="EXAM_TIME")
    private Date examTime;		// 	考试时间
    @Column(name="SCORE")
    private Integer score;		// 	分数
    @Column(name="REMARK")
    private String remark;		// 	备注
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getDuration() {
		return duration;
	}
	public void setDuration(Integer duration) {
		this.duration = duration;
	}
	public Date getExamTime() {
		return examTime;
	}
	public void setExamTime(Date examTime) {
		this.examTime = examTime;
	}
	public Integer getScore() {
		return score;
	}
	public void setScore(Integer score) {
		this.score = score;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
    
}
