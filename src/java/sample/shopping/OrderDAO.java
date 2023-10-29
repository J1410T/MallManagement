/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.shopping;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import sample.utils.DBUtils;

public class OrderDAO {

    private static final String INSERT_ORDER = "insert into [dbo].[Orders]([dateBuy], [total], [userID], [phone], [address])values(?,?,?,?,?)";
    private static final String INSERT_ORDER_DETAIL = "insert into [dbo].[OrderDetails] ([sku], [order_id], [price], [quantity], [total]) values (?,?,?,?,?)";

    public static Boolean insertOrder(Cart cart, OrderDTO order) throws SQLException, ClassNotFoundException {
        //add vao order
        Boolean check = true;
        Connection conn = DBUtils.getConnection();
        PreparedStatement ptm = null;

        try {
            conn.setAutoCommit(false);
            int result = 0;
            if (conn != null) {

                ptm = conn.prepareStatement(INSERT_ORDER);
                ptm.setDate(1, order.getDate());
                ptm.setDouble(2, order.getTotal());
                ptm.setString(3, order.getUserID());
                ptm.setString(4, order.getPhone());
                ptm.setString(5, order.getAddress());

                result = ptm.executeUpdate();
                if (result > 0) {
                    String sql = "select Max([id]) as 'id' from [dbo].[Orders]";
                    ptm = conn.prepareStatement(sql);
                    ResultSet rs = ptm.executeQuery();
                    if (rs != null && rs.next()) {
                        int order_id = rs.getInt("id");
                        //add vao orderdetail
                        for (Fashion f : cart.getCart().values()) {
                            ptm = conn.prepareStatement(INSERT_ORDER_DETAIL);
                            ptm.setString(1, f.getId());
                            ptm.setInt(2, order_id);
                            ptm.setDouble(3, f.getPrice());
                            ptm.setInt(4, f.getQuantity());
                            ptm.setDouble(5, order.getTotal());

                            result = ptm.executeUpdate();
                            if (result == 0) {
                                throw new Exception();
                            }
                        }

                    }

                }

            }
            conn.commit();
        } catch (Exception e) {
            check = false;
            conn.rollback();
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        //add vao orderdetail
        return check;
    }
}
