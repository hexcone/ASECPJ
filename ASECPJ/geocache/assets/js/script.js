$(function () {

    var dropbox = $('#dropbox'),
		message = $('.message', dropbox);

    dropbox.filedrop({
        paramname: 'pic',
        maxfiles: 1,
        maxfilesize: 2048,
        //url: '/Uploader.asmx/Upload',
        url: '/Default.aspx',

        uploadFinished: function (i, file, response) {
            $.data(file).addClass('done');
        },

        error: function (err, file) {
            switch (err) {
                case 'BrowserNotSupported':
                    showMessage('Your browser does not support HTML5 file uploads!');
                    break;
                case 'TooManyFiles':
                    alert('Please select 1 photo only!');
                    break;
                case 'FileTooLarge':
                    alert(file.name + ' is too large! Please upload files up to 2mb.');
                    break;
                default:
                    break;
            }
        },

        // Called before each upload is started
        //        beforeEach: function (file) {
        //            if (!file.type.match(/^image\//)) {
        //                alert('Only images are allowed!');

        //                // Returning false will cause the
        //                // file to be rejected
        //                return false;
        //            }
        //        },

        uploadStarted: function (i, file, len) {
            createImage(file);
        },

        progressUpdated: function (i, file, progress) {
            $.data(file).find('.progress').width(progress);
        }

    });

    var template = '<div class="preview">' +
						'<span class="imageHolder">' +
							'<img />' +
							'<span class="uploaded"></span>' +
						'</span>' +
						'<div class="progressHolder">' +
							'<div class="progress"></div>' +
						'</div>' +
					'</div>';


    function createImage(file) {

        var preview = $(template),
			image = $('img', preview);

        var reader = new FileReader();

        image.width = 100;
        image.height = 100;

        reader.onload = function (e) {

            // e.target.result holds the DataURL which
            // can be used as a source of the image:
            //alert(e.target.result);
            image.attr('src', e.target.result);
        };

        // Reading the file as a DataURL. When finished,
        // this will trigger the onload function above:
        reader.readAsDataURL(file);

        message.hide();
        preview.appendTo(dropbox);

        // Associating a preview container
        // with the file, using jQuery's $.data():

        $.data(file, preview);
    }

    function showMessage(msg) {
        message.html(msg);
    }

});