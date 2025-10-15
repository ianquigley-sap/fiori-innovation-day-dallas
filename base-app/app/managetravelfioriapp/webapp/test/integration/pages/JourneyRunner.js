sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"managetravelfioriapp/test/integration/pages/TravelsList",
	"managetravelfioriapp/test/integration/pages/TravelsObjectPage"
], function (JourneyRunner, TravelsList, TravelsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('managetravelfioriapp') + '/test/flpSandbox.html#managetravelfioriapp-tile',
        pages: {
			onTheTravelsList: TravelsList,
			onTheTravelsObjectPage: TravelsObjectPage
        },
        async: true
    });

    return runner;
});

