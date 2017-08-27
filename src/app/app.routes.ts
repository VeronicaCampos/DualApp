

import { RouterModule, Routes } from '@angular/router';
import {LoginComponent} from './components/login/login.component';
import {HomeComponent} from './components/home/home.component';
import {ReporteComponent} from './components/reporte/reporte.component';
import {SearchComponent} from './components/search/search.component';
import {PerfilesComponent} from './components/perfiles/perfiles.component';
import {EditPerfilComponent} from './components/perfiles/edit-perfil/edit-perfil.component';


const APP_ROUTES: Routes = [
  { path: 'login', component: LoginComponent },
  { path: 'home', component: HomeComponent },
  { path: 'reportes', component: ReporteComponent },
  { path: 'historial', component: SearchComponent },
  { path: 'perfil', component: PerfilesComponent },
  { path: 'edit-perfil', component: EditPerfilComponent },
  { path: '**', pathMatch: 'full', redirectTo: 'home' }
];

export const APP_ROUTING = RouterModule.forRoot(APP_ROUTES);
