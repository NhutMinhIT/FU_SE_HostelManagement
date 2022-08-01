/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

/**
 *
 * @author avillX
    [bill_id],[detail_id],[old_qty],[qty],[total],[description]
 */
public class BillDetailDTO {
    private int billdetailID;
    private ServiceDetailDTO service;
    private int qty;
    private Double total;

    public BillDetailDTO(int billdetailID, ServiceDetailDTO service, int qty, Double total) {
        this.billdetailID = billdetailID;
        this.service = service;
        this.qty = qty;
        this.total = total;
    }

    public int getBilldetailID() {
        return billdetailID;
    }

    public void setBilldetailID(int billdetailID) {
        this.billdetailID = billdetailID;
    }

    public ServiceDetailDTO getService() {
        return service;
    }

    public void setService(ServiceDetailDTO service) {
        this.service = service;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

    
    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = qty * service.getUnit_price();
    }

 

  

}
