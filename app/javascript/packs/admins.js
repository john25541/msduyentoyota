$(document).on('input', '.attach_image',function () {
    if (typeof (FileReader) != "undefined") {
        let dvPreview = $(this).parents(".image-border").find(".image-media-preview");
        dvPreview.html("");
        $($(this)[0].files).each(function () {
            let file = $(this);
            let reader = new FileReader();
            reader.onload = function (e) {
                let img = $("<img />");
                img.attr("style", "width: 200px; height:auto;");
                img.attr("src", e.target.result);
                dvPreview.append(img);
            }
            reader.readAsDataURL(file[0]);
        });
    } else {
        alert("This browser does not support HTML5 FileReader.");
    }
});