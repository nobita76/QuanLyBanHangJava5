/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Users;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Transactional
@Controller
@RequestMapping("/admin/")
public class AdminController {

    @Autowired
    SessionFactory factory;

    @RequestMapping(value = "index", method = RequestMethod.GET)

    public String index(ModelMap model, HttpSession sessionHttp, HttpServletRequest request) {
        if (checkAdmin(sessionHttp)) {
            Session session = factory.getCurrentSession();
            
            String hql = "FROM Users"; // lấy hết các tài khoản ra
            Query query = session.createQuery(hql);
            List<Users> list = query.list();
            model.addAttribute("list", list); // lấy danh sách tài khoản list đưa vào thuộc tính users

            return "admin/index";
        }

        return "redirect:/index.html";
    }
    
    
    @RequestMapping(value = "insert", method = RequestMethod.POST)
    public String insertUser(ModelMap model, HttpSession sessionHttp, HttpServletRequest request, 
            @RequestParam("username_insert") String username,
            @RequestParam("password_insert") String password,
            @RequestParam("vaitro_insert") String vaitro){
            Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            Users user = new Users(username, password, Integer.parseInt(vaitro));
            
            session.save(user); 
        t.commit(); 
            
        } catch (Exception e) {
            t.rollback();
            
        }finally{
            session.close();
        }
        return "redirect:index.html";
    }
    
    @RequestMapping(value = "update", method = RequestMethod.POST)
    public String updateUser(ModelMap model, HttpSession sessionHttp, HttpServletRequest request, 
            @RequestParam("username_form") String username,
            @RequestParam("password_form") String password,
            @RequestParam("vaitro_form") String vaitro){
            Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            Users user = new Users(username, password, Integer.parseInt(vaitro));
            
            session.update(user);
            t.commit();
            
        } catch (Exception e) {
            t.rollback();
            
        }finally{
            session.close();
        }
        return "redirect:index.html";
    }
    
    
    @RequestMapping(value = "delete", method = RequestMethod.GET)
    public String deleteUser(ModelMap model, HttpSession sessionHttp, HttpServletRequest request, 
            @RequestParam("username") String username){
        Session session = factory.getCurrentSession();
        Users user = (Users) session.get(Users.class, username);
        session.delete(user);       
        return "redirect:index.html";
        
    }
    
    
    @RequestMapping(value = "api/count")
    @ResponseBody
    public ResponseEntity<String> count(HttpSession sessionHttp) {
        Session session = factory.getCurrentSession();
        String hql_sum = "Select count(username) FROM Users";
        Query query_sum = session.createQuery(hql_sum);
        long tong = (long) query_sum.uniqueResult();
        String hql_sum_admin = "Select count(username) FROM Users WHERE vaitro = 1";
        Query query_sum_admin = session.createQuery(hql_sum_admin);
        long tong_admin = (long) query_sum_admin.uniqueResult();
        String hql_sum_sanpham = "Select count(maSP) FROM SanPham";
        Query query_sum_sanpham = session.createQuery(hql_sum_sanpham);
        long tong_sanpham = (long) query_sum_sanpham.uniqueResult();
        String hql_sum_danhmuc = "Select count(maDM) FROM DanhMuc";
        Query query_sum_danhmuc = session.createQuery(hql_sum_danhmuc);
        long tong_danhmuc = (long) query_sum_danhmuc.uniqueResult();
        
        String hql_sum_donhang = "Select count(maDH) FROM DonHang";
        Query query_sum_donhang = session.createQuery(hql_sum_donhang);
        long tong_donhang = (long) query_sum_donhang.uniqueResult();
        return new ResponseEntity<>("{\"status\" : \"true\",\"countUsers\" : \""+tong+"\", \"countAdmins\" : \""+tong_admin+"\", \"countSP\":\""+tong_sanpham+"\", \"countDM\":\""+tong_danhmuc+"\", \"countDH\":\""+tong_donhang+"\"}", HttpStatus.OK);
    }
    
    @RequestMapping(value = "api/getInfo")
    @ResponseBody
        public ResponseEntity<String> getInfo(HttpSession sessionHttp, @RequestParam("username") String username) {
             Session session = factory.getCurrentSession();
        Users user = (Users) session.get(Users.class, username);
        return new ResponseEntity<>("{\"status\" : \"true\",\"username\" : \""+user.getUsername()+"\", \"password\" : \""+user.getPassword()+"\", \"vaitro\" : \""+user.getVaitro()+"\"}", HttpStatus.OK);
        
        }
        
    
    public boolean checkAdmin(HttpSession session) {
        return session.getAttribute("vaitro").equals(1);
    }
}
