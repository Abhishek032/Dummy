package com.purchase.web;

import java.util.Comparator;

/**
 * Created by Abhishek on 10-05-2017.
 */
public class NumberComparator implements Comparator<Po>{
    @Override
    public int compare(Po o1, Po o2) {

        if(o1.getPonumber()==o2.getPonumber())
            return 0;
        else if(o1.getPonumber()>o2.getPonumber())
            return 1;
        else
            return -1;

    }
}
