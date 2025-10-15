using { manageTravelFioriAppSrv } from '../../srv/service.cds';

annotate manageTravelFioriAppSrv.Travels with {
  notes @Common.ValueList: {
    CollectionPath: 'Notes',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: notes_ID,
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'comment'
      },
    ],
  }
};
annotate manageTravelFioriAppSrv.Travels with @UI.DataPoint #status: {
  Value: status,
  Title: 'Status',
};
annotate manageTravelFioriAppSrv.Travels with @UI.DataPoint #priceUSD: {
  Value: priceUSD,
  Title: 'Price USD',
};
annotate manageTravelFioriAppSrv.Travels with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#status', ID: 'Status' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#priceUSD', ID: 'PriceUSD' }
];
annotate manageTravelFioriAppSrv.Travels with @UI.HeaderInfo: {
  TypeName: 'Travel',
  TypeNamePlural: 'Travels',
  Title: { Value: tripName }
};
annotate manageTravelFioriAppSrv.Travels with {
  ID @UI.Hidden
};
annotate manageTravelFioriAppSrv.Travels with @UI.Identification: [{ Value: tripName }];
annotate manageTravelFioriAppSrv.Travels with {
  tripName @Common.Label: 'Trip Name';
  employee @Common.Label: 'Employee';
  status @Common.Label: 'Status';
  tripStartDate @Common.Label: 'Trip Start Date';
  tripEndDate @Common.Label: 'Trip End Date';
  priceUSD @Common.Label: 'Price USD';
  bookings @Common.Label: 'Bookings';
  notes @Common.Label: 'Note'
};
annotate manageTravelFioriAppSrv.Travels with {
  ID @Common.Text: { $value: tripName, ![@UI.TextArrangement]: #TextOnly };
  notes @Common.Text: { $value: notes.comment, ![@UI.TextArrangement]: #TextOnly };
};
annotate manageTravelFioriAppSrv.Travels with @UI.SelectionFields : [
 tripName,
 status,
 priceUSD
];
annotate manageTravelFioriAppSrv.Travels with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: tripName },
    { $Type: 'UI.DataField', Value: employee },
    { $Type: 'UI.DataField', Value: status },
    { $Type: 'UI.DataField', Value: tripStartDate },
    { $Type: 'UI.DataField', Value: tripEndDate },
    { $Type: 'UI.DataField', Value: priceUSD },
    { $Type: 'UI.DataField', Label: 'Note', Value: notes_ID }
];
annotate manageTravelFioriAppSrv.Travels with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: tripName },
    { $Type: 'UI.DataField', Value: employee },
    { $Type: 'UI.DataField', Value: status },
    { $Type: 'UI.DataField', Value: tripStartDate },
    { $Type: 'UI.DataField', Value: tripEndDate },
    { $Type: 'UI.DataField', Value: priceUSD },
    { $Type: 'UI.DataField', Label: 'Note', Value: notes_ID }
]};
annotate manageTravelFioriAppSrv.Bookings with @UI.LineItem #Travels_bookings: [
    { $Type: 'UI.DataField', Value: employee },
    { $Type: 'UI.DataField', Value: airlines },
    { $Type: 'UI.DataField', Value: bookingDate },
    { $Type: 'UI.DataField', Value: flightDate },
    { $Type: 'UI.DataField', Value: priceUSD }
];
annotate manageTravelFioriAppSrv.Travels with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' },
  { $Type: 'UI.ReferenceFacet', ID: 'bookings', Label: 'Bookings', Target: 'bookings/@UI.LineItem#Travels_bookings' }
];
annotate manageTravelFioriAppSrv.Bookings with {
  travels @Common.ValueList: {
    CollectionPath: 'Travels',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: travels_ID,
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'tripName'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'employee'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'status'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'tripStartDate'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'tripEndDate'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'priceUSD'
      },
    ],
  }
};
annotate manageTravelFioriAppSrv.Bookings with @UI.HeaderInfo: {
  TypeName: 'Booking',
  TypeNamePlural: 'Bookings'
};
annotate manageTravelFioriAppSrv.Bookings with {
  employee @Common.Label: 'Employee';
  airlines @Common.Label: 'Airlines';
  bookingDate @Common.Label: 'Booking Date';
  flightDate @Common.Label: 'Flight Date';
  priceUSD @Common.Label: 'Price USD';
  travels @Common.Label: 'Travel'
};
annotate manageTravelFioriAppSrv.Bookings with {
  travels @Common.Text: { $value: travels.tripName, ![@UI.TextArrangement]: #TextOnly };
};
annotate manageTravelFioriAppSrv.Bookings with @UI.SelectionFields: [
  travels_ID
];
annotate manageTravelFioriAppSrv.Bookings with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: employee },
    { $Type: 'UI.DataField', Value: airlines },
    { $Type: 'UI.DataField', Value: bookingDate },
    { $Type: 'UI.DataField', Value: flightDate },
    { $Type: 'UI.DataField', Value: priceUSD },
    { $Type: 'UI.DataField', Label: 'Travel', Value: travels_ID }
];
annotate manageTravelFioriAppSrv.Bookings with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: employee },
    { $Type: 'UI.DataField', Value: airlines },
    { $Type: 'UI.DataField', Value: bookingDate },
    { $Type: 'UI.DataField', Value: flightDate },
    { $Type: 'UI.DataField', Value: priceUSD },
    { $Type: 'UI.DataField', Label: 'Travel', Value: travels_ID }
]};
annotate manageTravelFioriAppSrv.Bookings with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];
annotate manageTravelFioriAppSrv.Notes with @UI.HeaderInfo: {
  TypeName: 'Note',
  TypeNamePlural: 'Notes',
  Title: { Value: comment }
};
annotate manageTravelFioriAppSrv.Notes with {
  ID @UI.Hidden
};
annotate manageTravelFioriAppSrv.Notes with @UI.Identification: [{ Value: comment }];
annotate manageTravelFioriAppSrv.Notes with {
  comment @Common.Label: 'Comment'
};
annotate manageTravelFioriAppSrv.Notes with {
  ID @Common.Text: { $value: comment, ![@UI.TextArrangement]: #TextOnly };
};
annotate manageTravelFioriAppSrv.Notes with @UI.SelectionFields: [
  comment
];
annotate manageTravelFioriAppSrv.Notes with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: comment }
];
annotate manageTravelFioriAppSrv.Notes with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: comment }
]};
annotate manageTravelFioriAppSrv.Notes with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];