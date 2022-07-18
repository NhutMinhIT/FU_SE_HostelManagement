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
public class ServiceTypeDTO {
    private int serviceID;
    private String service_name; 

    public ServiceTypeDTO(int serviceID, String service_name) {
        this.serviceID = serviceID;
        this.service_name = service_name;
    }

    public int getServiceID() {
        return serviceID;
    }

    public void setServiceID(int serviceID) {
        this.serviceID = serviceID;
    }

   

    public String getService_name() {
        return service_name;
    }

    public void setService_name(String service_name) {
        this.service_name = service_name;
    }
  

  

  


}
