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
public class ContractDTO {
    private String contractID;
    private String customerID;
    private String roomID;
    private Date signed_date;
    private Date due_date;
    private String status;
    private String description;

    public ContractDTO(String contractID, String customerID, String roomID, Date signed_date, Date due_date, String status, String description) {
        this.contractID = contractID;
        this.customerID = customerID;
        this.roomID = roomID;
        this.signed_date = signed_date;
        this.due_date = due_date;
        this.status = status;
        this.description = description;
    }

    public String getContractID() {
        return contractID;
    }

    public void setContractID(String contractID) {
        this.contractID = contractID;
    }

    public String getCustomerID() {
        return customerID;
    }

    public void setCustomerID(String customerID) {
        this.customerID = customerID;
    }

    public String getRoomID() {
        return roomID;
    }

    public void setRoomID(String roomID) {
        this.roomID = roomID;
    }

    public Date getSigned_date() {
        return signed_date;
    }

    public void setSigned_date(Date signed_date) {
        this.signed_date = signed_date;
    }

    public Date getDue_date() {
        return due_date;
    }

    public void setDue_date(Date due_date) {
        this.due_date = due_date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


}
