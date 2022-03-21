package controller;

import model.Match;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import java.sql.Connection;
import java.util.List;

public class MatchController {
    private Connection connection;
    private EntityManagerFactory entityManagerFactory;

    public MatchController(Connection c, EntityManagerFactory entityManagerFactory) {
        this.connection = c;
        this.entityManagerFactory = entityManagerFactory;
    }
    public void listMatches(){
        EntityManager em = entityManagerFactory.createEntityManager();
        em.getTransaction().begin();
        List<Match> result = em.createQuery("from match", Match.class)
                .getResultList();
        for (Match match : result) {
            System.out.println(match.toString());
        }
        em.getTransaction().commit();
        em.close();
    }
}
