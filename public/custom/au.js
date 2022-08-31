setRemove();

$("#add-author").click(function(){
   // $(".select-author-one:first").clone().insertAfter("div#authors_multi_wrapper:last");
    $("div#authors_multi_wrapper").append($(".select-author-one:first").clone());
    setRemove();
    setEmptyValue();
});

$("#remove-author").click(function(){
    $(".select-author-one:last").remove();
    setRemove()
});

function setRemove(){
    var count_author;

    count_author = $(".select-author-one").length;
    if(count_author > 1){
        $("#remove-author").show();
    }else{
        $("#remove-author").hide();
    }
}

function setEmptyValue(){
    //console.log('hai' + $(".select-author-one:last").find('select').val());
    $(".select-author-one:last").find('select option:selected').attr("selected", null);
    
}