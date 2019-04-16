/**
 * Created by wph-pc on 2018/3/19.
 */
function MyKindEditor(controlName, height) {
    return KindEditor.create('textarea[name="' + controlName + '"]', {
        resizeType: 1,
        allowPreviewEmoticons: false,
        cssPath : getRootPath() + "/plugins/kindeditor/plugins/code/prettify.css",
        uploadJson: getRootPath() + "/plugins/kindeditor/upload_json.jsp",
        height: height == undefined ? 200 : height,
        allowImageUpload: true,
        // items: [
        //     'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
        //     'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
        //     'insertunorderedlist', '|', 'emoticons', 'image', 'link'],
        afterBlur: function () {
            this.sync();
        },
        afterCreate: function () {
            this.sync();
        }
    });
}





