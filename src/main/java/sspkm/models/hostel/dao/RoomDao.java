package sspkm.models.hostel.dao;

import java.sql.SQLException;
import java.util.List;

import sspkm.models.abstractdao.AbstractDao;
import sspkm.models.academic.SubCourse;
import sspkm.models.hostel.Hostel;
import sspkm.models.hostel.Room;
import sspkm.models.student.Student;

public interface RoomDao extends AbstractDao<Room> {

	public List<Student> getRoomsByCourse(Hostel hostel, SubCourse course) throws SQLException;

	public Room getRoomByRoomNumber(long roomNumber, Hostel hostel) throws SQLException;

	public List<Room> fingByHostel(Hostel hostel) throws SQLException;

	public void updateRoomNumber(Room room) throws SQLException;
	
	public int setRoomCountZero() throws SQLException;

}
