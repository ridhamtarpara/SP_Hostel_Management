package sspkm.models.invoice.dao;

import java.sql.Date;
import java.util.List;

import sspkm.models.abstractdao.AbstractDao;
import sspkm.models.invoice.Invoice;
import sspkm.models.user.User;

public interface InvoiceDao extends AbstractDao<Invoice> {

	List<Invoice> getInvoiceByUser(User user,Date date);
	
	List<Invoice> getInvoiceByUser(User user,Date startDate,Date endDate);
	
	List<Invoice> getInvoiceByDate(Date startDate,Date endDate,String gender);
	
	List<Invoice> getInvoiceByType(String type,Date startDate,Date endDate,String gender);
}
