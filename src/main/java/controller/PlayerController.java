package controller;

import model.Match;
import model.Player;
import model.Team;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import java.sql.Connection;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Scanner;

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
    public void addPlayer() throws ParseException {
        try{
            Scanner sc = new Scanner(System.in);
            System.out.println("Name\nsurname1\nsurname2\nbirthdate\nactive");
            Player player = new Player(sc.next(), sc.next(), sc.next(), new SimpleDateFormat("dd/mm/yyyy").parse(sc.next()), sc.nextBoolean());
            EntityManager em = entityManagerFactory.createEntityManager();
            em.getTransaction().begin();
            em.merge(player);
            em.getTransaction().commit();
            em.close();
        }
        catch(Exception e){
            e.printStackTrace();
            addPlayer();
        }
    }
    public void deleteAllEntries(){
        EntityManager em = entityManagerFactory.createEntityManager();
        em.getTransaction().begin();
        em.createQuery("delete from player").executeUpdate();
        em.getTransaction().commit();
        em.close();
    }
}
