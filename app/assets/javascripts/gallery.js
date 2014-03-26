$(function () {
    // Show the first image
    $('.image_slider img:first-child()').show();

    $('.thumbnails li').on('click', function () { // Thumbnail click event

        // Get the jquery thumbnail object
        var $thumbnail = $(this);

        // Get the index of the thumbnail we clicked on (first = 0, fifth = 4 etc)
        var thumbnailIndex = $thumbnail.index();

        // Remove the active class from all the big images (to hide the current one)
        $('.image_slider img').hide();


        $('.image_slider img:first-child()').show();
  
        // Show the corresponding image
        $('.image_slider img:nth-child(' + (thumbnailIndex + 1) + ')').show();

        // Remove the active class from all the thumbnails
        $('.thumbnails li').removeClass('active');

        // Give the clicked thumbnail the active class
        // This gives the red border-bottom, but you can ofcourse change the styling to whatever you want
        $thumbnail.addClass('active');
    });
});