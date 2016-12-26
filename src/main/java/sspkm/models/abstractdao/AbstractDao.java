package sspkm.models.abstractdao;

import java.sql.SQLException;
import java.util.List;

public interface AbstractDao<T> {
	public T findById(long id) throws SQLException;

	public List<T> findAll() throws SQLException;

	public T create(T entity) throws SQLException;

	public T update(T entity) throws SQLException;

	public void delete(T entity) throws SQLException;

	public void deleteById(long entityId) throws SQLException;
}
