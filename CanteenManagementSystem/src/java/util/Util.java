/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.util.*;

/**
 *
 * @author USER
 */
public class Util {
    public static Date calToDate(Calendar cal){
        return cal.getTime();
    }
    
    public static java.sql.Date getSQLDate(Date date){
        java.sql.Date SQLDate = new java.sql.Date(date.getTime());
        return SQLDate;
    }
}
