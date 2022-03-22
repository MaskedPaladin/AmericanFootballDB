package controller;

import model.Match;
import model.Player;
import model.Team;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Scanner;

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
    public void addTeam(){
        Scanner sc = new Scanner(System.in);
        EntityManager em = entityManagerFactory.createEntityManager();
        System.out.println("Name\nbowls_won");
        Team team = new Team(sc.next(), sc.nextInt());
        em.getTransaction().begin();
        em.merge(team);
        em.getTransaction().commit();
        em.close();
    }
}
