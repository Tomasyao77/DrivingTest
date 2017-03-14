package com.whut.work.question.model;

/**
 * @Func 题库表
 * @author Justerdu 2017-03-09
 */
import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name="TB_QUESTIONBANK")
public class QuestionBank {

    @Id
    @GeneratedValue
    private Integer id;				// 	题目ID
    @Column(name="TITLE")
    private String title;			// 	题目标题（选择题、判断题）
    @Column(name="DESCRIPTION")
    private String description;		// 	题目描述
    @Column(name="ITEM_A")
    private String itemA;			// 	选项A
    @Column(name="ITEM_B")
    private String itemB;			// 	选项B
    @Column(name="ITEM_C")
    private String itemC;			// 	选项C
    @Column(name="ITEM_D")
    private String itemD;			// 	选项D
    @Column(name="RIGHT_ANSWER")
    private String rightAnswer;		// 	正确答案（a、b、c、d）
    @Column(name="ANSWER_KEYS")
    private String answerKeys;		// 	答案解析
    @Column(name="CREATE_TIME")
    private Date createTime;		// 	创建时间
    @Column(name="CHAPTER")
    private String chapter;			// 	所属章节
    @Column(name="TYPE")
    private String type;			// 	题目类别（交通标志类、转向类、速度类）
    @Column(name="REMARK")
    private String remark;			// 	备注(该字段用于存放题目中的图片路径)
    
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getItemA() {
		return itemA;
	}
	public void setItemA(String itemA) {
		this.itemA = itemA;
	}
	public String getItemB() {
		return itemB;
	}
	public void setItemB(String itemB) {
		this.itemB = itemB;
	}
	public String getItemC() {
		return itemC;
	}
	public void setItemC(String itemC) {
		this.itemC = itemC;
	}
	public String getItemD() {
		return itemD;
	}
	public void setItemD(String itemD) {
		this.itemD = itemD;
	}
	public String getRightAnswer() {
		return rightAnswer;
	}
	public void setRightAnswer(String rightAnswer) {
		this.rightAnswer = rightAnswer;
	}
	public String getAnswerKeys() {
		return answerKeys;
	}
	public void setAnswerKeys(String answerKeys) {
		this.answerKeys = answerKeys;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getChapter() {
		return chapter;
	}
	public void setChapter(String chapter) {
		this.chapter = chapter;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
    
}
