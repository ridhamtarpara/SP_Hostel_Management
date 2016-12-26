package sspkm.models.report.dao.jpa;

import org.springframework.stereotype.Repository;

import sspkm.models.abstractdao.jpa.AbstractDaoImpl;
import sspkm.models.report.Report;
import sspkm.models.report.dao.ReportDao;

@Repository
public class ReportDaoImpl extends AbstractDaoImpl<Report> implements ReportDao{

	public ReportDaoImpl() {
		setClazz(Report.class);
	}
	
}
