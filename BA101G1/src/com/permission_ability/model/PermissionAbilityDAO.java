package com.permission_ability.model;

import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import org.hibernate.*;
import com.tools.HibernateUtil;


public class PermissionAbilityDAO implements Permission_AbilityDAO_interface{
	
	private static final String GET_ALL_STMT = "from PermissionVO order by man_id desc";
	@Override
	public void insert(Permission_AbilityVO paVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(paVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
	}


	@Override
	public void update(Permission_AbilityVO paVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(paVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
	}


	@Override
	public void delete(String pa_id) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			
//        【此時多方(宜)可採用HQL刪除】
//			Query query = session.createQuery("delete EmpVO where empno=?");
//			query.setParameter(0, empno);
//			System.out.println("刪除的筆數=" + query.executeUpdate());
			
//        【或此時多方(也)可採用去除關聯關係後，再刪除的方式】
			Permission_AbilityVO paVO = new Permission_AbilityVO();
			paVO.setPa_id(pa_id);
			session.delete(paVO);
			
//        【此時多方不可(不宜)採用cascade聯級刪除】
//        【多方emp2.hbm.xml如果設為 cascade="all"或 cascade="delete"將會刪除所有相關資料-包括所屬部門與同部門的其它員工將會一併被刪除】
//			EmpVO empVO = (EmpVO) session.get(EmpVO.class, empno);
//			session.delete(empVO);
			
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}
	
	
	@Override
	public Permission_AbilityVO findByPrimaryKey(String pano) {
		Permission_AbilityVO paVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			paVO = (Permission_AbilityVO) session.get(Permission_AbilityVO.class, pano);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return paVO;
	}




	@Override
	public List<Permission_AbilityVO> getAll() {
		List<Permission_AbilityVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_ALL_STMT);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}







	
}
