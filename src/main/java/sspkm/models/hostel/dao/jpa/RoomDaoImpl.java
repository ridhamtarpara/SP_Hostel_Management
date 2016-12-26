package sspkm.models.hostel.dao.jpa;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import sspkm.models.abstractdao.jpa.AbstractDaoImpl;
import sspkm.models.academic.SubCourse;
import sspkm.models.hostel.Hostel;
import sspkm.models.hostel.Room;
import sspkm.models.hostel.dao.RoomDao;
import sspkm.models.student.Student;

@Repository
public class RoomDaoImpl extends AbstractDaoImpl<Room> implements RoomDao {

	public RoomDaoImpl() {
		setClazz(Room.class);
	}

	@Override
	public List<Student> getRoomsByCourse(Hostel hostel, SubCourse course) {
		String q = "from Student where course = :course AND hostel = :hostel";
		List<Student> students = em.createQuery(q, Student.class).setParameter("course", course)
				.setParameter("hostel", hostel).getResultList();
		return students;
	}

	@Override
	public Room getRoomByRoomNumber(long roomNumber, Hostel hostel) {
		String q = "from Room where roomNumber = :roomNumber AND hostel = :hostel";
		List<Room> room = em.createQuery(q, Room.class).setParameter("roomNumber", roomNumber)
				.setParameter("hostel", hostel).getResultList();
		return room.get(0);
	}

	@Override
	public void updateRoomNumber(Room r) {
		Room room = findById(r.getRoomId());
		room.setNumberOfStudents(r.getNumberOfStudents() + 1);
		room = update(room);
	}

	@Override
	public List<Room> fingByHostel(Hostel hostel) {
		String q = "from Room where hostel= :hostel AND numberOfStudents < 4 ORDER BY roomNumber";
		List<Room> room = em.createQuery(q, Room.class).setParameter("hostel", hostel).getResultList();
		return room;
	}
	@Transactional
	@Override
	public int setRoomCountZero() {
		Query query = em.createQuery("UPDATE Room SET numberOfStudents = 0");
		int updateCount = query.executeUpdate();
		return updateCount;
	}

}