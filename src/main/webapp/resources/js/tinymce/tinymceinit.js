const getContextPath = () => {
	return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
}
	
tinymce.init({
	language: 'ko_KR',
	selector: '#document',
	height: '297mm',
	theme: 'silver',
	plugins: [
		'print noneditable save autosave',
		'wordcount fullscreen charmap hr textcolor colorpicker textpattern',
		'searchreplace insertdatetime pagebreak emoticons'
		],
		autosave_ask_before_unload: true,
		autosave_interval: '5s',
		autosave_retention: '60m',
		menubar: 'edit insert format',
		menu: {
			edit: { title: 'Edit', items: 'undo redo | cut copy paste pastetext | selectall | searchreplace' },
			insert: { title: 'Insert', items: 'charmap hr | insertdatetime' },
			format: { title: 'Format', items: 'bold italic underline strikethrough superscript subscript | styles blocks fontfamily fontsize align lineheight | forecolor backcolor | language | removeformat' },
		},
		toolbar1: 'restoredraft fullscreen print',
		toolbar2: 'undo redo | styleselect | bold italic underline | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent',
		content_css : getContextPath() + '/resources/css/approvalform.css',
		save_enablewhendirty: false,
		init_instance_callback : function(editor)
		{
			editor.getBody().innerHTML = "<p>양식을 선택해주세요</p>";
			editor.getBody().setAttribute('contenteditable',false);
			initDocument();
		},
		setup: () => {
			console.log("ㅅㅇ");
		},
		object_resizing : false
});

tinymce.init({
	language: 'ko_KR',
	selector: '#document_detail',
	height: '297mm',
	theme: 'silver',
	plugins: [
		'noneditable'
		],
	noneditable_editable_class: "encryptedClassName",
	menubar : '',
	toolbar1: 'fullscreen print',
	readonly: 1,
	content_css : getContextPath() + '/resources/css/approvalform.css',
	object_resizing : false
});

tinymce.init({
	language: 'ko_KR',
	selector: '#boardContent',
	theme: 'silver',
	menubar : '',
	toolbar1: '',
	readonly: 1,
	object_resizing : false
});