/**
 * @license Copyright (c) 2003-2019, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function(config) {
    // Define changes to default configuration here. For example:
    // config.language = 'fr';
    //开启插件
    config.extraPlugins = 'codesnippet,uploadimage,imagepaste,image2'; //ajax
    config.codeSnippet_theme = 'monokai_sublime'; //配置默认代码样式
    config.autocomplete_commitKeystrokes = [9, 13]; //配置键盘按键
    config.skin = 'moonocolor'; //配置皮肤
    config.height = 556;
    config.width = '100%';
    config.resize_enabled = false;//完全禁止调整高度
    config.toolbarGroups = [
        { name: 'clipboard', groups: ['clipboard', 'undo'] },
        { name: 'editing', groups: ['find', 'selection', 'spellchecker', 'editing'] },
        '/',
        { name: 'basicstyles', groups: ['basicstyles', 'cleanup'] },
        { name: 'paragraph', groups: ['list', 'indent', 'blocks', 'align', 'bidi', 'paragraph'] },
        { name: 'links', groups: ['links'] },
        { name: 'insert', groups: ['insert', 'Smiley'] },
        '/',
        { name: 'styles', groups: ['styles'] },
        { name: 'colors', groups: ['colors'] },
        { name: 'forms', groups: ['forms'] },
        { name: 'document', groups: ['mode', 'document', 'doctools'] },
        { name: 'tools', groups: ['tools'] },
        { name: 'others', groups: ['others'] },
        { name: 'about', groups: ['about'] }
    ];
    config.removeButtons = 'Source,Save,NewPage,Print,Templates,Cut,Copy,Paste,PasteText,PasteFromWord,Undo,Redo,Replace,SelectAll,Scayt,Form,TextField,Textarea,Select,Button,ImageButton,HiddenField,Outdent,Blockquote,Indent,CreateDiv,BidiLtr,BidiRtl,Language,Unlink,Anchor,Flash,PageBreak,Iframe,ShowBlocks,About,Find';
    //自定义表情的放置目录
    // config.smiley_path = "http://localhost:8080/ckeditor/plugins/smiley/emoji/";
    config.smiley_path = "/static/ckeditor/plugins/smiley/emoji/";
    //设置对话框一行显示几个表情
    config.smiley_columns = 14;
    //设置对话框表情  每一个表情的名字
    config.smiley_images = ["Expression_106.png", "Expression_107.png", "Expression_108.png", "Expression_109.png", "Expression_113.png", "Expression_114.png",
        //qqgif
        "0@2x.gif", "100@2x.gif", "101@2x.gif", "102@2x.gif", "10@2x.gif", "103@2x.gif", "104@2x.gif", "105@2x.gif", "106@2x.gif", "107@2x.gif", "108@2x.gif", "109@2x.gif", "110@2x.gif", "111@2x.gif", "112@2x.gif", "11@2x.gif", "113@2x.gif", "114@2x.gif", "124@2x.gif", "125@2x.gif", "126@2x.gif", "127@2x.gif", "128@2x.gif", "129@2x.gif", "1@2x.gif", "130@2x.gif", "131@2x.gif", "132@2x.gif", "13@2x.gif", "133@2x.gif", "134@2x.gif", "172@2x.gif", "173@2x.gif", "174@2x.gif", "175@2x.gif", "176@2x.gif", "177@2x.gif", "178@2x.gif", "179@2x.gif", "180@2x.gif", "181@2x.gif", "182@2x.gif", "18@2x.gif", "183@2x.gif", "212@2x.gif", "21@2x.gif", "22@2x.gif", "2@2x.gif", "23@2x.gif", "24@2x.gif", "25@2x.gif", "26@2x.gif", "27@2x.gif", "28@2x.gif", "29@2x.gif", "30@2x.gif", "31@2x.gif", "32@2x.gif", "3@2x.gif", "33@2x.gif", "34@2x.gif", "35@2x.gif", "36@2x.gif", "37@2x.gif", "38@2x.gif", "39@2x.gif", "41@2x.gif", "42@2x.gif", "4@2x.gif", "43@2x.gif", "46@2x.gif", "49@2x.gif", "5@2x.gif", "53@2x.gif", "54@2x.gif", "55@2x.gif", "56@2x.gif", "57@2x.gif", "59@2x.gif", "60@2x.gif", "61@2x.gif", "62@2x.gif", "6@2x.gif", "63@2x.gif", "64@2x.gif", "66@2x.gif", "67@2x.gif", "69@2x.gif", "72@2x.gif", "7@2x.gif", "74@2x.gif", "75@2x.gif", "76@2x.gif", "77@2x.gif", "78@2x.gif", "79@2x.gif", "8@2x.gif", "85@2x.gif", "86@2x.gif", "89@2x.gif", "90@2x.gif", "91@2x.gif", "9@2x.gif", "96@2x.gif", "97@2x.gif", "98@2x.gif", "99@2x.gif",
        //emoji
        "0x1f602.png", "0x1f648.png"
    ];
    config.smiley_descriptions = [];
    config.contentsCss = "/static/ckeditor/contents.css";
    config.enterMode = CKEDITOR.ENTER_BR; //  屏蔽换行符<br>;
    config.shiftEnterMode = CKEDITOR.ENTER_P; //屏蔽段落<p>
    // 文件上传配置
    config.filebrowserBrowseUrl = '/apps/ckfinder/3.4.5/ckfinder.html';
    config.filebrowserImageBrowseUrl = '/apps/ckfinder/3.4.5/ckfinder.html?type=Images';
    config.filebrowserUploadUrl = '/apps/ckfinder/3.4.5/core/connector/php/connector.php?command=QuickUpload&type=Files';
    config.filebrowserImageUploadUrl = '/apps/ckfinder/3.4.5/core/connector/php/connector.php?command=QuickUpload&type=Images';

    // Upload dropped or pasted images to the CKFinder connector (note that the response type is set to JSON).
    config.uploadUrl = '/apps/ckfinder/3.4.5/core/connector/php/connector.php?command=QuickUpload&type=Files&responseType=json';

    // Reduce the list of block elements listed in the Format drop-down to the most commonly used.
    config.format_tags = 'p;h1;h2;h3;pre';
    // Simplify the Image and Link dialog windows. The "Advanced" tab is not needed in most cases.
    config.removeDialogTabs = 'image:advanced;link:advanced';
};