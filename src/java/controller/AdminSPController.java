/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.DanhMuc;
import entity.SanPham;
import entity.Users;
import java.io.File;
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
import org.springframework.web.multipart.MultipartFile;

@Transactional
@Controller
@RequestMapping("/admin/")
public class AdminSPController {

    @Autowired
    SessionFactory factory;

    @RequestMapping(value = "sanpham", method = RequestMethod.GET)

    public String sanpham(ModelMap model, HttpSession sessionHttp, HttpServletRequest request) {
        if (checkAdmin(sessionHttp)) {
            Session session = factory.getCurrentSession();

            String hql = "FROM SanPham";
            Query query = session.createQuery(hql);
            List<SanPham> list = query.list();
            String hql_dm = "FROM DanhMuc"; // lấy hết các tài khoản ra
            Query query_dm = session.createQuery(hql_dm);
            List<DanhMuc> listDM = query_dm.list();
            model.addAttribute("list", list);
            model.addAttribute("listDM", listDM);

            return "admin/sanpham";

        }
        return "redirect:/index.html";
    }

    @RequestMapping(value = "insertSP", method = RequestMethod.POST)
    public String insertSP(ModelMap model, HttpSession sessionHttp, HttpServletRequest request,
            @RequestParam("photo_insert") MultipartFile photo,
            @RequestParam("tensp_insert") String tenSP,
            @RequestParam("dongia_insert") String donGia,
            @RequestParam("soluong_insert") String soLuong,
            @RequestParam("type_insert") String type,
            @RequestParam("dm_insert") String maDM) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            String path = sessionHttp.getServletContext().getRealPath("/");
            String filename = photo.getOriginalFilename();
            photo.transferTo(new File(path + "\\images\\" + filename + ""));
            File file = null;
            try {
                file = new File(path);
                file.createNewFile();
            } catch (Exception e) {
                path = System.getProperty("catalina.base") + "\\images\\" + photo.getOriginalFilename();
                file = new File(path);
            }
            SanPham sp = new SanPham();
            sp.setTenSP(tenSP);
            sp.setDonGia(Integer.parseInt(donGia));
            sp.setSoLuong(Integer.parseInt(soLuong));
            sp.setHinh(filename);
            sp.setType(type);
            sp.setMaDM(Integer.parseInt(maDM));
            session.save(sp);
            t.commit();

        } catch (Exception e) {
            t.rollback();

        } finally {
            session.close();
        }
        return "redirect:sanpham.html";
    }

    @RequestMapping(value = "updateSP", method = RequestMethod.POST)
    public String updateSP(ModelMap model, HttpSession sessionHttp, HttpServletRequest request,
            @RequestParam("photo_form") MultipartFile photo,
            @RequestParam("masp_form") String maSP,
            @RequestParam("tensp_form") String tenSP,
            @RequestParam("dongia_form") String donGia,
            @RequestParam("soluong_form") String soLuong,
            @RequestParam("type_form") String type,
            @RequestParam("dm_form") String maDM,
            @RequestParam(value = "checkOldImage", required = false, defaultValue = "off") String checkOldImage,
            @RequestParam("oldimg") String oldimg) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            if (checkOldImage.equals("on")) {
                //GIỮ ẢNH CŨ
                SanPham sp = new SanPham();
                sp.setMaSP(Integer.parseInt(maSP));
                sp.setTenSP(tenSP);
                sp.setDonGia(Integer.parseInt(donGia));
                sp.setSoLuong(Integer.parseInt(soLuong));
                sp.setHinh(oldimg);
                sp.setType(type);
                sp.setMaDM(Integer.parseInt(maDM));
                session.update(sp);
                t.commit();
            } else {
                //KHONG GIỮ ẢNH CŨ
                if (photo.getOriginalFilename().length() <= 1) {
                    return "redirect:sanpham.html";
                } else {
                    String path = sessionHttp.getServletContext().getRealPath("/");
                    String filename = photo.getOriginalFilename();
                    photo.transferTo(new File(path + "\\images\\" + filename + ""));
                    File file = null;
                    try {
                        file = new File(path);
                        file.createNewFile();
                    } catch (Exception e) {
                        path = System.getProperty("catalina.base") + "\\images\\" + photo.getOriginalFilename();
                        file = new File(path);
                    }
                    SanPham sp = new SanPham();
                    sp.setMaSP(Integer.parseInt(maSP));

                    sp.setTenSP(tenSP);
                    sp.setDonGia(Integer.parseInt(donGia));
                    sp.setSoLuong(Integer.parseInt(soLuong));
                    sp.setHinh(filename);
                    sp.setType(type);
                    sp.setMaDM(Integer.parseInt(maDM));
                    session.update(sp);
                    t.commit();
                }
            }

        } catch (Exception e) {
            t.rollback();

        } finally {
            session.close();
        }
        return "redirect:sanpham.html";
    }
    
    @RequestMapping(value = "deleteSP", method = RequestMethod.GET)
    public String deleteSP(ModelMap model, HttpSession sessionHttp, HttpServletRequest request, 
            @RequestParam("maSP") String maSP){
        Session session = factory.getCurrentSession();
        SanPham sp = (SanPham) session.get(SanPham.class, Integer.parseInt(maSP));
        session.delete(sp);       
        return "redirect:sanpham.html";
        
    }
    
    @RequestMapping(value = "api/getInfoSP")
    @ResponseBody
    public ResponseEntity<String> getInfoSP(HttpSession sessionHttp, @RequestParam("maSP") String maSP) {
        Session session = factory.getCurrentSession();
        SanPham sp = (SanPham) session.get(SanPham.class, Integer.parseInt(maSP));
        return new ResponseEntity<>("{\"status\" : \"true\",\"maSP\" : \"" + sp.getMaSP() + "\", \"tenSp\" : \"" + sp.getTenSP() + "\", \"donGia\" : \"" + sp.getDonGia() + "\", \"soLuong\" : \"" + sp.getSoLuong() + "\", \"hinh\" : \"" + sp.getHinh() + "\", \"type\" : \"" + sp.getType() + "\", \"maDM\" : \"" + sp.getMaDM() + "\"}", HttpStatus.OK);

    }

    public boolean checkAdmin(HttpSession session) {
        return session.getAttribute("vaitro").equals(1);
    }
}
