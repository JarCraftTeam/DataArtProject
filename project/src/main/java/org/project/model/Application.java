package org.project.model;

import org.hibernate.Session;

public class Application {
	public static void main(String[] args) {
		Session session = HibernateUtil.getSessionFactory().openSession();

		try {
			session.beginTransaction();

			session.getTransaction().commit();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
			HibernateUtil.getSessionFactory().close();
		}
	}

}