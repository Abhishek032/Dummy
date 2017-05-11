package com.purchase.web;

import java.util.Comparator;

/**
 * Created by Abhishek on 10-05-2017.
 */
public class ShipFromComparator implements Comparator<Po> {
    @Override
    public int compare(Po o1, Po o2) {

        return o1.getShipfrom().compareToIgnoreCase(o2.getShipfrom());

    }
}