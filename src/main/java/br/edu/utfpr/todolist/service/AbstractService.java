package br.edu.utfpr.todolist.service;

import java.util.List;
import br.edu.utfpr.todolist.model.dao.AbstractDAO;
import br.edu.utfpr.todolist.util.JPAUtil;

public class AbstractService<PK, T> {

    protected AbstractDAO<PK, T> dao;

    public boolean save(T entity) {
        boolean isSuccess = true;
        try {
            JPAUtil.beginTransaction();
            dao.save(entity);
            JPAUtil.commit();
        } catch (Exception e) {
            e.printStackTrace();
            isSuccess = false;
            JPAUtil.rollBack();
        } finally {
            JPAUtil.closeEntityManager();
        }
        return isSuccess;
    }

    public T getById(PK pk) {
        T entity = null;
        entity = dao.getById(pk);
        return entity;
    }

    public T getByProperty(String propertyName, String propertyValue) {
        T entity = null;
        entity = dao.getByProperty(propertyName, propertyValue);
        return entity;
    }

    public List<T> findAll() {
        List<T> entities = null;
        entities = dao.findAll();
        return entities;
    }

    public boolean update(T entity) {
        boolean isSuccess = true;
        try {
            JPAUtil.beginTransaction();
            dao.update(entity);
            JPAUtil.commit();
        } catch (Exception e) {
            isSuccess = false;
            JPAUtil.rollBack();
        }
        return isSuccess;
    }

    public boolean delete(T entity) {
        boolean isSuccess = true;
        try {
            JPAUtil.beginTransaction();
            dao.delete(entity);
            JPAUtil.commit();
        } catch (Exception e) {
            isSuccess = false;
            JPAUtil.rollBack();
        }
        return isSuccess;
    }

    public boolean deleteById(PK pk) {
        boolean isSuccess = true;
        T entity = null;
        try {
            JPAUtil.beginTransaction();
            entity = dao.getById(pk);

            if(entity == null){
                return false;
            }

            dao.delete(entity);
            JPAUtil.commit();
        } catch (Exception e) {
            isSuccess = false;
            JPAUtil.rollBack();
        }
        return isSuccess;
    }

    public List<T> listByForeignOrObjectProperty(String propertyName, Object propertyValue) {
        List<T> entities = null;
        entities = dao.listByForeignOrObjectProperty(propertyName, propertyValue);
        return entities;
    }

    public List<T> listToDoTasks() {
        return null;
    }
    public List<T> listCompletedTasks() {
        return null;
    }
}
