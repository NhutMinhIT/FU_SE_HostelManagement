/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

import java.sql.Date;

/**
 *
 * @author avillX
 */
public class ServiceDetailDTO {
    private int detailID;
    private String detailname;
    private String calUnit;
    private double unit_price;
    private Date updated_date;
    private String description;
    private String status;
    private String hostelID;
    private int serviceID;

    public ServiceDetailDTO(int detailID, String detailname, String calUnit, double unit_price, Date updated_date, String description, String status, String hostelID, int serviceID) {
        this.detailID = detailID;
        this.detailname = detailname;
        this.calUnit = calUnit;
        this.unit_price = unit_price;
        this.updated_date = updated_date;
        this.description = description;
        this.status = status;
        this.hostelID = hostelID;
        this.serviceID = serviceID;
    }

    public int getDetailID() {
        return detailID;
    }

    public void setDetailID(int detailID) {
        this.detailID = detailID;
    }

    public String getDetailname() {
        return detailname;
    }

    public void setDetailname(String detailname) {
        this.detailname = detailname;
    }

    public String getCalUnit() {
        return calUnit;
    }

    public void setCalUnit(String calUnit) {
        this.calUnit = calUnit;
    }

    public double getUnit_price() {
        return unit_price;
    }

    public void setUnit_price(double unit_price) {
        this.unit_price = unit_price;
    }

    public Date getUpdated_date() {
        return updated_date;
    }

    public void setUpdated_date(Date updated_date) {
        this.updated_date = updated_date;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getHostelID() {
        return hostelID;
    }

    public void setHostelID(String hostelID) {
        this.hostelID = hostelID;
    }

    public int getServiceID() {
        return serviceID;
    }

    public void setServiceID(int serviceID) {
        this.serviceID = serviceID;
    }

    

    
   

    



    


}
