package test;

import dao.DBC;
import dao.MariaDBCon;

import java.sql.*;
import java.util.Scanner;

public class DaoTest4 {
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
        System.out.println("가입할 회원의 아이디를 입력 : ");
        String id = sc.nextLine();
        System.out.println("변경(가점/감소)할 포인트 입력 : ");
        int point = sc.nextInt();
        int cnt = 0;
        try {
            String sql = "update * from member set point=point+? where id=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, point);
            pstmt.setString(2, id);
            cnt = pstmt.executeUpdate();
           if(cnt>0){
               System.out.println("해당 회원의 포인트 변경이 성공적으로 이루어졌습니다.");
           } else {
               System.out.println("변경 실패");
           }
            con.close(pstmt, conn);
        } catch (SQLException e) {
            System.out.println("SQL 구문이 처리되지 못했습니다.");
        }
    }
}
