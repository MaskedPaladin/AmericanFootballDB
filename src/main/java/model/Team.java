package model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity(name = "team")
@Access(AccessType.FIELD)
@Table(name = "team")
public class Team implements Serializable {
  @Id
  @Column(name = "id_team")
  private int id_team;
  @Column(name = "name", length = 20)
  private String name;
  @Column(name = "bowls_won")
  private int bowls_won;

  public Team(String name, int bowls_won) {
    super();
    this.name = name;
    this.bowls_won = bowls_won;
  }

  public Team() {
    super();
  }

  public int getId_team() {
    return id_team;
  }

  public void setId_team(int id_team) {
    this.id_team = id_team;
  }

  @Override
  public String toString() {
    return "Magazine{" +
            "id_team=" + id_team +
            ", name='" + name + '\'' +
            ", bowls_won=" + bowls_won +
            '}';
  }
}
