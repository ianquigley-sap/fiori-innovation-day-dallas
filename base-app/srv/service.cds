using { manageTravelFioriApp } from '../db/schema.cds';

service manageTravelFioriAppSrv {
  @odata.draft.enabled
  entity Travels as projection on manageTravelFioriApp.Travels;
  entity Bookings as projection on manageTravelFioriApp.Bookings;
  entity Notes as projection on manageTravelFioriApp.Notes;
}