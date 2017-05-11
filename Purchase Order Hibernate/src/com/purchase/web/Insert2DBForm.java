package com.purchase.web;

/**
 * Created by Abhishek on 08-05-2017.
 */

        import org.apache.struts.action.ActionForm;

/**
 * Created by Abhishek on 05/05/2017.
 */
public class Insert2DBForm extends ActionForm {
    private String status;
    private String priority;
    private String issuedate;
    private String duedate;
    private String seller;
    private String shipfrom;
    private String shipto;
    private String billto;
    private String trans;
    private String incoterms;
    private String mustship;
    private String desig;
    private String carrier;
    private String pickupstartdate;
    private String pickupenddate;
    private String deliverystartdate;
    private String deliveryenddate;
    private String city;
    private String country;
    private String street;
    private String name;
    private String state;

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getPickupstartdate() {
        return pickupstartdate;
    }

    public void setPickupstartdate(String pickupstartdate) {
        this.pickupstartdate = pickupstartdate;
    }

    public String getPickupenddate() {
        return pickupenddate;
    }

    public void setPickupenddate(String pickupenddate) {
        this.pickupenddate = pickupenddate;
    }

    public String getDeliverystartdate() {
        return deliverystartdate;
    }

    public void setDeliverystartdate(String deliverystartdate) {
        this.deliverystartdate = deliverystartdate;
    }

    public String getDeliveryenddate() {
        return deliveryenddate;
    }

    public void setDeliveryenddate(String deliveryenddate) {
        this.deliveryenddate = deliveryenddate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPriority() {
        return priority;
    }

    public void setPriority(String priority) {
        this.priority = priority;
    }

    public String getIssuedate() {
        return issuedate;
    }

    public void setIssuedate(String issuedate) {
        this.issuedate = issuedate;
    }

    public String getDuedate() {
        return duedate;
    }

    public void setDuedate(String duedate) {
        this.duedate = duedate;
    }

    public String getSeller() {
        return seller;
    }

    public void setSeller(String seller) {
        this.seller = seller;
    }

    public String getShipfrom() {
        return shipfrom;
    }

    public void setShipfrom(String shipfrom) {
        this.shipfrom = shipfrom;
    }

    public String getShipto() {
        return shipto;
    }

    public void setShipto(String shipto) {
        this.shipto = shipto;
    }

    public String getBillto() {
        return billto;
    }

    public void setBillto(String billto) {
        this.billto = billto;
    }

    public String getTrans() {
        return trans;
    }

    public void setTrans(String trans) {
        this.trans = trans;
    }

    public String getIncoterms() {
        return incoterms;
    }

    public void setIncoterms(String incoterms) {
        this.incoterms = incoterms;
    }

    public String getMustship() {
        return mustship;
    }

    public void setMustship(String mustship) {
        this.mustship = mustship;
    }

    public String getDesig() {
        return desig;
    }

    public void setDesig(String desig) {
        this.desig = desig;
    }

    public String getCarrier() {
        return carrier;
    }

    public void setCarrier(String carrier) {
        this.carrier = carrier;
    }
}
