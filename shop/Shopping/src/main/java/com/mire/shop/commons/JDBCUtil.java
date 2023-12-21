package com.mire.shop.commons;

import java.sql.Connection;	
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class JDBCUtil {
	private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
    private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
    private static final String ID = "javauser";
    private static final String PASS = "java1234";

    public static Connection getConnection() {
    	Connection conn = null;
    		try {
        		 Class.forName(DRIVER);
        		conn = DriverManager.getConnection(URL, ID, PASS); 
              System.out.println(conn);
          } catch (Exception e) {
              e.printStackTrace();
          }
        return conn;
    }

    public static void close(PreparedStatement stmt, Connection conn) {
        if (stmt != null) {
            try {
                if (!stmt.isClosed())
                    stmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                stmt = null;
            }
        }

        if (conn != null) {
            try {
                if (!conn.isClosed())
                    conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                conn = null;
            }
        }
    }

    public static void close(ResultSet rs, PreparedStatement stmt, Connection conn) {
        if (rs != null) {
            try {
                if (!rs.isClosed())
                    rs.close();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                rs = null;
            }
        }

        if (stmt != null) {
            try {
                if (!stmt.isClosed())
                    stmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                stmt = null;
            }
        }

        if (conn != null) {
            try {
                if (!conn.isClosed())
                    conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                conn = null;
            }
        }
    }
}