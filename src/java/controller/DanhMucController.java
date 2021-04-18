/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.DanhMuc;
import entity.SanPham;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import org.hibernate.HibernateException;
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
public class DanhMucController {
    @Autowired
    SessionFactory factory;
    
    @RequestMapping("danhmuc")
    public String danhmuc(ModelMap model, HttpSession sessionHttp, HttpServletRequest request){
        Session session = factory.getCurrentSession();
        String hql_dm = "FROM DanhMuc"; // lấy hết các tài khoản ra
            
            Query query_dm = session.createQuery(hql_dm);
            List<DanhMuc> listDM = query_dm.list();
            model.addAttribute("listDM", listDM);
        return "admin/danhmuc";
    }
    
    @RequestMapping(value = "insertDM", method = RequestMethod.POST)
    public String insertDM(ModelMap model, HttpSession sessionHttp, HttpServletRequest request,
            @RequestParam("tendm_insert") String tenDM){
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            DanhMuc dm = new DanhMuc();
            dm.setTenDM(tenDM);
            session.save(dm);
            t.commit();
        } catch (Exception e) {
            t.rollback();
        } finally {
            
         session.close();
        }
        
        return "redirect:danhmuc.html";
        
        
    }
    
    
    @RequestMapping(value = "updateDM", method = RequestMethod.POST)
    public String updateDM(ModelMap model, HttpSession sessionHttp, HttpServletRequest request,
            @RequestParam("madm_form") int maDM,
            @RequestParam("tendm_form") String tenDM){
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            DanhMuc dm = new DanhMuc(maDM, tenDM);
            session.update(dm);
            t.commit();
        } catch (Exception e) {
            t.rollback();
        }
        return "redirect:danhmuc.html";
    }
    
    @RequestMapping(value = "deleteDM", method = RequestMethod.GET)
    public String deleteDM(ModelMap model, HttpSession sessionHttp, HttpServletRequest request, 
            @RequestParam("maDM") int maDM){
        Session session = factory.getCurrentSession();
        try {
            DanhMuc sp = (DanhMuc) session.get(DanhMuc.class, maDM);
        session.delete(sp); 
        } catch (HibernateException e) {
            return "redirect:danhmuc.html";
        }
      
        return "redirect:danhmuc.html";
        
    }
    
    @RequestMapping(value = "api/getInfoDM")
    @ResponseBody
    public ResponseEntity<String> getInfoDM(HttpSession sessionHttp, @RequestParam("maDM") int maDM) {
        Session session = factory.getCurrentSession();
        DanhMuc dm = (DanhMuc) session.get(DanhMuc.class, maDM);
        return new ResponseEntity<>("{\"status\" : \"true\",\"maDM\" : \"" + dm.getMaDM()+ "\", \"tenDM\" : \"" + dm.getTenDM()+ "\"}", HttpStatus.OK);

    }
    
}
