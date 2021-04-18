/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.ChiTietDonHang;
import entity.DonHang;
import entity.SanPham;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Transactional
@Controller
public class CheckOutController {
    @Autowired
    SessionFactory factory;
    
    
    @RequestMapping("admin/verifyAddress")
    public String verifyAddress(ModelMap model, HttpSession sessionHttp, HttpServletRequest request,
            @RequestParam("maDH") int maDH,
            @RequestParam(value = "address", defaultValue = "Updating...") String address){
            Session session = factory.openSession();
            Transaction ts = session.beginTransaction();
            DonHang dh = (DonHang) session.get(DonHang.class, maDH);
            String hql = "FROM ChiTietDonHang where MaDH = ?";
            Query query = session.createQuery(hql).setParameter(0, maDH);
            List<ChiTietDonHang> list = query.list();
            for(ChiTietDonHang ctdh : list){
                ctdh.setAddress(address);
                Session sessionCTDH = factory.openSession();
                Transaction t = sessionCTDH.beginTransaction();
                sessionCTDH.update(ctdh);
                t.commit();
            }
            
            dh.setAddress(address);
            session.update(dh);
            ts.commit();
        return "redirect:/index.html";
    }
    
    @RequestMapping("getAllOrder")
    public String getAllOrder(ModelMap model, HttpSession sessionHttp, HttpServletRequest request){
        
        Session session = factory.getCurrentSession();

            String hql = "FROM DonHang WHERE username = ?";
            Query query = session.createQuery(hql).setParameter(0, (String) sessionHttp.getAttribute("username"));
            List<DonHang> list = query.list();
            for(DonHang x : list){
                session = factory.openSession();
                String hql2 = "FROM ChiTietDonHang WHERE MaDH = ?";
            Query query2 = session.createQuery(hql2).setParameter(0, x.getMaDH());
            //Query query2 = session.createQuery(hql2);
            List<ChiTietDonHang> list2 = query2.list();
                for(ChiTietDonHang ctdh : list2){
                    System.out.println(ctdh.getMaDH()+"_"+ctdh.getMaSP()+"_"+ctdh.getSoLuong());
                    
                }
            }
            return "checkout";
    }
}
