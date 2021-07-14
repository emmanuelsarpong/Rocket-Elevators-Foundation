jQuery(document).ready(function(){

    $("select#building_id").hide();
    $("#building_label").hide();

    $("select#battery_id").hide();
    $("#battery_label").hide();

    $("select#column_id").hide();
    $("#column_label").hide();

    $("select#elevator_id").hide();
    $("#elevator_label").hide();

});

$('#customer_id_selector').change(function(){
    var id_value_string = $(this).val();
    if (id_value_string == "") {
        $('#select#building_id option').remove();
        var row = '<option value=\'' + 'nullest' + '\' selected>' + '--- Select ---' + '</option';
        $(row).append('select#building_id');
    } else {

        $.ajax({
            dataType: 'json',
            cache: false,
            url: '/get_building_by_customer/' + id_value_string,
            timeout: 5000,
            error: function(XMLHttpRequest, errorTextStatus, error){
                alert('failed to submit: ' + errorTextStatus + ';' + error);
            },
            success: function(data){

                $('#building_id_selector option').remove();

                var row = '<option value=\'' + 'nullest' + '\' selected>' + '--- Select ---' + '</option>';
                $('select#building_id_selector').append(row);
                console.log(data);
                $.each(data, function(i,j){
                    row = '<option value=\'' + j.id + '\'>' + j.id + '</option>';
                    $('select#building_id_selector').append(row);
                });
                $('#building_id').show();
            }
        });
    }
    ShowHide();
});

$('#building_id_selector').change(function(){
    var id_value_string = $(this).val();
    console.log(id_value_string);
    if (id_value_string == "") {
        $('#battery_id_selector option').remove();
        var row = '<option value=\'' + 'nullest' + '\' selected>' + '--- Select ---' + '</option';
        $(row).append('select#battery_id');
    } else{

        $.ajax({
            dataType: 'json',
            cache: false,
            url: '/get_battery_by_building/' + id_value_string,
            timeout: 5000,
            error: function(XMLHttpRequest, errorTextStatus, error){
                alert('failed to submit: ' + errorTextStatus + ';' + error);
            },
            success: function(data){

                $('#battery_id_selector option').remove();

                var row = '<option value=\'' + 'nullest' + '\' selected>' + '--- Select ---' + '</option>';
                $('#battery_id_selector').append(row);

                $.each(data, function(i,j){
                    row = '<option value=\'' + j.id + '\'>' + j.id + '</option>';
                    $('#battery_id_selector').append(row);
                });
            }
        });
    }
    ShowHide();
});

$('#battery_id_selector').change(function(){
    var id_value_string = $(this).val();
    console.log(id_value_string);
    if (id_value_string == "") {
        $('#column_id_selector option').remove();
        var row = '<option value=\'' + 'nullest' + '\' selected>' + '--- Select ---' + '</option';
        $(row).append('#column_id_selector');
    } else{
        //Send request and update course dropdown
        $.ajax({
            dataType: 'json',
            cache: false,
            url: '/get_column_by_battery/' + id_value_string,
            timeout: 5000,
            error: function(XMLHttpRequest, errorTextStatus, error){
                alert('failed to submit: ' + errorTextStatus + ';' + error);
            },
            success: function(data){
                $('#column_id_selector option').remove();

                var row = '<option value=\'' + 'nullest' + '\' selected>' + '--- Select ---' + '</option>';
                $('#column_id_selector').append(row);

                $.each(data, function(i,j){
                    row = '<option value=\'' + j.id + '\'>' + j.id + '</option>';
                    $('#column_id_selector').append(row);
                });
            }
        });
    }
    ShowHide();
});

$('#column_id_selector').change(function(){
    var id_value_string = $(this).val();
    console.log(id_value_string);
    if (id_value_string == "") {
        $('#elevator_id_selector option').remove();
        var row = '<option value=\'' + 'nullest' + '\' selected>' + '--- Select ---' + '</option';
        $(row).append('#elevator_id_selector option');
    } else{

        $.ajax({
            dataType: 'json',
            cache: false,
            url: '/get_elevator_by_column/' + id_value_string,
            timeout: 5000,
            error: function(XMLHttpRequest, errorTextStatus, error){
                alert('failed to submit: ' + errorTextStatus + ';' + error);
            },
            success: function(data){

                $('#elevator_id_selector option').remove();

                var row = '<option value=\'' + 'nullest' + '\' selected>' + '--- Select ---' + '</option>';
                $('#elevator_id_selector option').append(row);

                $.each(data, function(i,j){
                    row = '<option value=\'' + j.id + '\'>' + j.id + '</option>';
                    $('#elevator_id_selector option').append(row);
                });
            }
        });
    }
    ShowHide();
});




