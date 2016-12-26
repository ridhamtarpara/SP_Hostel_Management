package sspkm.models.request.dao;

import java.sql.SQLException;
import java.util.List;

import sspkm.models.abstractdao.AbstractDao;
import sspkm.models.rector.Rector;
import sspkm.models.request.Achievement;
import sspkm.models.student.Student;

public interface AchievementDao extends AbstractDao<Achievement> {

	List<Achievement> getAchievementByStudent(Student student) throws SQLException;

	List<Achievement> getAchievementByRector(Rector rector) throws SQLException;
}
