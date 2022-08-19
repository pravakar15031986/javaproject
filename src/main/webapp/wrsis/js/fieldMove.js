function strDes(a, b) {
   if (a.value>b.value) return 1;
   else if (a.value<b.value) return -1;
   else return 0;
 }

console.clear();
$(document).ready(function()
		{
	

    $('#btnRight').click(function (e) {
        var selectedOpts = $('.lstBox1 option:selected');
        if (selectedOpts.length == 0) {
            // alert("Nothing to move.");
            e.preventDefault();
        }

        $('#lstBox2').append($(selectedOpts).clone());
        $(selectedOpts).remove();
      
        /* -- Uncomment for optional sorting --
        var box2Options = $('#lstBox2 option');
        var box2OptionsSorted;
        box2OptionsSorted = box2Options.toArray().sort(strDes);
        $('#lstBox2').empty();
        box2OptionsSorted.forEach(function(opt){
          $('#lstBox2').append(opt);
        })
        */
      
        e.preventDefault();
    });

    $('#btnAllRight').click(function (e) {
        var selectedOpts = $('.lstBox1 option');
        if (selectedOpts.length == 0) {
            // alert("Nothing to move.");
            e.preventDefault();
        }

        $('#lstBox2').append($(selectedOpts).clone());
        $(selectedOpts).remove();
        e.preventDefault();
    });

    $('#btnLeft').click(function (e) {
        var selectedOpts = $('#lstBox2 option:selected');
        if (selectedOpts.length == 0) {
            // alert("Nothing to move.");
            e.preventDefault();
        }

        $('.lstBox1').append($(selectedOpts).clone());
        $(selectedOpts).remove();
        e.preventDefault();
    });

    $('#btnAllLeft').click(function (e) {
        var selectedOpts = $('#lstBox2 option');
        if (selectedOpts.length == 0) {
            // alert("Nothing to move.");
            e.preventDefault();
        }

        $('.lstBox1').append($(selectedOpts).clone());
        $(selectedOpts).remove();
        e.preventDefault();
    });
	
		});