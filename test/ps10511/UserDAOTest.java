/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ps10511;

import dao.userDAO;
import static org.junit.Assert.assertTrue;
import org.junit.Test;

/**
 *
 * @author HOME
 */
public class UserDAOTest {
    
    @Test
	public void checkLoginSuccess() {
            userDAO userDAO = new userDAO();
		String userName = "admin";
		String passWord = "admin";
		assertTrue(userDAO.checkLogin(userName, passWord));
	}
}
