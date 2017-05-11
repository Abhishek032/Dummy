package com.purchase.web;
import javax.persistence.*;
import java.util.List;

/**
 * Created by Abhishek on 05-05-2017.
 */

@Entity
@Table(name = "po")
//public class Po implements Comparable<Po>{
public class Po{
    //int count=0;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer ponumber;
    @Column
    private String status;
    @Column
    private String priority;
    @Column
    private String issuedate;
    @Column
    private String duedate;
    @Column
    private String seller;
    @Column
    private String billto;
    @Column
    private String transresp;
    @Column
    private String incoterms;
    @Column
    private String designatedmode;
    @Column
    private String carrier;
    @Column
    private Boolean mustship;
    @Column
    private String shipfrom;
    @Column
    private String shipto;

    @OneToMany(cascade = CascadeType.ALL)
    List<Destination> destinationList;


    @OneToMany(cascade = CascadeType.ALL)
    List<Origin> originList;

    public List<Origin> getOriginList() {
        return originList;
    }

    public void setOriginList(List<Origin> originList) {
        this.originList = originList;
    }

    public List<Destination> getDestinationList() {
        return destinationList;
    }

    public void setDestinationList(List<Destination> destinationList) {
        this.destinationList = destinationList;
    }


    public Integer getPonumber() {
        return ponumber;
    }

    public void setPonumber(Integer ponumber) {
        this.ponumber = ponumber;
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

    public String getBillto() {
        return billto;
    }

    public void setBillto(String billto) {
        this.billto = billto;
    }

    public String getTransresp() {
        return transresp;
    }

    public void setTransresp(String transresp) {
        this.transresp = transresp;
    }

    public String getIncoterms() {
        return incoterms;
    }

    public void setIncoterms(String incoterms) {
        this.incoterms = incoterms;
    }

    public String getDesignatedmode() {
        return designatedmode;
    }

    public void setDesignatedmode(String designatedmode) {
        this.designatedmode = designatedmode;
    }

    public String getCarrier() {
        return carrier;
    }

    public void setCarrier(String carrier) {
        this.carrier = carrier;
    }

    public Boolean getMustship() {
        return mustship;
    }

    public void setMustship(Boolean mustship) {
        this.mustship = mustship;
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


    @Override
    public String toString() {
        return "Po{" +
                "ponumber='" + ponumber + '\'' +
                ", status='" + status + '\'' +
                ", priority='" + priority + '\'' +
                ", issuedate='" + issuedate + '\'' +
                ", duedate='" + duedate + '\'' +
                ", seller='" + seller + '\'' +
                ", billto='" + billto + '\'' +
                ", shipfrom='" + shipfrom + '\'' +
                ", shipto='" + shipto + '\'' +
                ", transresp='" + transresp + '\'' +
                ", incoterms='" + incoterms + '\'' +
                ", designatedmode='" + designatedmode + '\'' +
                ", carrier='" + carrier + '\'' +
                ", mustship=" + mustship +
                ", destinationList=" + destinationList +
                ", originList=" + originList +
                '}';
    }

/*    @Override
    public int compareTo(Po poObject) {
        System.out.println("Inside compareTo for : "+ ++count + "times");
        return this.status.compareTo(poObject.status);
    }*/

}
