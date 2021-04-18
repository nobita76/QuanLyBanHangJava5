/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import controller.AccountController;
import entity.Users;

/**
 *
 * @author HOME
 */
public class userDAO {
    
    
    
    public boolean checkLogin(String username, String password){
          AccountController accCtrl = new AccountController();
        Users test = accCtrl.findByUsername2(username);
        if(test == null){
            return false;
        }else{
            if(test.getPassword().equals(password)){
                return true;
            }else{
                return false;
            }
        }
    }
}
