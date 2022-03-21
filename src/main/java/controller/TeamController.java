package controller;

import model.Match;
import model.Team;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import java.sql.Connection;
import java.util.List;

public class TeamController {
    private Connection connection;
    private EntityManagerFactory entityManagerFactory;

    public TeamController(Connection c, EntityManagerFactory entityManagerFactory) {
        this.connection = c;
        this.entityManagerFactory = entityManagerFactory;
    }
    public void listTeams(){
        EntityManager em = entityManagerFactory.createEntityManager();
        em.getTransaction().begin();
        List<Team> result = em.createQuery("from team", Team.class)
                .getResultList();
        for (Team team : result) {
            System.out.println(team.toString());
        }
        em.getTransaction().commit();
        em.close();
    }
}
