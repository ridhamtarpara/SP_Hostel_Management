package sspkm.models.request.dao.jpa;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Repository;

import sspkm.models.abstractdao.jpa.AbstractDaoImpl;
import sspkm.models.rector.Rector;
import sspkm.models.request.VehicleRegister;
import sspkm.models.request.dao.VehicleRegisterDao;
import sspkm.models.student.Student;

@Repository
public class VehicleRegisterDaoImpl extends AbstractDaoImpl<VehicleRegister> implements VehicleRegisterDao {
	public VehicleRegisterDaoImpl() {
		setClazz(VehicleRegister.class);
	}

	@Override
	public List<VehicleRegister> getVehicleByStudent(Student student) {
		String query = "from VehicleRegister where student=:student";

		List<VehicleRegister> vehicles = em.createQuery(query, VehicleRegister.class).setParameter("student", student)
				.getResultList();
		return vehicles;
	}

	@Override
	public List<VehicleRegister> getVehicleByRector(Rector rector) throws SQLException {
		String query = "from VehicleRegister where student in(from Student where user in (from User where gender = :gender and isActive = :isActive ))";
		List<VehicleRegister> vehicles = em.createQuery(query, VehicleRegister.class)
				.setParameter("gender", rector.getUser().getGender()).setParameter("isActive", true).getResultList();
		return vehicles;
	}

}
