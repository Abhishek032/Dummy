package com.purchase.web;

import javax.persistence.*;

/**
 * Created by Abhishek on 05-05-2017.
 */

@Entity
@Table(name = "destination")
@PrimaryKeyJoinColumn(name = "Id")
public class Destination extends Address {

    @Column
    private String Deststartdate;
    @Column
    private String Destenddate;

    public String getDeststartdate() {
        return Deststartdate;
    }

    public void setDeststartdate(String deststartdate) {
        Deststartdate = deststartdate;
    }

    public String getDestenddate() {
        return Destenddate;
    }

    public void setDestenddate(String destenddate) {
        Destenddate = destenddate;
    }

}
