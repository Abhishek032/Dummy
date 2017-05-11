package com.purchase.web;

import java.util.Comparator;

/**
 * Created by Abhishek on 10-05-2017.
 */
public class ShipToComparator implements Comparator<Po> {
    @Override
    public int compare(Po o1, Po o2) {

        return o1.getShipto().compareToIgnoreCase(o2.getShipto());

    }
}