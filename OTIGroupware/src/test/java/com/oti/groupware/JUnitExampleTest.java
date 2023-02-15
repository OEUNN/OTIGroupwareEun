package com.oti.groupware;

import static org.junit.Assert.*;
import org.junit.Test;

public class JUnitExampleTest {
	
	@Test
	public void testSum() {
		JUnitExample example = new JUnitExample();
		assertEquals(3, example.sum(1, 2));
	}
	
	@Test
	public void testMinus() {
		JUnitExample example = new JUnitExample();
		assertEquals(1, example.minus(2, 1));
	}

}
