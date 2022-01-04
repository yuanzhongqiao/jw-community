/* Persian (Farsi) Translation for the jQuery UI date picker plugin. */
/* Javad Mowlanezhad -- jmowla@gmail.com */
/* Jalali calendar should supported soon! (Its implemented but I have to test it) */
jQuery(function($) {
	$.datepicker.regional['fa'] = {
		closeText: '\u0628\u0633\u062a\u0646',
		prevText: '&#x3C;\u0642\u0628\u0644\u06cc',
		nextText: '\u0628\u0639\u062f\u06cc&#x3E;',
		currentText: '\u0627\u0645\u0631\u0648\u0632',
		monthNames: [
			'\u0641\u0631\u0648\u0631\u062f\u064a\u0646',
			'\u0627\u0631\u062f\u064a\u0628\u0647\u0634\u062a',
			'\u062e\u0631\u062f\u0627\u062f',
			'\u062a\u064a\u0631',
			'\u0645\u0631\u062f\u0627\u062f',
			'\u0634\u0647\u0631\u064a\u0648\u0631',
			'\u0645\u0647\u0631',
			'\u0622\u0628\u0627\u0646',
			'\u0622\u0630\u0631',
			'\u062f\u06cc',
			'\u0628\u0647\u0645\u0646',
			'\u0627\u0633\u0641\u0646\u062f'
		],
		monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
		dayNames: [
			'\u064a\u06a9\u0634\u0646\u0628\u0647',
			'\u062f\u0648\u0634\u0646\u0628\u0647',
			'\u0633\u0647\u200c\u0634\u0646\u0628\u0647',
			'\u0686\u0647\u0627\u0631\u0634\u0646\u0628\u0647',
			'\u067e\u0646\u062c\u0634\u0646\u0628\u0647',
			'\u062c\u0645\u0639\u0647',
			'\u0634\u0646\u0628\u0647'
		],
		dayNamesShort: [
			'\u06cc',
			'\u062f',
			'\u0633',
			'\u0686',
			'\u067e',
			'\u062c',
			'\u0634'
		],
		dayNamesMin: [
			'\u06cc',
			'\u062f',
			'\u0633',
			'\u0686',
			'\u067e',
			'\u062c',
			'\u0634'
		],
		weekHeader: '\u0647\u0641',
		dateFormat: 'yy/mm/dd',
		firstDay: 6,
		isRTL: true,
		showMonthAfterYear: false,
		yearSuffix: ''};
	$.datepicker.setDefaults($.datepicker.regional['fa']);
});