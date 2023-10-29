/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.shopping.ProductDTO;
import sample.utils.DBUtils;

public class ProductDAO {

    private static final String GET_PRODUCT = "SELECT * FROM Product";

    public static List<ProductDTO> getListProduct() throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_PRODUCT);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String sku = rs.getString("sku");
                    String Name = rs.getString("name");
                    String Description = rs.getString("description");
                    int Quantity = rs.getInt("quantity");
                    Double Price = rs.getDouble("price");
                    String Image = rs.getString("image");
                    ProductDTO pro = new ProductDTO(sku, Name, Description, Price, Quantity, Image);
                    list.add(pro);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return list;

    }

    public static ProductDTO getProduct(String id) throws SQLException {
        ProductDTO product = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            String sql = "SELECT *\n"
                    + "FROM [dbo].[Product]\n"
                    + "WHERE [sku] = ?";
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, id);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String sku = rs.getString("sku");
                    String Name = rs.getString("name");
                    String Description = rs.getString("description");
                    int Quantity = rs.getInt("quantity");
                    Double Price = rs.getDouble("price");
                    String Image = rs.getString("image");
                    product = new ProductDTO(sku, Name, Description, Price, Quantity, Image);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return product;

    }
}
