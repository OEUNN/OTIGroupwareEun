package com.oti.groupware.employee.dao;

import com.oti.groupware.employee.dto.Position;

public interface PositionDAO {
	public Position getPositionById(int posId);
	public int insertPosition(Position position);
	public int updatePosition(Position position);
	public int deletePosition(int posId);
}