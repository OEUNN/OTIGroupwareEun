tinymce.init({
	language: 'ko_KR',
	selector: '#write',
	width: '100%',
	height: '200mm',
	theme: 'silver',
	toolbar1: 'undo redo | insert | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image',
	toolbar2: 'print preview media | forecolor backcolor emoticons | codesample help',
	 content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:14px }'
});

tinymce.init({
	language: 'ko_KR',
	selector: '#read_write',
	width: '100%',
	height: '200mm',
	theme: 'silver',
	toolbar1: 'undo redo | insert | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image',
	toolbar2: 'print preview media | forecolor backcolor emoticons | codesample help',
	content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:14px }',
	plugins: [
		'noneditable'
	],
	menubar : '',
	toolbar1: 'fullscreen print',
	readonly: 1
});