tinymce.init({
	selector: '#documenttitle',
	width: '100%',
	height: '100px',
	theme: 'silver',
	plugins: [
		'charmap hr',
		'searchreplace wordcount',
		'insertdatetime save',
		'paste textcolor colorpicker textpattern'
		],
	menubar: 'edit insert format tools',
	menu : {
		insert : { title : 'Insert', items : 'charmap hr | insertdatetime'}
	},
	toolbar1: 'undo redo | styleselect | forecolor backcolor | alignleft aligncenter alignright alignjustify outdent indent',
	content_style: '.td { padding: 0; }'
});

tinymce.init({
	selector: '#documentcontent',
	width: '100%',
	height: '500px',
	theme: 'silver',
	plugins: [
		'advlist autolink lists charmap hr anchor pagebreak',
		'searchreplace wordcount visualblocks visualchars fullscreen',
		'insertdatetime nonbreaking save table contextmenu directionality',
		'emoticons paste textcolor colorpicker textpattern'
		],
	menubar: 'file edit view insert format tools',
	menu : {
		insert : { title : 'Insert', items : 'charmap emoticons hr | pagebreak nonbreaking anchor | insertdatetime'}
	},
	toolbar1: 'undo redo | insert | styleselect | bold italic underline | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image',
	toolbar2: 'forecolor backcolor emoticons',
	content_style: '.td { padding: 0; }'
});

tinymce.init({
	selector: '#document',
	width: '210mm',
	height: '297mm',
	theme: 'silver',
	plugins: [
	    'print preview',
	    'wordcount fullscreen',
	    'template'
	],
	menubar: 'file insert tools',
	toolbar1: 'template fullscreen print preview',
	image_advtab: true,
	template_mdate_format: '%m/%d/%Y : %H:%M',
	templates : [
	  {
	    title: '결재품의서',
	    description: '모든 품의서의 템플릿인 결재품의서',
	    url: '../resources/html/extraworkform.html'
	  },
	  {
	    title: 'Replace values example',
	    description: 'These values will be replaced when the template is inserted into the editor content.',
	    content: '<p>Name: {$username}, StaffID: {$staffid}</p>'
	  }
	],
	content_style: '.td { padding: 0; }'
});