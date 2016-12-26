package sspkm.models.student.dao.jpa;

import org.springframework.stereotype.Repository;

import sspkm.models.abstractdao.jpa.AbstractDaoImpl;
import sspkm.models.student.PastStudent;
import sspkm.models.student.dao.PastStudentDao;

@Repository
public class PastStudentDaoImpl extends AbstractDaoImpl<PastStudent> implements PastStudentDao {

	public PastStudentDaoImpl() {
		setClazz(PastStudent.class);
	}
}
