/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.ChiTietDonHang;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Transactional
@Controller
public class ViewOrderController {
    @Autowired
    SessionFactory factory;
    
    @RequestMapping("viewOrder")
    public String viewOrder(ModelMap model, HttpSession sessionHttp, HttpServletRequest request){
        Session session = factory.getCurrentSession();
        String hql = "FROM ChiTietDonHang  where username = ?";
            Query query = session.createQuery(hql).setParameter(0, (String) sessionHttp.getAttribute("username"));
            List<ChiTietDonHang> list = query.list();
            
            sessionHttp.setAttribute("listViewOrder", list);
        return "viewOrder";
    }
}
