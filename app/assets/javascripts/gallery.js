$(function () {
    // Show the first image
    $('.image_slider img:first-child()').show();

    $('.thumbnails li').on('click', function () { // Thumbnail click event
    
        // Get the jquery thumbnail object
        var $thumbnail = $(this);
        $('.image_slider img').attr('src', $thumbnail.data('image-url'));
    });
});