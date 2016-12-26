package sspkm.models.invoice.dao.jpa;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

import sspkm.models.abstractdao.jpa.AbstractDaoImpl;
import sspkm.models.invoice.Invoice;
import sspkm.models.invoice.dao.InvoiceDao;
import sspkm.models.user.User;

@Repository
public class InvoiceDaoImpl extends AbstractDaoImpl<Invoice> implements InvoiceDao{

	public InvoiceDaoImpl() {
		setClazz(Invoice.class);
	}

	@Override
	public List<Invoice> getInvoiceByUser(User user, Date date) {
		String query="from Invoice where user = :user and invoiceDate = :date";
		List<Invoice> invoices=em.createQuery(query, Invoice.class).setParameter("user", user)
																.setParameter("date", date)
																.getResultList();
		
		return invoices;
	}

	@Override
	public List<Invoice> getInvoiceByUser(User user, Date startDate, Date endDate) {
		String Query="from Invoice where user =:user and invoiceDate between :startDate and :endDate";
		List<Invoice> invoices=em.createQuery(Query, Invoice.class).setParameter("user", user)
																	.setParameter("startDate", startDate)
																	.setParameter("endDate", endDate).getResultList();
		return invoices;
	}

	@Override
	public List<Invoice> getInvoiceByDate(Date startDate, Date endDate,String gender) {
		String query="from Invoice where user in(from User where gender = :gender) and invoiceDate between :startDate and :endDate";
		
		List<Invoice> invoices=em.createQuery(query, Invoice.class).setParameter("gender", gender)
																	.setParameter("startDate", startDate)
																	.setParameter("endDate", endDate).getResultList();
		return invoices;
	}

	@Override
	public List<Invoice> getInvoiceByType(String type, Date startDate, Date endDate, String gender) {
		String query="from Invoice where (user in(from User where gender = :gender) and invoiceType = :invoiceType) and invoiceDate between :startDate and :endDate";
		
		List<Invoice> invoices=em.createQuery(query, Invoice.class).setParameter("gender", gender)
																	.setParameter("invoiceType", type)
																	.setParameter("startDate", startDate)
																	.setParameter("endDate", endDate).getResultList();
		return invoices;
	}
}
