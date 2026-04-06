import { Component } from '@angular/core';

@Component({
  selector: 'app-fila',
  templateUrl: './component.fila.html',
  styleUrls: ['./component.fila.scss']
})
export class ComponentFila {

  activeOrders = [];
  readyOrders = [];

  updateOrderStatus(id: number) {}

}