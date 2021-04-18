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
import entity.Users;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
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
public class CartController {
    @Autowired
    SessionFactory factory;
    HashMap<Integer, Item> cart;
    
    @RequestMapping(value = "cart", method = RequestMethod.GET)
    public String cart(ModelMap model, HttpSession sessionHttp, HttpServletRequest request){
        sessionHttp.setAttribute("listCartOrder", getListItems());
        sessionHttp.setAttribute("tongtienCart", getTongTien());
        return "cart";
    }
    
    
    @RequestMapping(value = "addToCart", method = RequestMethod.GET)
    public String addToCart(ModelMap model, HttpSession sessionHttp, HttpServletRequest request,
            @RequestParam("maSP") int maSP){
            Session session = factory.getCurrentSession();
            SanPham spBuy = (SanPham) session.get(SanPham.class, maSP);
            cart = (HashMap<Integer, Item>) sessionHttp.getAttribute("gioHang");
            if(spBuy.getSoLuong() >= 1){
                
            if(checkContains(maSP)){
                //Đã có SP trong giỏ
                Item item = cart.get(maSP);
                int count = item.getSoluong();
                if(item.getSanpham().getSoLuong() > count){
                   count = count + 1;
                    item.setSoluong(count); 
                }
            
            }else{
                //Chưa có SP
                Item item = new Item(spBuy, 1);
            cart.put(maSP, item);
            }
                
            }else{
                sessionHttp.setAttribute("error", true);
                sessionHttp.setAttribute("messageAddToCart", "<font color='red'><b>Sản phẩm đã hết hàng</b>");
            }
            
            
        return "redirect:cart.html";
    }
    
    
    @RequestMapping(value ="cartRemoveAll", method = RequestMethod.GET)
    public String cartRemoveAll(ModelMap model, HttpSession sessionHttp, HttpServletRequest request){
        cart.clear();
        return "redirect:cart.html";
    }
    
    
    @RequestMapping(value = "UpandDownProduct", method = RequestMethod.GET)
    public String upDown(ModelMap model, HttpSession sessionHttp, HttpServletRequest request,
            @RequestParam("type") int type, @RequestParam("maSP") int maSP){
        if(type == 1){ //Tăng Sản phẩm
            if(cart.containsKey(maSP)){
            Item item = cart.get(maSP);
            int count = item.getSoluong();
            if(item.getSanpham().getSoLuong() > count){
                count = count + 1;
            item.setSoluong(count);
            }
            
        }
        }else{
            if(cart.containsKey(maSP)){
            Item item = cart.get(maSP);
            
            int count = item.getSoluong();
            
            count = count - 1;
            if(count <= 0){
                cart.remove(maSP);
            }else{
                            item.setSoluong(count);

            }
            //4.4 gán lại cho so luong của item
        }
        }
        sessionHttp.setAttribute("listCartOrder", getListItems());
        return "redirect:cart.html";
    }

    
    @RequestMapping(value = "checkoutProcess", method = RequestMethod.GET)
    public String checkoutProcess(ModelMap model, HttpSession sessionHttp, HttpServletRequest request){
         Session session = factory.openSession();
        Transaction t = session.beginTransaction();
         SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
         Calendar cal = Calendar.getInstance();
         String ngayDH = dateFormat.format(cal.getTime());
         DonHang dh = new DonHang();
         dh.setNgayDatHang(ngayDH);
         dh.setUsername((String) sessionHttp.getAttribute("username"));
         dh.setAddress("Updating...");
         try {
            session.save(dh); //Tạo đơn hàng mới
            t.commit();
            Query query = session.createQuery("from DonHang order by MaDH DESC");
            query.setMaxResults(1);
            DonHang lastDH = (DonHang) query.uniqueResult(); //Lấy mã đơn hàng mới tạo
            int maDH_moinhat = lastDH.getMaDH();
             ArrayList<Item> giohang = getListItems();
             if(giohang.size() <= 0){
                 //Nếu giỏ hàng nhỏ hơn hoặc bằng 0
                 
                 sessionHttp.setAttribute("messageCheckOut", "<font color='green'>Bạn không có món hàng nào để thanh toán</font>");
                 return "redirect:checkout.html";
             }else{
                 for (Item i : giohang) {
                     Session ss = factory.openSession();
                     Transaction tx = ss.beginTransaction();
                     System.out.println(i.getSanpham().getMaSP());
                    ChiTietDonHang ctdh = new ChiTietDonHang(maDH_moinhat, i.getSanpham().getMaSP(), i.getSanpham().getDonGia(), i.getSoluong(), 0, ngayDH, (String) sessionHttp.getAttribute("username"), "Updating...");
                    ss.save(ctdh);
                    tx.commit();
                    downSanPham(i.getSanpham().getMaSP(), i.getSoluong());
                    ss.close();

                }
                 cart.clear();
                 sessionHttp.setAttribute("maDH", maDH_moinhat);
                 sessionHttp.setAttribute("messageCheckOut", "<font color='green'>Bạn đã gửi yêu cầu đặt hàng thành công<br> <b>"+maDH_moinhat+"</b> sẽ là mã đơn hàng của bạn</font>");
                 sessionHttp.removeAttribute("listCartOrder");
                sessionHttp.removeAttribute("tongtienCart");
             }
        } catch (Exception e) {
            
             System.out.println(e);
            t.rollback();
        } finally {
             session.close();
         }
        return "redirect:checkout.html";
    }
    
    
    
    
    @RequestMapping(value = "checkout")
    public String checkout(){
        return "checkout";
    }
    
    
    
    @RequestMapping(value = "api/getCart")
    @ResponseBody
        public ResponseEntity<String> getCart(HttpSession sessionHttp) {
             Session session = factory.getCurrentSession();
        int tong = getTongTien();
        int count = 0;
        try {
            count = cart.size();
        } catch (Exception e) {
            count = 0;
        }
        
        return new ResponseEntity<>("{\"status\" : \"true\",\"tongTien\" : \""+tong+"\", \"count\":\""+count+"\"}", HttpStatus.OK);
        
        }
        
        
        public boolean downSanPham(int maSP, int soLuongMua){
            Session session = factory.openSession();
            Transaction tx = session.beginTransaction();
            SanPham sp = (SanPham) session.get(SanPham.class, maSP);
            int count = sp.getSoLuong();
            count = (count-soLuongMua);
            sp.setSoLuong(count);
            session.update(sp);
            tx.commit();
            return true;
        }
      public int getTongTien(){
          int tong = 0;
          try {
              for(Item item : cart.values()){
            tong = tong + (item.getSoluong()*item.getSanpham().getDonGia());
        }
          } catch (Exception e) {
              return tong = 0;
          }
        return tong;
      }
      public boolean checkContains(int maSP){
            if(cart.containsKey(maSP)){
                return true;
            }
          return false;
      }
      
      public ArrayList<Item> getListItems(){
          ArrayList<Item> list = new ArrayList<>();
          try {
              // khai bao danh sach item
        
        // duyet qua gio hang va them vao danh list
        for(Item i : cart.values()){
            // them vao danh sach
            list.add(i);
        }
          } catch (Exception e) {
              return null;
          }
        return list; // tra ve danh sach cac item co trong gio hàng
    }
}
