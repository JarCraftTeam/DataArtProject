package org.project.model.entity;

import javax.persistence.*;

@Entity
@Table(name = "checkboxlist")
public class CheckBoxList {

    @Id
    @GeneratedValue
    @Column(name = "id")
    private Long id;

    @Column(name = "answer_id")
    private Long answerId;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getAnswerId() {
        return answerId;
    }

    public void setAnswerId(Long answerId) {
        this.answerId = answerId;
    }
}
