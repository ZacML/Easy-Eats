import { Component } from '@angular/core';
import { RouterLink, RouterLinkActive } from "@angular/router";

@Component({
  selector: 'app-perfil-admin',
  imports: [RouterLink, RouterLinkActive],
  templateUrl: './perfilAdmin.html',
  styleUrl: './perfilAdmin.scss',
})
export class PerfilAdmin {
currentYear: any;

}
