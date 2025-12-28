package dao;

import java.sql.*;
import java.util.*;

import model.model;

public class TodoADO {
    private Connection conn;

    public TodoADO(Connection conn) {
        this.conn = conn;
    }

    public boolean addTodo(String name, String todo, String status) {
        boolean f = false;
        try {
            String sql = "insert into todo_info(uname,content,ustatus) values(?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, todo);
            ps.setString(3, status);
            f = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public List<model> getTodo() {
        List<model> list = new ArrayList<>();
        try {
            String sql = "select * from todo_info";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                model t = new model();
                t.setId(rs.getInt("id"));
                t.setName(rs.getString("uname"));
                t.setTodo(rs.getString("content"));
                t.setStatus(rs.getString("ustatus"));
                list.add(t);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public model getTodoById(int id) {
        model t = null;
        try {
            String sql = "select * from todo_info where id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                t = new model();
                t.setId(rs.getInt("id"));
                t.setName(rs.getString("uname"));
                t.setTodo(rs.getString("content"));
                t.setStatus(rs.getString("ustatus"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return t;
    }

    public boolean updateTodo(model t) {
        boolean f = false;
        try {
            String sql = "update todo_info set uname=?, content=?, ustatus=? where id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, t.getName());
            ps.setString(2, t.getTodo());
            ps.setString(3, t.getStatus());
            ps.setInt(4, t.getId());
            f = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public boolean deleteTodo(int id) {
        boolean f = false;
        try {
            String sql = "delete from todo_info where id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            f = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
}
