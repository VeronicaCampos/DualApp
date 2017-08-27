import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import {FormsModule} from '@angular/forms';

import {APP_ROUTING} from './app.routes';

import { AppComponent } from './app.component';
import { LoginComponent } from './components/login/login.component';
import { HomeComponent } from './components/home/home.component';
import { SearchComponent } from './components/search/search.component';
import { NavbarComponent } from './components/navbar/navbar.component';
import { ReporteComponent } from './components/reporte/reporte.component';
import { PerfilesComponent } from './components/perfiles/perfiles.component';
import { EditPerfilComponent } from './components/perfiles/edit-perfil/edit-perfil.component';
import { AvisosComponent } from './components/home/avisos/avisos.component';
import { AsesoresComponent } from './components/home/asesores/asesores.component';

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    HomeComponent,
    SearchComponent,
    NavbarComponent,
    ReporteComponent,
    PerfilesComponent,
    EditPerfilComponent,
    AvisosComponent,
    AsesoresComponent
  ],
  imports: [
    BrowserModule,
    APP_ROUTING
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
