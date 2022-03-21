package controller;

import model.Match;
import model.Player;
import model.Team;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import java.sql.Connection;
import java.util.List;

public class PlayerController {
    private Connection connection;
    private EntityManagerFactory entityManagerFactory;

    public PlayerController(Connection c, EntityManagerFactory entityManagerFactory) {
        this.connection = c;
        this.entityManagerFactory = entityManagerFactory;
    }
    public void listPlayers(){
        EntityManager em = entityManagerFactory.createEntityManager();
        em.getTransaction().begin();
        List<Player> result = em.createQuery("from player", Player.class)
                .getResultList();
        for (Player player : result) {
            System.out.println(player.toString());
        }
        em.getTransaction().commit();
        em.close();
    }
}
