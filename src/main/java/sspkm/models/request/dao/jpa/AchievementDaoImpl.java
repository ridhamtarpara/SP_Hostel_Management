package sspkm.models.request.dao.jpa;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Repository;

import sspkm.models.abstractdao.jpa.AbstractDaoImpl;
import sspkm.models.rector.Rector;
import sspkm.models.request.Achievement;
import sspkm.models.request.dao.AchievementDao;
import sspkm.models.student.Student;

@Repository
public class AchievementDaoImpl extends AbstractDaoImpl<Achievement> implements AchievementDao {
	public AchievementDaoImpl() {
		setClazz(Achievement.class);
	}

	@Override
	public List<Achievement> getAchievementByStudent(Student student) {
		String query = "from Achievement where student=:student";

		List<Achievement> achievements = em.createQuery(query, Achievement.class).setParameter("student", student)
				.getResultList();
		return achievements;
	}

	@Override
	public List<Achievement> getAchievementByRector(Rector rector) throws SQLException {
		String query = "from Achievement where student in (from Student where user in (from User where gender = :gender and isActive = :isActive ))";
		List<Achievement> achievements = em.createQuery(query, Achievement.class)
				.setParameter("gender", rector.getUser().getGender()).setParameter("isActive", true).getResultList();
		return achievements;
	}

}
