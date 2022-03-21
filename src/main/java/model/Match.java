package model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity(name = "match")
@Access(AccessType.FIELD)
@Table(name = "match")
public class Match implements Serializable {
  @Id
  @Column(name = "id_match")
  int id_match;
  @Column(name = "local_team_id")
  int local_team_id;
  @Column(name = "visitor_team_id")
  int visitor_team_id;
  @Column(name = "local_points")
  int local_points;
  @Column(name = "visitor_points")
  int visitor_points;
  @Column(name = "date")
  Date date;

  public Match(int id_match, int local_team_id, int visitor_team_id, int local_points, int visitor_points, Date date) {
    super();
    this.id_match = id_match;
    this.local_team_id = local_team_id;
    this.visitor_team_id = visitor_team_id;
    this.local_points = local_points;
    this.visitor_points = visitor_points;
    this.date = date;
  }

  public Match() {

  }

  public int getId_match() {
    return id_match;
  }

  public void setId_match(int id_match) {
    this.id_match = id_match;
  }

  public int getLocal_team_id() {
    return local_team_id;
  }

  public void setLocal_team_id(int local_team_id) {
    this.local_team_id = local_team_id;
  }

  public int getVisitor_team_id() {
    return visitor_team_id;
  }

  public void setVisitor_team_id(int visitor_team_id) {
    this.visitor_team_id = visitor_team_id;
  }

  public int getLocal_points() {
    return local_points;
  }

  public void setLocal_points(int local_points) {
    this.local_points = local_points;
  }

  public int getVisitor_points() {
    return visitor_points;
  }

  public void setVisitor_points(int visitor_points) {
    this.visitor_points = visitor_points;
  }

  public Date getDate() {
    return date;
  }

  public void setDate(Date date) {
    this.date = date;
  }

  @Override
  public String toString() {
    return "Match{" +
            "id_match=" + id_match +
            ", local_team_id=" + local_team_id +
            ", visitor_team_id=" + visitor_team_id +
            ", local_points=" + local_points +
            ", visitor_points=" + visitor_points +
            ", date=" + date +
            '}';
  }
}
