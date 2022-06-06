/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

/**
 *
 * @author avillX
 */
public class FurnitureDTO {
    private String furnitureID;
    private String furniturename;
    private String image_link;
    private String description;
    private String hostelID;

    public FurnitureDTO(String furnitureID, String furniturename, String image_link, String description, String hostelID) {
        this.furnitureID = furnitureID;
        this.furniturename = furniturename;
        this.image_link = image_link;
        this.description = description;
        this.hostelID = hostelID;
    }

    public String getFurnitureID() {
        return furnitureID;
    }

    public void setFurnitureID(String furnitureID) {
        this.furnitureID = furnitureID;
    }

    public String getFurniturename() {
        return furniturename;
    }

    public void setFurniturename(String furniturename) {
        this.furniturename = furniturename;
    }

    public String getImage_link() {
        return image_link;
    }

    public void setImage_link(String image_link) {
        this.image_link = image_link;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getHostelID() {
        return hostelID;
    }

    public void setHostelID(String hostelID) {
        this.hostelID = hostelID;
    }

}
