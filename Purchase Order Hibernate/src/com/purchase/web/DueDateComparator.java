package com.purchase.web;

import java.util.Comparator;

/**
 * Created by Abhishek on 10-05-2017.
 */
public class DueDateComparator implements Comparator<Po> {
    @Override
    public int compare(Po o1, Po o2) {

        return o1.getDuedate().compareToIgnoreCase(o2.getDuedate());

    }
}