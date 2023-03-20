/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.Capacity;
import model.Cart;
import model.Category;
import model.Color;
import model.Galery;
import model.Item;
import model.Model;
import model.Product;
import model.Ram;
import model.Role;
import model.Size;
import model.User;

/**
 *
 * @author hp
 */
public class DAO extends DBContext {

    public List<Category> getAll() {
        List<Category> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "  FROM [dbo].[Category]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt("id"), rs.getString("name"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Color> getAllColor() {
        List<Color> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "  FROM [dbo].[Color]"
                + "order by name asc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Color c = new Color(rs.getInt("id"), rs.getString("name"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Size> getAllSize() {
        List<Size> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "  FROM [dbo].[Size]"
                + "order by name asc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Size c = new Size(rs.getInt("id"), rs.getString("name"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Capacity> getAllCapacity() {
        List<Capacity> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "  FROM [dbo].[Capacity]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Capacity c = new Capacity(rs.getInt("id"), rs.getString("name"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Role> getAllRole() {
        List<Role> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "  FROM [dbo].[Role]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Role r = new Role(rs.getInt("id"), rs.getString("name"));
                list.add(r);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getAllProductToManage() {
        List<Product> list = new ArrayList<>();

        String sql = "SELECT [id]\n"
                + "      ,[category_id]\n"
                + "      ,[title]\n"
                + "      ,[color_id]\n"
                + "      ,[capacity_id]\n"
                + "      ,[model_id]\n"
                + "      ,[ram_id]\n"
                + "      ,[size_id]\n"
                + "      ,[price]\n"
                + "      ,[thumbnail]\n"
                + "      ,[description]\n"
                + "      ,[create_at]\n"
                + "      ,[quantity]\n"
                + "  FROM [La_Mela].[dbo].[Product]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                Category c = getCategoryById(rs.getInt("category_id"));
                p.setCategory(c);
                p.setTitle(rs.getString("title"));
                Color cl = getColorById(rs.getInt("color_id"));
                p.setColor(cl);
                Capacity ca = getCapacityById(rs.getInt("capacity_id"));
                p.setCapacity(ca);
                Model m = getModelById(rs.getInt("model_id"));
                p.setModel(m);
                Ram r = getRamById(rs.getInt("ram_id"));
                p.setRam(r);
                Size s = getSizeById(rs.getInt("size_id"));
                p.setSize(s);
                p.setPrice(rs.getInt("price"));
                p.setThumbnail(rs.getString("thumbnail"));
                p.setDescription(rs.getString("description"));
                p.setQuantity(rs.getInt("quantity"));
                Galery g = getThumbnailByPid(rs.getInt("id"));
                p.setGalery(g);
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<User> getAllUserToManage() {
        List<User> list = new ArrayList<>();

        String sql = "SELECT [id]\n"
                + "      ,[fullname]\n"
                + "      ,[email]\n"
                + "      ,[phone_number]\n"
                + "      ,[address]\n"
                + "      ,[role_id]\n"
                + "  FROM [dbo].[User]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User p = new User();
                p.setId(rs.getInt("id"));
                p.setFullname(rs.getString("fullname"));
                p.setEmail(rs.getString("email"));
                p.setAddress(rs.getString("address"));
                p.setPhone_number(rs.getString("phone_number"));
                Role r = getRoleById(rs.getInt("role_id"));
                p.setRole(r);
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<User> getTop5User(int year) {
        List<User> list = new ArrayList<>();

        String sql = "SELECT top (5) \n"
                + "                    u.fullname, u.email, u.phone_number, u.address,sum(price) as price, sum(quantity) as quantity , year(o.order_date) as year\n"
                + "                     FROM [Orders] o join   \n"
                + "                     Order_Details od on   \n"
                + "                     o.id = od.order_id  \n"
                + "                     join [User] u on  \n"
                + "                     o.user_id = u.id  \n"
                + "                     where year(o.order_date) = ?	\n"
                + "                   group by u.fullname, u.email, u.phone_number, u.address  , year(o.order_date)\n"
                + "                   order by quantity desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, year);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User p = new User();
                p.setFullname(rs.getString("fullname"));
                p.setEmail(rs.getString("email"));
                p.setAddress(rs.getString("address"));
                p.setPhone_number(rs.getString("phone_number"));
                p.setQuantity(rs.getInt("quantity"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<User> searchUser(String txt) {
        List<User> list = new ArrayList<>();

        String sql = "SELECT [id]\n"
                + "      ,[fullname]\n"
                + "      ,[email]\n"
                + "      ,[phone_number]\n"
                + "      ,[address]\n"
                + "      ,[role_id]\n"
                + "  FROM [dbo].[User] where email like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + txt + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User p = new User();
                p.setId(rs.getInt("id"));
                p.setFullname(rs.getString("fullname"));
                p.setEmail(rs.getString("email"));
                p.setAddress(rs.getString("address"));
                p.setPhone_number(rs.getString("phone_number"));
                Role r = getRoleById(rs.getInt("role_id"));
                p.setRole(r);
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Category getCategoryById(int id) {
        String sql = "SELECT [ID]\n"
                + "      ,[name]\n"
                + "  FROM [dbo].[Category]\n"
                + "  where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Category c = new Category(rs.getInt("id"), rs.getString("name"));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Role getRoleById(int id) {
        String sql = "SELECT [ID]\n"
                + "      ,[name]\n"
                + "  FROM [dbo].[Role]\n"
                + "  where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Role c = new Role(rs.getInt("id"), rs.getString("name"));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Product getProductsById(int id) {
        String sql = "SELECT [id]\n"
                + "      ,[category_id]\n"
                + "      ,[title]\n"
                + "      ,[color_id]\n"
                + "      ,[capacity_id]\n"
                + "      ,[model_id]\n"
                + "      ,[ram_id]\n"
                + "      ,[size_id]\n"
                + "      ,[price]\n"
                + "      ,[thumbnail]\n"
                + "      ,[description]\n"
                + "      ,[create_at]\n"
                + "      ,[quantity]\n"
                + "  FROM [dbo].[Product] where id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                Category c = getCategoryById(rs.getInt("category_id"));
                p.setCategory(c);
                p.setTitle(rs.getString("title"));
                Color cl = getColorById(rs.getInt("color_id"));
                p.setColor(cl);
                Capacity ca = getCapacityById(rs.getInt("capacity_id"));
                p.setCapacity(ca);
                Model m = getModelById(rs.getInt("model_id"));
                p.setModel(m);
                Ram r = getRamById(rs.getInt("ram_id"));
                p.setRam(r);
                Size s = getSizeById(rs.getInt("size_id"));
                p.setSize(s);
                p.setPrice(rs.getInt("price"));

                p.setThumbnail(rs.getString("thumbnail"));
                p.setDescription(rs.getString("description"));
                p.setQuantity(rs.getInt("quantity"));
                Galery g = getThumbnailByPid(rs.getInt("id"));
                p.setGalery(g);
                return p;
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public List<Product> getProductsByCid(int cid) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[category_id]\n"
                + "      ,[title]\n"
                + "      ,[color_id]\n"
                + "      ,[capacity_id]\n"
                + "      ,[model_id]\n"
                + "      ,[ram_id]\n"
                + "      ,[size_id]\n"
                + "      ,[price]\n"
                + "      ,[thumbnail]\n"
                + "      ,[description]\n"
                + "  FROM [dbo].[Product]\n"
                + "  where 1=1";
        if (cid != 0) {
            sql += " and category_id=" + cid;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            //st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                Category c = getCategoryById(rs.getInt("category_id"));
                p.setCategory(c);
                p.setTitle(rs.getString("title"));
                Color cl = getColorById(rs.getInt("color_id"));
                p.setColor(cl);
                Capacity ca = getCapacityById(rs.getInt("capacity_id"));
                p.setCapacity(ca);
                Model m = getModelById(rs.getInt("model_id"));
                p.setModel(m);
                Ram r = getRamById(rs.getInt("ram_id"));
                p.setRam(r);
                Size s = getSizeById(rs.getInt("size_id"));
                p.setSize(s);
                p.setPrice(rs.getInt("price"));
                p.setThumbnail(rs.getString("thumbnail"));
                p.setDescription(rs.getString("description"));
                list.add(p);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public List<Product> searchAllProducts(String txtSearch) {
        List<Product> list = new ArrayList<>();

        String sql = "SELECT [id]\n"
                + "      ,[category_id]\n"
                + "      ,[title]\n"
                + "      ,[color_id]\n"
                + "      ,[capacity_id]\n"
                + "      ,[model_id]\n"
                + "      ,[ram_id]\n"
                + "      ,[size_id]\n"
                + "      ,[price]\n"
                + "      ,[thumbnail]\n"
                + "      ,[description]\n"
                + "  FROM [dbo].[Product] where title like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + txtSearch + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                Category c = getCategoryById(rs.getInt("category_id"));
                p.setCategory(c);
                p.setTitle(rs.getString("title"));
                Color cl = getColorById(rs.getInt("color_id"));
                p.setColor(cl);
                Capacity ca = getCapacityById(rs.getInt("capacity_id"));
                p.setCapacity(ca);
                Model m = getModelById(rs.getInt("model_id"));
                p.setModel(m);
                Ram r = getRamById(rs.getInt("ram_id"));
                p.setRam(r);
                Size s = getSizeById(rs.getInt("size_id"));
                p.setSize(s);
                p.setPrice(rs.getInt("price"));

                p.setThumbnail(rs.getString("thumbnail"));
                p.setDescription(rs.getString("description"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> searchByName(String txtSearch) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT [category_id]\n"
                + "      ,[title]  \n"
                + "	  ,min(price) as [price]\n"
                + "      ,[thumbnail]\n"
                + "      ,[description]\n"
                + "      ,[create_at]\n"
                + "  FROM [dbo].[Product]\n"
                + " Where title like ?"
                + "  GROUP BY [category_id]\n"
                + "      ,[title]      \n"
                + "      ,[thumbnail]\n"
                + "      ,[description]\n"
                + "      ,[create_at]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + txtSearch + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();

                Category c = getCategoryById(rs.getInt("category_id"));
                p.setCategory(c);
                p.setTitle(rs.getString("title"));
                p.setPrice(rs.getInt("price"));
                p.setThumbnail(rs.getString("thumbnail"));
                p.setDescription(rs.getString("description"));

                list.add(p);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public List<Product> searchByPrice(int price1, int price2) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT [category_id]\n"
                + "      ,[title]  \n"
                + "	  ,min(price) as [price]\n"
                + "      ,[thumbnail]\n"
                + "      ,[description]\n"
                + "      ,[create_at]\n"
                + "  FROM [dbo].[Product]\n"
                + " Where price between ? and ?"
                + "  GROUP BY [category_id]\n"
                + "      ,[title]      \n"
                + "      ,[thumbnail]\n"
                + "      ,[description]\n"
                + "      ,[create_at]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, price1);
            st.setInt(2, price2);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();

                Category c = getCategoryById(rs.getInt("category_id"));
                p.setCategory(c);
                p.setTitle(rs.getString("title"));
                p.setPrice(rs.getInt("price"));
                p.setThumbnail(rs.getString("thumbnail"));
                p.setDescription(rs.getString("description"));

                list.add(p);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public List<Product> searchByTitleAsc() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT [category_id]\n"
                + "      ,[title]  \n"
                + "	  ,min(price) as [price]\n"
                + "      ,[thumbnail]\n"
                + "      ,[description]\n"
                + "      ,[create_at]\n"
                + "  FROM [dbo].[Product]\n"
                + "  GROUP BY [category_id]\n"
                + "      ,[title]      \n"
                + "      ,[thumbnail]\n"
                + "      ,[description]\n"
                + "      ,[create_at]"
                + "order by title asc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();

                Category c = getCategoryById(rs.getInt("category_id"));
                p.setCategory(c);
                p.setTitle(rs.getString("title"));
                p.setPrice(rs.getInt("price"));
                p.setThumbnail(rs.getString("thumbnail"));
                p.setDescription(rs.getString("description"));

                list.add(p);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public List<Product> searchByTitleDesc() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT [category_id]\n"
                + "      ,[title]  \n"
                + "	  ,min(price) as [price]\n"
                + "      ,[thumbnail]\n"
                + "      ,[description]\n"
                + "      ,[create_at]\n"
                + "  FROM [dbo].[Product]\n"
                + "  GROUP BY [category_id]\n"
                + "      ,[title]      \n"
                + "      ,[thumbnail]\n"
                + "      ,[description]\n"
                + "      ,[create_at]"
                + "order by title desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();

                Category c = getCategoryById(rs.getInt("category_id"));
                p.setCategory(c);
                p.setTitle(rs.getString("title"));
                p.setPrice(rs.getInt("price"));
                p.setThumbnail(rs.getString("thumbnail"));
                p.setDescription(rs.getString("description"));

                list.add(p);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public List<Product> searchByPriceAsc() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT [category_id]\n"
                + "      ,[title]  \n"
                + "	  ,min(price) as [price]\n"
                + "      ,[thumbnail]\n"
                + "      ,[description]\n"
                + "      ,[create_at]\n"
                + "  FROM [dbo].[Product]\n"
                + "  GROUP BY [category_id]\n"
                + "      ,[title]      \n"
                + "      ,[thumbnail]\n"
                + "      ,[description]\n"
                + "      ,[create_at]"
                + "order by price asc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();

                Category c = getCategoryById(rs.getInt("category_id"));
                p.setCategory(c);
                p.setTitle(rs.getString("title"));
                p.setPrice(rs.getInt("price"));
                p.setThumbnail(rs.getString("thumbnail"));
                p.setDescription(rs.getString("description"));

                list.add(p);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public List<Product> searchByPriceDesc() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT [category_id]\n"
                + "      ,[title]  \n"
                + "	  ,min(price) as [price]\n"
                + "      ,[thumbnail]\n"
                + "      ,[description]\n"
                + "      ,[create_at]\n"
                + "  FROM [dbo].[Product]\n"
                + "  GROUP BY [category_id]\n"
                + "      ,[title]      \n"
                + "      ,[thumbnail]\n"
                + "      ,[description]\n"
                + "      ,[create_at]"
                + "order by price desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();

                Category c = getCategoryById(rs.getInt("category_id"));
                p.setCategory(c);
                p.setTitle(rs.getString("title"));
                p.setPrice(rs.getInt("price"));
                p.setThumbnail(rs.getString("thumbnail"));
                p.setDescription(rs.getString("description"));

                list.add(p);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public List<Product> getProductByCid(int cid) {
        List<Product> list = new ArrayList<>();
        String sql = "";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                Category c = getCategoryById(rs.getInt("category_id"));
                p.setCategory(c);
                p.setTitle(rs.getString("title"));
                Color cl = getColorById(rs.getInt("color_id"));
                p.setColor(cl);
                Capacity ca = getCapacityById(rs.getInt("capacity_id"));
                p.setCapacity(ca);
                Model m = getModelById(rs.getInt("model_id"));
                p.setModel(m);
                Ram r = getRamById(rs.getInt("ram_id"));
                p.setRam(r);
                Size s = getSizeById(rs.getInt("size_id"));
                p.setSize(s);
                p.setPrice(rs.getInt("price"));

                p.setThumbnail(rs.getString("thumbnail"));
                p.setDescription(rs.getString("description"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    //check tai khoan
    public User check(String email, String password) {
        String sql = "SELECT [id]\n"
                + "      ,[fullname]\n"
                + "      ,[email]\n"
                + "      ,[phone_number]\n"
                + "      ,[address]\n"
                + "      ,[password]\n"
                + "      ,[role_id]\n"
                + "  FROM [dbo].[User]\n"
                + "  where [email]=? and [password]=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);// set gia tri cho hoi cham
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Role r = getRoleById(rs.getInt("role_id"));
                return new User(rs.getString("fullname"), email,
                        rs.getString("phone_number"), rs.getString("address"),
                        password, rs.getInt("role_id"), rs.getInt("id"), r);
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public User checkUserExist(String email) {
        String sql = "SELECT [id]\n"
                + "      ,[fullname]\n"
                + "      ,[email]\n"
                + "      ,[phone_number]\n"
                + "      ,[address]\n"
                + "      ,[password]\n"
                + "      ,[role_id]\n"
                + "  FROM [dbo].[User]\n"
                + "  where [email]=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);// set gia tri cho hoi cham

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Role r = getRoleById(rs.getInt("role_id"));
                return new User(rs.getString("fullname"), email,
                        rs.getString("phone_number"), rs.getString("address"),
                        rs.getString("password"), rs.getInt("role_id"), rs.getInt("id"), r);
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public User getUserById(int id) {
        String sql = "SELECT [id]\n"
                + "      ,[fullname]\n"
                + "      ,[email]\n"
                + "      ,[phone_number]\n"
                + "      ,[address]\n"
                + "      ,[password]\n"
                + "      ,[role_id]\n"
                + "  FROM [dbo].[User]\n"
                + "  where [id]=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);// set gia tri cho hoi cham

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Role r = getRoleById(rs.getInt("role_id"));
                return new User(rs.getString("fullname"), rs.getString("email"),
                        rs.getString("phone_number"), rs.getString("address"),
                        rs.getString("password"), rs.getInt("role_id"), rs.getInt("id"), r);
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public void register(String user, String email, String phone, String address, String pass) {
        String sql = "INSERT INTO [dbo].[User]\n"
                + "           ([fullname]\n"
                + "           ,[email]\n"
                + "           ,[phone_number]\n"
                + "           ,[address]\n"
                + "           ,[password]\n"
                + "           ,[role_id])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,1)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);// set gia tri cho hoi cham
            st.setString(2, email);
            st.setString(3, phone);
            st.setString(4, address);
            st.setString(5, pass);
            st.executeUpdate();

        } catch (SQLException e) {

        }
    }

    public void addAccount(String user, String email, String phone, String address, String pass, int id) {
        String sql = "INSERT INTO [dbo].[User]\n"
                + "           ([fullname]\n"
                + "           ,[email]\n"
                + "           ,[phone_number]\n"
                + "           ,[address]\n"
                + "           ,[password]\n"
                + "           ,[role_id])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);// set gia tri cho hoi cham
            st.setString(2, email);
            st.setString(3, phone);
            st.setString(4, address);
            st.setString(5, pass);
            st.setInt(6, id);
            st.executeUpdate();

        } catch (SQLException e) {

        }
    }

    public void update(String user, String email, String phone, String address, String pass) {
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET [fullname] = ?\n"
                + "      ,[phone_number] = ?\n"
                + "      ,[address] = ?\n"
                + "      ,[password] = ?\n"
                + " WHERE email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);// set gia tri cho hoi cham
            st.setString(2, phone);
            st.setString(3, address);
            st.setString(4, pass);
            st.setString(5, email);
            st.executeUpdate();
        } catch (SQLException e) {

        }
    }

    public void update(String user, String email, String phone, String address) {
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET [fullname] = ?\n"
                + "      ,[phone_number] = ?\n"
                + "      ,[address] = ?\n"
                + " WHERE email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);// set gia tri cho hoi cham
            st.setString(2, phone);
            st.setString(3, address);
            st.setString(4, email);
            st.executeUpdate();
        } catch (SQLException e) {

        }
    }

    public void deleteColor(int id) {
        String sql = "DELETE FROM [dbo].[Color]\n"
                + "      WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteCapacity(int id) {
        String sql = "DELETE FROM [dbo].[Capacity]\n"
                + "      WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteSize(int id) {
        String sql = "DELETE FROM [dbo].[Size]\n"
                + "      WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteProduct(int pid) {

        try {
            String sql1 = "DELETE FROM [dbo].[Galery]\n"
                    + "      WHERE product_id = ?";

            PreparedStatement st1 = connection.prepareStatement(sql1);
            st1.setInt(1, pid);
            st1.executeUpdate();

            String sql2 = "DELETE FROM [dbo].[Product]\n"
                    + "      WHERE id = ?";

            PreparedStatement st2 = connection.prepareStatement(sql2);
            st2.setInt(1, pid);
            st2.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        DAO d = new DAO();
        d.deleteProduct(159);
    }

    public void deleteAccount(int pid) {
        String sql = "DELETE FROM [dbo].[User]\n"
                + "      WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, pid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insertProduct(int category_id, String title, int color, String capacity,
            String size, int price, String thumbnail, String description, int quantity) {
        String sql = "INSERT INTO [dbo].[Product]\n"
                + "           ([category_id]\n"
                + "           ,[title]\n"
                + "           ,[color_id]\n"
                + "           ,[capacity_id]\n"
                + "           ,[size_id]\n"
                + "           ,[price]\n"
                + "           ,[thumbnail]\n"
                + "           ,[description]\n"
                + "           ,[quantity]\n"
                + "           ,[create_at])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,getdate())";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, category_id);
            st.setString(2, title);
            st.setInt(3, color);
            st.setString(4, capacity);
            st.setString(5, size);
            st.setInt(6, price);
            st.setString(7, thumbnail);
            st.setString(8, description);
            st.setInt(9, quantity);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void editProduct(int category_id, String title, String color, String capacity,
            String model, String ram, String size, int price, String thumbnail, String galery, int quantity, String description, int pid) {
        String sql = "UPDATE [dbo].[Product]\n"
                + "   SET [category_id] = ?\n"
                + "      ,[title] = ?\n"
                + "      ,[color] = ?\n"
                + "      ,[capacity] = ?\n"
                + "      ,[model] = ?\n"
                + "      ,[ram] = ?\n"
                + "      ,[size] = ?\n"
                + "      ,[price] = ?\n"
                + "      ,[thumbnail] = ?\n"
                + "      ,[description] = ?\n"
                + "      ,[quantity] = ?"
                + " WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, category_id);
            st.setString(2, title);
            st.setString(3, color);
            st.setString(4, capacity);
            st.setString(5, model);
            st.setString(6, ram);
            st.setString(7, size);
            st.setInt(8, price);

            st.setString(9, thumbnail);
            st.setString(10, description);
            st.setInt(11, quantity);
            st.setInt(12, pid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }

        String sql1 = "UPDATE [dbo].[Galery]\n"
                + "   SET \n"
                + "      [thumbnail] = ?\n"
                + " WHERE product_id = ?";
        try {
            PreparedStatement st1 = connection.prepareStatement(sql1);
            st1.setString(1, galery);
            st1.setInt(2, pid);
            st1.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    public List<Product> getTitleProducts() {
        List<Product> list = new ArrayList<>();

        String sql = "SELECT [category_id]\n"
                + "      ,[title]  \n"
                + "	  ,min(price) as [price]\n"
                + "      ,[thumbnail]\n"
                + "      ,[description]\n"
                + "      ,[create_at]\n"
                + "  FROM [dbo].[Product]\n"
                + "  GROUP BY [category_id]\n"
                + "      ,[title]      \n"
                + "      ,[thumbnail]\n"
                + "      ,[description]\n"
                + "      ,[create_at]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();

                Category c = getCategoryById(rs.getInt("category_id"));
                p.setCategory(c);
                p.setTitle(rs.getString("title"));
                p.setPrice(rs.getInt("price"));
                p.setThumbnail(rs.getString("thumbnail"));
                p.setDescription(rs.getString("description"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Product getProductsByTitle(String title) {
        String sql = "SELECT top 1 [id]\n"
                + "      ,[category_id]\n"
                + "      ,[title]\n"
                + "      ,[color_id]\n"
                + "      ,[capacity_id]\n"
                + "      ,[model_id]\n"
                + "      ,[ram_id]\n"
                + "      ,[size_id]\n"
                + "      ,[price]\n"
                + "      ,[thumbnail]\n"
                + "      ,[description]\n"
                + "      ,[create_at]\n"
                + "      ,[quantity]\n"
                + "  FROM [La_Mela].[dbo].[Product] where title = ?\n"
                + "  order by price asc";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, title);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                Category c = getCategoryById(rs.getInt("category_id"));
                p.setCategory(c);
                p.setTitle(rs.getString("title"));
                Color cl = getColorById(rs.getInt("color_id"));
                p.setColor(cl);
                Capacity ca = getCapacityById(rs.getInt("capacity_id"));
                p.setCapacity(ca);
                Model m = getModelById(rs.getInt("model_id"));
                p.setModel(m);
                Ram r = getRamById(rs.getInt("ram_id"));
                p.setRam(r);
                Size s = getSizeById(rs.getInt("size_id"));
                p.setSize(s);
                p.setPrice(rs.getInt("price"));

                p.setThumbnail(rs.getString("thumbnail"));
                p.setDescription(rs.getString("description"));
                p.setQuantity(rs.getInt("quantity"));
                Galery g = getThumbnailByPid(rs.getInt("id"));
                p.setGalery(g);
                return p;
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public List<Product> getBestSellerByCategory(int cid, int year) {
        List<Product> list = new ArrayList<>();
        String sql1 = "SELECT top (5)   \n"
                + "                   	  sum(od.quantity) as quantity  \n"
                + "                   	  ,title  \n"
                + "                   	  ,p.category_id  \n"
                + "                   	  ,p.thumbnail  \n"
                + "                   	  ,p.price  \n"
                + "			  ,year(o.order_date) as year\n"
                + "                     FROM [Order_Details] od join  \n"
                + "                   Product p on p.id = od.product_id  \n"
                + "				   join Orders o on o.id = od.order_id\n"
                + "                   where year(o.order_date) = ? \n";

        String sql2 = "group by   \n"
                + "                   	  title  \n"
                + "                   	  ,p.category_id  \n"
                + "                   	  ,p.thumbnail  \n"
                + "                   	  ,p.price  \n"
                + "			  ,year(o.order_date)\n"
                + "                   	  order by quantity desc";

        String sql;

        if (cid != 0) {
            sql = sql1 + " and category_id = ? \n" + sql2;
        } else {
            sql = sql1 + " " + sql2;
        }

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            if (cid != 0) {
                st.setInt(1, year);
                st.setInt(2, cid);
            }else{
                st.setInt(1, year);
            }
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();

                Category c = getCategoryById(rs.getInt("category_id"));
                p.setCategory(c);
                p.setQuantity(rs.getInt("quantity"));
                p.setTitle(rs.getString("title"));
                p.setPrice(rs.getInt("price"));
                p.setThumbnail(rs.getString("thumbnail"));

                list.add(p);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public int sumOrder() {
        String sql = "SELECT count([order_date]) as sumorder\n"
                + "      \n"
                + "  FROM [La_Mela].[dbo].[Orders]";
        int sum;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                sum = rs.getInt("sumorder");
                return sum;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public int sumPrice() {
        String sql = "SELECT \n"
                + "      sum([total_money]) as sumprice\n"
                + "  FROM [La_Mela].[dbo].[Orders]";
        int sum;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                sum = rs.getInt("sumprice");
                return sum;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public List<Product> getProductsByCategory(int cid) {
        List<Product> list = new ArrayList<>();
        String sql1 = "SELECT [category_id]  \n"
                + ",[title]    \n"
                + ",min(price) as [price]  \n"
                + ",[thumbnail]  \n"
                + "FROM [dbo].[Product] \n";

        String sql2 = " GROUP BY [category_id]  \n"
                + ",[title]        \n"
                + ",[thumbnail]  \n";

        String sql;
        if (cid != 0) {
            sql = sql1 + "where category_id = ? " + sql2;
        } else {
            sql = sql1 + " " + sql2;
        }

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            if (cid != 0) {
                st.setInt(1, cid);
            }
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();

                Category c = getCategoryById(rs.getInt("category_id"));
                p.setCategory(c);
                p.setTitle(rs.getString("title"));
                p.setPrice(rs.getInt("price"));
                p.setThumbnail(rs.getString("thumbnail"));

                list.add(p);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public List<Product> getListByPage(List<Product> list, int start, int end) {
        List<Product> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public List<User> getListUserByPage(List<User> list, int start, int end) {
        List<User> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public List<Product> getColor(String title) {
        List<Product> list = new ArrayList<>();

        String sql = "SELECT \n"
                + "      [title]\n"
                + "      ,[color_id]\n"
                + "     \n"
                + "  FROM [La_Mela].[dbo].[Product] where title = ?\n"
                + "  group by \n"
                + "      [title]\n"
                + "      ,[color_id]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, title);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setTitle(rs.getString("title"));
                Color cl = getColorById(rs.getInt("color_id"));
                p.setColor(cl);
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getCapacity(String title) {
        List<Product> list = new ArrayList<>();

        String sql = "SELECT \n"
                + "      [title]\n"
                + "      ,[capacity_id]\n"
                + "     \n"
                + "  FROM [La_Mela].[dbo].[Product] where title = ?\n"
                + "  group by \n"
                + "      [title]\n"
                + "      ,[capacity_id]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, title);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setTitle(rs.getString("title"));
                Capacity cl = getCapacityById(rs.getInt("capacity_id"));
                p.setCapacity(cl);
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getRam(String title) {
        List<Product> list = new ArrayList<>();

        String sql = "SELECT \n"
                + "      [title]\n"
                + "      ,[ram_id]\n"
                + "     \n"
                + "  FROM [La_Mela].[dbo].[Product] where title = ?\n"
                + "  group by \n"
                + "      [title]\n"
                + "      ,[ram_id]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, title);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setTitle(rs.getString("title"));
                Ram cl = getRamById(rs.getInt("ram_id"));
                p.setRam(cl);
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getSize(String title) {
        List<Product> list = new ArrayList<>();

        String sql = "SELECT \n"
                + "      [title]\n"
                + "      ,[size_id]\n"
                + "     \n"
                + "  FROM [La_Mela].[dbo].[Product] where title = ?\n"
                + "  group by \n"
                + "      [title]\n"
                + "      ,[size_id]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, title);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setTitle(rs.getString("title"));
                Size cl = getSizeById(rs.getInt("size_id"));
                p.setSize(cl);
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getModel(String title) {
        List<Product> list = new ArrayList<>();

        String sql = "SELECT \n"
                + "      [title]\n"
                + "      ,[model_id]\n"
                + "     \n"
                + "  FROM [La_Mela].[dbo].[Product] where title = ?\n"
                + "  group by \n"
                + "      [title]\n"
                + "      ,[model_id]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, title);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setTitle(rs.getString("title"));
                Model cl = getModelById(rs.getInt("model_id"));
                p.setModel(cl);
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Product getProductId(String title, int color) {

        String sql = "SELECT top (1) [id]\n"
                + "      ,[category_id]\n"
                + "      ,[title]\n"
                + "      ,[color_id]\n"
                + "      ,[capacity_id]\n"
                + "      ,[model_id]\n"
                + "      ,[ram_id]\n"
                + "      ,[size_id]\n"
                + "      ,[price]\n"
                + "      ,[thumbnail]\n"
                + "      ,[description]\n"
                + "      ,[quantity]\n"
                + "  FROM [La_Mela].[dbo].[Product]\n"
                + "  where title = ? and color_id = ?\n"
                + "order by price asc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, title);
            st.setInt(2, color);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                Category c = getCategoryById(rs.getInt("category_id"));
                p.setCategory(c);
                p.setTitle(rs.getString("title"));
                Color cl = getColorById(rs.getInt("color_id"));
                p.setColor(cl);
                Capacity ca = getCapacityById(rs.getInt("capacity_id"));
                p.setCapacity(ca);
                Model m = getModelById(rs.getInt("model_id"));
                p.setModel(m);
                Ram r = getRamById(rs.getInt("ram_id"));
                p.setRam(r);
                Size s = getSizeById(rs.getInt("size_id"));
                p.setSize(s);
                p.setPrice(rs.getInt("price"));

                p.setThumbnail(rs.getString("thumbnail"));
                p.setDescription(rs.getString("description"));
                p.setQuantity(rs.getInt("quantity"));
                return p;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Product getProductId(String title, int color, int capacity_id) {

        String sql = "SELECT top (1) [id]\n"
                + "      ,[category_id]\n"
                + "      ,[title]\n"
                + "      ,[color_id]\n"
                + "      ,[capacity_id]\n"
                + "      ,[model_id]\n"
                + "      ,[ram_id]\n"
                + "      ,[size_id]\n"
                + "      ,[price]\n"
                + "      ,[thumbnail]\n"
                + "      ,[description]\n"
                + "      ,[quantity]\n"
                + "  FROM [La_Mela].[dbo].[Product]\n"
                + "  where title = ? and color_id = ? and capacity_id = ?\n"
                + "order by price asc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, title);
            st.setInt(2, color);
            st.setInt(3, capacity_id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                Category c = getCategoryById(rs.getInt("category_id"));
                p.setCategory(c);
                p.setTitle(rs.getString("title"));
                Color cl = getColorById(rs.getInt("color_id"));
                p.setColor(cl);
                Capacity ca = getCapacityById(rs.getInt("capacity_id"));
                p.setCapacity(ca);
                Model m = getModelById(rs.getInt("model_id"));
                p.setModel(m);
                Ram r = getRamById(rs.getInt("ram_id"));
                p.setRam(r);
                Size s = getSizeById(rs.getInt("size_id"));
                p.setSize(s);
                p.setPrice(rs.getInt("price"));

                p.setThumbnail(rs.getString("thumbnail"));
                p.setDescription(rs.getString("description"));
                p.setQuantity(rs.getInt("quantity"));
                return p;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Product getProductIdBySize(String title, int color, int size_id) {

        String sql = "SELECT top (1) [id]\n"
                + "      ,[category_id]\n"
                + "      ,[title]\n"
                + "      ,[color_id]\n"
                + "      ,[capacity_id]\n"
                + "      ,[model_id]\n"
                + "      ,[ram_id]\n"
                + "      ,[size_id]\n"
                + "      ,[price]\n"
                + "      ,[thumbnail]\n"
                + "      ,[description]\n"
                + "      ,[quantity]\n"
                + "  FROM [La_Mela].[dbo].[Product]\n"
                + "  where title = ? and color_id = ? and size_id = ?\n"
                + "order by price asc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, title);
            st.setInt(2, color);
            st.setInt(3, size_id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                Category c = getCategoryById(rs.getInt("category_id"));
                p.setCategory(c);
                p.setTitle(rs.getString("title"));
                Color cl = getColorById(rs.getInt("color_id"));
                p.setColor(cl);
                Capacity ca = getCapacityById(rs.getInt("capacity_id"));
                p.setCapacity(ca);
                Model m = getModelById(rs.getInt("model_id"));
                p.setModel(m);
                Ram r = getRamById(rs.getInt("ram_id"));
                p.setRam(r);
                Size s = getSizeById(rs.getInt("size_id"));
                p.setSize(s);
                p.setPrice(rs.getInt("price"));

                p.setThumbnail(rs.getString("thumbnail"));
                p.setDescription(rs.getString("description"));
                p.setQuantity(rs.getInt("quantity"));
                return p;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Product getPrice(String title, int color) {

        String sql = "SELECT \n"
                + "      [category_id]\n"
                + "      ,[title]\n"
                + "      ,[price]\n"
                + "     \n"
                + "  FROM [La_Mela].[dbo].[Product] where title = ? and color_id = ?\n"
                + "  group by \n"
                + "      [category_id]\n"
                + "      ,[title]\n"
                + "      ,[price]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, title);
            st.setInt(2, color);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Product p = new Product();

                Category c = getCategoryById(rs.getInt("category_id"));
                p.setCategory(c);
                p.setTitle(rs.getString("title"));
                p.setPrice(rs.getInt("price"));
                return p;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Product> getThumbnail(String title) {
        List<Product> list = new ArrayList<>();

        String sql = "  SELECT p.title, g.thumbnail from \n"
                + "   product p join \n"
                + "  galery g on\n"
                + "  p.id = g.product_id\n"
                + "  where title = ?\n"
                + "group by p.title,g.thumbnail";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, title);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setTitle(rs.getString("title"));
                p.setThumbnail(rs.getString("thumbnail"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Product getThumbnail1(String title, int color) {
        String sql = "SELECT p.title, g.thumbnail from   \n"
                + "                      product p join   \n"
                + "                     galery g on  \n"
                + "                     p.id = g.product_id  \n"
                + "                     where title = ? and color_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, title);
            st.setInt(2, color);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setTitle(rs.getString("title"));
                p.setThumbnail(rs.getString("thumbnail"));
                return p;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Galery getThumbnailByPid(int pid) {
        String sql = "SELECT [id]\n"
                + "      ,[product_id]\n"
                + "      ,[thumbnail]\n"
                + "  FROM [dbo].[Galery]\n"
                + "  where product_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, pid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Galery g = new Galery();
                g.setId(rs.getInt("id"));
                g.setProduct_id(rs.getInt("product_id"));
                g.setThumbnail(rs.getString("thumbnail"));
                return g;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void insertGalery(String thumbnail, int pid) {
        String sql = "INSERT INTO [dbo].[Galery]\n"
                + "           ([product_id]\n"
                + "           ,[thumbnail])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, pid);
            st.setString(2, thumbnail);
            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    public void insertColor(String color) {
        String sql = "INSERT INTO [dbo].[Color]\n"
                + "           ([name])\n"
                + "     VALUES\n"
                + "           (?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, color);
            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    public void insertCapacity(String capacity) {
        String sql = "INSERT INTO [dbo].[Capacity]\n"
                + "           ([name])\n"
                + "     VALUES\n"
                + "           (?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, capacity);
            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    public void insertSize(String size) {
        String sql = "INSERT INTO [dbo].[Size]\n"
                + "           ([name])\n"
                + "     VALUES\n"
                + "           (?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, size);
            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    public Color getColorById(int id) {
        String sql = "SELECT [ID]\n"
                + "      ,[name]\n"
                + "  FROM [dbo].[Color]\n"
                + "  where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Color c = new Color(rs.getInt("id"), rs.getString("name"));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Size getSizeById(int id) {
        String sql = "SELECT [ID]\n"
                + "      ,[name]\n"
                + "  FROM [dbo].[Size]\n"
                + "  where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Size c = new Size(rs.getInt("id"), rs.getString("name"));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Model getModelById(int id) {
        String sql = "SELECT [ID]\n"
                + "      ,[name]\n"
                + "  FROM [dbo].[Model]\n"
                + "  where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Model c = new Model(rs.getInt("id"), rs.getString("name"));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Ram getRamById(int id) {
        String sql = "SELECT [ID]\n"
                + "      ,[name]\n"
                + "  FROM [dbo].[Ram]\n"
                + "  where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Ram c = new Ram(rs.getInt("id"), rs.getString("name"));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Capacity getCapacityById(int id) {
        String sql = "SELECT [ID]\n"
                + "      ,[name]\n"
                + "  FROM [dbo].[Capacity]\n"
                + "  where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Capacity c = new Capacity(rs.getInt("id"), rs.getString("name"));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    //------------------------------CartDAO-------------------------------------
    public User getAccount(String email, String pass) {
        String sql = "SELECT [id]\n"
                + "      ,[fullname]\n"
                + "      ,[email]\n"
                + "      ,[phone_number]\n"
                + "      ,[address]\n"
                + "      ,[password]\n"
                + "      ,[role_id]\n"
                + "  FROM [dbo].[User]"
                + "  where username=? and password=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Role r = getRoleById(rs.getInt("role_id"));
                return new User(rs.getString("fullname"), email,
                        rs.getString("phone_number"), rs.getString("address"),
                        pass, rs.getInt("role_id"), rs.getInt("id"), r);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Product getProductById(int id) {

        String sql = "SELECT [id]\n"
                + "      ,[category_id]\n"
                + "      ,[title]\n"
                + "      ,[color_id]\n"
                + "      ,[capacity_id]\n"
                + "      ,[model_id]\n"
                + "      ,[ram_id]\n"
                + "      ,[size_id]\n"
                + "      ,[price]\n"
                + "      ,[thumbnail]\n"
                + "      ,[description]\n"
                + "      ,[create_at]\n"
                + "      ,[quantity]\n"
                + "  FROM [dbo].[Product] where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                Category c = getCategoryById(rs.getInt("category_id"));
                p.setCategory(c);
                p.setTitle(rs.getString("title"));
                Color cl = getColorById(rs.getInt("color_id"));
                p.setColor(cl);
                Capacity ca = getCapacityById(rs.getInt("capacity_id"));
                p.setCapacity(ca);
                Model m = getModelById(rs.getInt("model_id"));
                p.setModel(m);
                Ram r = getRamById(rs.getInt("ram_id"));
                p.setRam(r);
                Size s = getSizeById(rs.getInt("size_id"));
                p.setSize(s);
                p.setPrice(rs.getInt("price"));

                p.setThumbnail(rs.getString("thumbnail"));
                p.setDescription(rs.getString("description"));
                p.setQuantity(rs.getInt("quantity"));
                return p;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void addOrder(User c, Cart cart) {
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        try {
            //add order
            String sql = "insert into [orders] values(?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, c.getId());
            st.setString(2, date);
            st.setDouble(3, cart.getTotalMoney());
            st.executeUpdate();
            //lay id cua order cua add
            String sql1 = "select top 1 id from [orders] order by id desc";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();
            //add bang orderdetail
            if (rs.next()) {
                int oid = rs.getInt("id");
                for (Item i : cart.getItems()) {
                    String sql2 = "insert into [order_details] values(?,?,?,?)";
                    PreparedStatement st2 = connection.prepareStatement(sql2);
                    st2.setInt(1, oid);
                    st2.setInt(2, i.getProduct().getId());
                    st2.setDouble(3, i.getPrice());
                    st2.setInt(4, i.getQuantity());
                    st2.executeUpdate();
                }
            }
            //cap nhat lai so luong san pham 
            String sql3 = "update product set quantity=quantity-? where id=?";
            PreparedStatement st3 = connection.prepareStatement(sql3);
            for (Item i : cart.getItems()) {
                st3.setInt(1, i.getQuantity());
                st3.setInt(2, i.getProduct().getId());
                st3.executeUpdate();
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
//---------------------------userDAO-------------------------------------------

    public User getIdUser(String email) {

        String sql = "SELECT [id]\n"
                + "      ,[fullname]\n"
                + "      ,[email]\n"
                + "      ,[phone_number]\n"
                + "      ,[address]\n"
                + "      ,[password]\n"
                + "      ,[role_id]\n"
                + "  FROM [dbo].[User]\n"
                + "  where email = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setFullname(rs.getString("fullname"));
                u.setEmail(rs.getString("email"));
                u.setPhone_number(rs.getString("phone_number"));
                u.setAddress(rs.getString("address"));
                u.setPassword(rs.getString("password"));
                u.setRole_id(rs.getInt("role_id"));
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

}
