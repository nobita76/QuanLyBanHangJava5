/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Users {
    @Id
    String username;
    String password;
    int vaitro;
    
    
    
    public Users(){
        
    }

    public Users(String username, String password, int vaitro) {
        this.username = username;
        this.password = password;
        this.vaitro = vaitro;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public int getVaitro() {
        return vaitro;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setVaitro(int vaitro) {
        this.vaitro = vaitro;
    }
    
    
    
}
