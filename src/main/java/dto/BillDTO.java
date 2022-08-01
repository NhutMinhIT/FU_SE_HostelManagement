/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

import java.sql.Date;
import java.util.List;

/**
 *
 * @author avillX
 * ([customer_id],[total],[start_date],[end_date],[created],[status])
 */
public class BillDTO {

    private int billID;
    private String customerID;
    private double total;
    private Date start_date;
    private Date end_date;
    private Date created;
    private String status;
    private List<BillDetailDTO> details;


    public BillDTO(int billID, String customerID, double total, Date start_date, Date end_date, Date created, String status, List<BillDetailDTO> details) {
        this.billID = billID;
        this.customerID = customerID;
        this.total = total;
        this.start_date = start_date;
        this.end_date = end_date;
        this.created = created;
        this.status = status;
        this.details = details;
    }

    public BillDetailDTO GetDetailByID(int id) {
        for (BillDetailDTO i : details) {
            if (i.getBilldetailID() == id) {
                return i;
            }
        }
        return null;
    }

    public Double getDetailQuantityByID(int id) {
        return GetDetailByID(id).getTotal();
    }

    public void RemoveDetail(int id) {
        if (GetDetailByID(id).getBilldetailID() != 0) {
            details.remove(GetDetailByID(id));
        }
    }

    public List<BillDetailDTO> getDetails() {
        return details;
    }

    public void setDetails(List<BillDetailDTO> details) {
        this.details = details;
    }

    public int getBillID() {
        return billID;
    }

    public void setBillID(int billID) {
        this.billID = billID;
    }

    

    public String getCustomerID() {
        return customerID;
    }

    public void setCustomerID(String customerID) {
        this.customerID = customerID;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        for (BillDetailDTO i : details) {
            this.total += i.getTotal();
        }
    }

    public Date getStart_date() {
        return start_date;
    }

    public void setStart_date(Date start_date) {
        this.start_date = start_date;
    }

    public Date getEnd_date() {
        return end_date;
    }

    public void setEnd_date(Date end_date) {
        this.end_date = end_date;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
