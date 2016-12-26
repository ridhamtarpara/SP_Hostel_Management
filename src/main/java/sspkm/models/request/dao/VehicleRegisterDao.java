package sspkm.models.request.dao;

import java.sql.SQLException;
import java.util.List;

import sspkm.models.abstractdao.AbstractDao;
import sspkm.models.rector.Rector;
import sspkm.models.request.VehicleRegister;
import sspkm.models.student.Student;

public interface VehicleRegisterDao extends AbstractDao<VehicleRegister> {

	List<VehicleRegister> getVehicleByStudent(Student student) throws SQLException;

	List<VehicleRegister> getVehicleByRector(Rector rector) throws SQLException;
}
