package com.whut.work.question.model;

/**
 * @Func 错题表
 * @author Justerdu 2017-03-09
 */
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="TB_WRONGQUESTION")
public class WrongQuestion {

    @Id
    @GeneratedValue
    private Integer id;			// 	ID
    @Column(name="QUESTION_ID")
    private Integer questionId;	// 	题目ID
    @Column(name="USER_ID")
    private Integer userId;		// 	用户ID
    @Column(name="AMOUNT")
    private Integer amount;		// 	数量
    @Column(name="REMARK")
    private String remark;		// 	备注
    
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getQuestionId() {
		return questionId;
	}
	public void setQuestionId(Integer questionId) {
		this.questionId = questionId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
    
}
