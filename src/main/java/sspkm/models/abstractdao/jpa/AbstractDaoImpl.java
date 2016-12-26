package sspkm.models.abstractdao.jpa;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import sspkm.models.abstractdao.AbstractDao;

@Repository
public abstract class AbstractDaoImpl<T extends Serializable> implements AbstractDao<T> {

	private Class<T> clazz;

	@PersistenceContext
	public EntityManager em;

	public final void setClazz(Class<T> clazzToSet) {

		this.clazz = clazzToSet;

	}

	public T findById(long id) {
		return em.find(clazz, id);
	}

	@SuppressWarnings("unchecked")
	public List<T> findAll() {
		return em.createQuery("from " + clazz.getName()).getResultList();
	}

	@Transactional
	public T create(T entity) throws SQLException {
		em.persist(entity);
		em.flush();
		return entity;
	}

	@Transactional
	public T update(T entity) {
		T done = em.merge(entity);
		return done;
	}

	@Transactional
	public void delete(T entity) {
		em.remove(em.contains(entity) ? entity : em.merge(entity));
	}

	@Transactional
	public void deleteById(long entityId) {
		T entity = findById(entityId);
		em.remove(em.contains(entity) ? entity : em.merge(entity));
	}

}
