/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author Sasinima
 */
public class SmsUtil {
    public static void sendSms(String Contact_Number, String Token){
        System.out.println("SMS sent to:" + Contact_Number + "with token" + Token);
    }
}
