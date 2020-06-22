import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { RetailerComponent } from '../retailer/retailer.component';
import { DistributorComponent } from '../distributor/distributor.component';
import { ManufactureComponent } from '../manufacture/manufacture.component';
import { SupplierComponent } from '../supplier/supplier.component';
import { LoginComponent } from '../login/login.component';
const routes: Routes = [
 {
   path: 'employee',
   component: RetailerComponent,
   pathMatch: 'full'
 },
 {
   path: 'project_lead',
   component: DistributorComponent,
   pathMatch: 'full'
 },
 {
   path: 'secretary',
   component: ManufactureComponent,
   pathMatch: 'full'
 },
 {
   path: 'chairman',
   component: SupplierComponent,
   pathMatch: 'full'
 },
 {
   path: 'login',
   component: LoginComponent,
   pathMatch: 'full'
 },
 {
   path: '',
   component: LoginComponent
 }

]
@NgModule({
  imports: [RouterModule.forRoot(routes)],
exports: [RouterModule],
  declarations: []
})
export class RouteModule { }
