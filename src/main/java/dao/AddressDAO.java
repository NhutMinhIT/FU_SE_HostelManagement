/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.Address.City;
import dto.Address.District;
import dto.Address.Ward;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author avillX
 */
public class AddressDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;  

    private static final String GETALLCITY = "Select * from dbo.City";
    private static final String GETALLDISTRICT = "Select * from dbo.District";
    private static final String GETALLWARD = "Select * from dbo.Ward";

    private static final String GETACITY = "Select * from dbo.City where city_id = ?";
    private static final String GETADISTRICT = "Select * from dbo.District where district_id = ?";
    private static final String GETAWARD = "Select * from dbo.Ward where ward_id = ?";

    public List<City> GetAllCity(){
        List<City> list = new ArrayList<>();        
        try{
            String query = GETALLCITY;
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(new City(  rs.getString(1),
                                    rs.getString(2),
                                    rs.getString(3)));
            }
        }catch(Exception e){}
        return list;
    }
    public List<District> GetAllDistrict(){
        List<District> list = new ArrayList<>();        
        try{
            String query = GETALLDISTRICT;
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(new District(  rs.getString(1),
                                    rs.getString(2),
                                    rs.getString(3),
                                    rs.getString(4)));
            }
        }catch(Exception e){}
        return list;
    }
    public List<Ward> GetAllWard(){
        List<Ward> list = new ArrayList<>();        
        try{
            String query = GETALLWARD;
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(new Ward(  rs.getString(1),
                                    rs.getString(2),
                                    rs.getString(3),
                                    rs.getString(4)));
            }
        }catch(Exception e){}
        return list;
    }


    public City GetACity(String CityID){
        
        try{
            String query = GETACITY;
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, CityID);
            rs = ps.executeQuery();
            while(rs.next()){
                return new City(  rs.getString(1),
                                    rs.getString(2),
                                    rs.getString(3));
            }
        }catch(Exception e){}
        return null;
    }
    public District GetADistrict(String DistrictID){      
        try{
            String query = GETADISTRICT;
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, DistrictID);
            rs = ps.executeQuery();
            while(rs.next()){
                return new District(  rs.getString(1),
                                    rs.getString(2),
                                    rs.getString(3),
                                    rs.getString(4));
            }
        }catch(Exception e){}
        return null;
    }
    public Ward GetAWard(String WardID){      
        try{
            String query = GETAWARD;
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, WardID);
            rs = ps.executeQuery();
            while(rs.next()){
                return new Ward(  rs.getString(1),
                                    rs.getString(2),
                                    rs.getString(3),
                                    rs.getString(4));
            }
        }catch(Exception e){}
        return null;
    }
}
