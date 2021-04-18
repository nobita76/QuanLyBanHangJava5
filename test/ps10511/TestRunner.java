/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ps10511;

import org.junit.runner.JUnitCore;
import org.junit.runner.Result;

/**
 *
 * @author HOME
 */
public class TestRunner {
    public static void main(String[] args) {
		JUnitCore runner = new JUnitCore();
		Result result = runner.run(UserDAOTest.class);
		System.out.println("run tests: "+result.getRunCount());
		System.out.println("Failed tests: "+result.getFailureCount());
		System.out.println("Ignored tests: "+result.getIgnoreCount());
		System.out.println("Success: "+result.wasSuccessful());

	}
}
