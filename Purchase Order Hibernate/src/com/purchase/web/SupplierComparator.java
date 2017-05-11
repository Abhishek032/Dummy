package com.purchase.web;

import java.util.Comparator;

/**
 * Created by Abhishek on 10-05-2017.
 */
public class SupplierComparator implements Comparator<Po> {
    @Override
    public int compare(Po o1, Po o2) {

        return o1.getSeller().compareToIgnoreCase(o2.getSeller());

    }
}