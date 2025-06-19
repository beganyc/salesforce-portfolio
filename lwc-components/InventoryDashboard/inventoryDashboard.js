import { LightningElement, wire } from 'lwc';
import getInventory from '@salesforce/apex/InventoryController.getInventory';

export default class InventoryDashboard extends LightningElement {
    inventoryData;

    @wire(getInventory)
    wiredInventory({ error, data }) {
        if (data) {
            this.inventoryData = data;
        } else if (error) {
            console.error(error);
        }
    }
}