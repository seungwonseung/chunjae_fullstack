package test;

import dao.DBC;
import dao.MariaDBCon;

import java.sql.*;
import java.util.Scanner;

public class DaoTest5 {
    static Connection conn = null;
    static PreparedStatement pstmt = null;
    static Statement stmt = null;
    static ResultSet rs = null;

    public static void main(String[] args) {
        DBC con = new MariaDBCon();
        conn = con.connect();
        if (conn != null) {
            System.out.printf("DB 연결 성공");
        }
        Scanner sc = new Scanner(System.in);
        System.out.println("삭제할 회원의 아이디를 입력 : ");
        String id = sc.nextLine();
        int cnt = 0;
        try {
            String sql = "delete from member where id=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            cnt = pstmt.executeUpdate();
           if(cnt>0){
               System.out.println("삭제 성공.");
           } else {
               System.out.println("삭제 실패");
           }
            con.close(pstmt, conn);
        } catch (SQLException e) {
            System.out.println("SQL 구문이 처리되지 못했습니다.");
        }
    }
}
