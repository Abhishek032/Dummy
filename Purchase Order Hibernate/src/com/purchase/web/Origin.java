package com.purchase.web;

import javax.persistence.*;

/**
 * Created by Abhishek on 05-05-2017.
 */
@Entity
@Table(name = "origin")
@PrimaryKeyJoinColumn(name = "Id")
public class Origin extends Address {

    public String getPickupstartdate() {
        return Pickupstartdate;
    }

    public void setPickupstartdate(String pickupstartdate) {
        Pickupstartdate = pickupstartdate;
    }

    public String getPickupenddate() {
        return Pickupenddate;
    }

    public void setPickupenddate(String pickupenddate) {
        Pickupenddate = pickupenddate;
    }
    @Column
    private String Pickupstartdate;
    @Column
    private String Pickupenddate;

}
