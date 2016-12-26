package sspkm.models.academic.dao;

import java.util.List;

import sspkm.models.abstractdao.AbstractDao;
import sspkm.models.academic.College;

public interface CollegeDao extends AbstractDao<College> {

	public List<College> getSortedList();
}
