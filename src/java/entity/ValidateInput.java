/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Admin
 */
public class ValidateInput {
    public boolean inputUserName(String username){
        String regex = "^[a-zA-Z0-9]{1,}$";
        return username.trim().matches(regex);
    }
    public boolean inputName(String name){
        String regex = "^[a-zA-Z]{1,}$";
        return name.trim().matches(regex);
    }
    
    public boolean inputEmail(String email){
        String regex = "^[a-zA-Z][\\w-]+@([\\w]+\\.[\\w]+|[\\w]+\\.[\\w]{2,}\\.[\\w]{2,})$";
        return email.trim().matches(regex);
    }
    
     public boolean inputPhoneNumber(String phonenumber){
        String regex = "^[0-9]{8,10}$";
        return phonenumber.trim().matches(regex);
    }
     public boolean inputPassword(String password){
        String regex = "^^[a-zA-Z0-9.!]{1,}$";
        return password.trim().matches(regex);
    }
}
