package com.hk.board.daos;

import java.util.List;

import com.hk.board.dtos.HkDto;

public interface IHkDao {
	
	public List<HkDto> getAllBoard();
	public HkDto getBoard(int seq);
	public boolean insertBoard(HkDto dto);
	public boolean updateBoard(HkDto dto);
	public boolean deleteBoard(int seq);
}
