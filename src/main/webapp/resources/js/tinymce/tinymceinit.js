tinymce.init({
	selector: '#document',
	height: '297mm',
	theme: 'silver',
	plugins: [
	    'print noneditable',
	    'wordcount fullscreen charmap hr textcolor colorpicker textpattern',
	    'template searchreplace insertdatetime anchor pagebreak emoticons'
	],
	toolbar1: 'template fullscreen print',
	toolbar2: 'undo redo | insert | styleselect | bold italic underline | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent',
	template_mdate_format: '%m/%d/%Y : %H:%M',
	templates : [
	  {
	    title: '결재품의서',
	    description: '모든 품의서의 템플릿인 결재품의서',
	    url: '../resources/html/approvalform.html'
	  },
	  {
	    title: 'Replace values example',
	    description: 'These values will be replaced when the template is inserted into the editor content.',
	    content: '<p>Name: {$username}, StaffID: {$staffid}</p>'
	  }
	],
	content_css : '../resources/css/approvalform.css',
	object_resizing : false
});

tinymce.init({
	selector: '#document_detail',
	height: '297mm',
	theme: 'silver',
	plugins: [
		'template noneditable'
		],
	menubar : '',
	toolbar1: 'fullscreen print preview wordcount template',
	templates : [
	  {
	    title: '결재품의서',
	    description: '모든 품의서의 템플릿인 결재품의서',
	    url: '../resources/html/approvalformdetail.html'
	  }
	],
	content : '<h1>EXAMPLE</h1>',
	content_css : '../resources/css/approvalform.css',
	object_resizing : false
});