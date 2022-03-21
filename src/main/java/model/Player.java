package model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity(name = "player")
@Access(AccessType.FIELD)
@Table(name = "player")
public class Player implements Serializable {
  @Id
  @Column(name = "id_player")
  int id_player;
  @Column(name = "name", length = 20)
  String name;
  @Column(name = "surname1", length = 20)
  String surname1;
  @Column(name = "surname2", length = 20)
  String surname2;
  @Column(name = "birthdate")
  Date birthdate;
  @Column(name = "active")
  boolean active;
/*
  @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
  @JoinColumn(name = "id_autor")
  public Author author;
*/
  public Player(int id_player, String name, String surname1,
                String surname2, Date birthdate, boolean active) {
    super();
    this.id_player = id_player;
    this.name = name;
    this.surname1 = surname1;
    this.surname2 = surname2;
    this.birthdate = birthdate;
    this.active = active;
  }
  public Player(String name, String surname1,
                String surname2, Date birthdate, boolean active) {
    super();
    this.name = name;
    this.surname1 = surname1;
    this.surname2 = surname2;
    this.birthdate = birthdate;
    this.active = active;
  }
  public Player() {
    super();

  }

  public int getId_player() {
    return id_player;
  }

  public void setId_player(int id_player) {
    this.id_player = id_player;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getSurname1() {
    return surname1;
  }

  public void setSurname1(String surname1) {
    this.surname1 = surname1;
  }

  public String getSurname2() {
    return surname2;
  }

  public void setSurname2(String surname2) {
    this.surname2 = surname2;
  }

  public Date getBirthdate() {
    return birthdate;
  }

  public void setBirthdate(Date birthdate) {
    this.birthdate = birthdate;
  }

  public boolean isActive() {
    return active;
  }

  public void setActive(boolean active) {
    this.active = active;
  }

  @Override
  public String toString() {
    return "Player{" +
            "id_player=" + id_player +
            ", name='" + name + '\'' +
            ", surname1='" + surname1 + '\'' +
            ", surname2='" + surname2 + '\'' +
            ", birthdate=" + birthdate +
            ", active=" + active +
            '}';
  }
}
