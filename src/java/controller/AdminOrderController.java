/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.ChiTietDonHang;
import entity.DonHang;
import entity.Item;
import entity.SanPham;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
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
public class AdminOrderController {
    @Autowired
    SessionFactory factory;
    
    @RequestMapping("donhang")
    public String donhang(ModelMap model, HttpSession sessionHttp, HttpServletRequest request){
           List<ChiTietDonHang> ctdh = getList();
            
            
            sessionHttp.setAttribute("adminOrder", ctdh);
        return "admin/donhang";
    }
    
    
      @RequestMapping(value = "updateOrder", method = RequestMethod.POST)
    public String updateOrder(ModelMap model, HttpSession sessionHttp, HttpServletRequest request,
            @RequestParam("stt_form") int stt,
            @RequestParam("madh_form") int maDH,
            @RequestParam("masp_form") int maSP,
            @RequestParam("dongia_form") int donGia,
            @RequestParam("soluong_form") int soLuong,
            @RequestParam("trangthai_form") int trangthai,
            @RequestParam("ngaydat_form") String ngayDatHang,
            @RequestParam("nguoidat_form") String username,
            @RequestParam("diachi_form") String address,
            @RequestParam(value = "Action1", required = false, defaultValue = "null") String type,
            @RequestParam(value = "Action2", required = false, defaultValue = "null") String type2) {
        
         Session session = factory.openSession();
        Transaction t = session.beginTransaction();
          try {
              if(!type.equals("null")){
               ChiTietDonHang ctdhUpdate = new ChiTietDonHang(stt, maDH, maSP, donGia, soLuong, trangthai, ngayDatHang, username, address);
              session.update(ctdhUpdate);
                t.commit();   
              }else if(!type2.equals("null")){
                  System.out.println("Thực hiện");
                  String hql = "UPDATE ChiTietDonHang set trangthai = :trangthai, address = :address "  + 
                "WHERE maDH = :maDH";
                Query query = session.createQuery(hql);
                query.setParameter("trangthai", trangthai);
                query.setParameter("address", address);
                query.setParameter("maDH", maDH);
                int result = query.executeUpdate();
                  System.out.println(result);
                  t.commit();
              }
              
          } catch (Exception e) {
              e.printStackTrace();
              t.rollback();
          }finally{
              session.close();
          }
          
          return "redirect:donhang.html";
    }
    
    @RequestMapping(value = "deleteDH", method = RequestMethod.GET)
    public String deleteDH(ModelMap model, HttpSession sessionHttp, HttpServletRequest request, 
            @RequestParam("stt") int stt,
            @RequestParam("maDH") int maDH,
            @RequestParam("maSP") int maSP){
        Session session = factory.getCurrentSession();
        ChiTietDonHang sp = (ChiTietDonHang) session.get(ChiTietDonHang.class, stt);
        session.delete(sp);       
        return "redirect:donhang.html";
        
    }
    
    public List<ChiTietDonHang> getList(){
        Session session = factory.openSession();

           // String hql = "SELECT E.maDH, E.maSP, E.donGia, E.soLuong, E.trangthai, E.NgayDatHang, E.username, E.address FROM ChiTietDonHang E";
            String hql = "FROM ChiTietDonHang";
            Query query = session.createQuery(hql);
            List<ChiTietDonHang> ctdh = query.list();
            System.out.println(ctdh);
            //ChiTietDonHang a = (ChiTietDonHang) session.get(ChiTietDonHang.class, ctdh.get(2).getMaDH());
            //System.out.println(a.getMaDH()+"_"+a.getAddress()+"___");
            session.close();
            
            return ctdh;
    }
    @RequestMapping(value = "api/getInfoOrder")
    @ResponseBody
    public ResponseEntity<String> getInfoOrder(HttpSession sessionHttp, @RequestParam("maDH") int maDH,
            @RequestParam(value = "maSP", defaultValue = "0") String maSP) {
        List<ChiTietDonHang> ctdh = getList();
        List<ChiTietDonHang> readDH = new ArrayList<>();
        for(ChiTietDonHang x : ctdh){
            if(x.getMaDH() == maDH){
                readDH.add(x);
            }
        }
        String msg = "";
        for(ChiTietDonHang x : readDH){
            if(maSP.equals(0)){
             msg += "{\"stt\" : \""+x.getStt()+"\",\"maDH\" : \""+x.getMaDH()+"\",\"maSP\" : \""+x.getMaSP()+"\",\"donGia\" : \""+x.getDonGia()+"\",\"soLuong\" : \""+x.getSoLuong()+"\",\"trangthai\" : \""+x.getTrangthai()+"\",\"ngayDatHang\" : \""+x.getNgayDatHang()+"\",\"username\" : \""+x.getUsername()+"\",\"address\" : \""+encode(x.getAddress())+"\",},";

            }else{
                if(x.getMaSP() == Integer.parseInt(maSP)){
                 msg += "{\"stt\" : \""+x.getStt()+"\",\"maDH\" : \""+x.getMaDH()+"\",\"maSP\" : \""+x.getMaSP()+"\",\"donGia\" : \""+x.getDonGia()+"\",\"soLuong\" : \""+x.getSoLuong()+"\",\"trangthai\" : \""+x.getTrangthai()+"\",\"ngayDatHang\" : \""+x.getNgayDatHang()+"\",\"username\" : \""+x.getUsername()+"\",\"address\" : \""+encode(x.getAddress())+"\",},";

                }
            }
        }
        String data = "\"data\" : ["+msg+"]";
        
        System.out.println(data);
        
        return new ResponseEntity<>("{\"status\" : \"true\", "+data+"}", HttpStatus.OK);

    }
    
    public static String encode(String url)
	{
			try {
				String encodeURL=URLEncoder.encode( url, "UTF-8" );
				return encodeURL;
			} catch (UnsupportedEncodingException e) {
				return "Issue while encoding" +e.getMessage();
			}
	}
}
