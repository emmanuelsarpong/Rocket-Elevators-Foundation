jQuery(document).ready(function(){

    $("#building_id_selector").hide();
    $("#building_id").hide();

    $("#battery_id_selector").hide();
    $("#battery_id").hide();

    $("#column_id_selector").hide();
    $("#column_id").hide();

    $("#elevator_id_selector").hide();
    $("#elevator_id").hide();

});

$('#customer_id').change(function(){
    var id_value_string = $(this).val();
    if (id_value_string == "") {
        $('#building_id_selector option').remove();
        var row = '<option value=\'' + 'nullest' + '\' selected>' + '--- None ---' + '</option';
        $(row).append('#building_id_select');
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

                var row = '<option value=\'' + 'nullest' + '\' selected>' + '--- None ---' + '</option>';
                $('#building_id_selector').append(row);
                console.log(data);
                $.each(data, function(i,j){
                    // row = '<option value=\'' + j.id + '\'>' + j.id + '</option>';
                    row = '<option value=\'' + j.id + '\'>' + "Building with address ID: " + j.address_id+ '</option>';
                    $('#building_id_selector').append(row);
                });
                $('#building_id').show();
            }
        });
    }
    ShowHide();
});

$('#building_id').change(function(){
    var id_value_string = $(this).val();
    console.log(id_value_string);
    if (id_value_string == "") {
        $('#battery_id_selector option').remove();
        var row = '<option value=\'' + 'nullest' + '\' selected>' + '--- None ---' + '</option';
        $(row).append('#battery_id_selector');
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

                var row = '<option value=\'' + 'nullest' + '\' selected>' + '--- None ---' + '</option>';
                $('#battery_id_selector').append(row);

                $.each(data, function(i,j){
                    row = '<option value=\'' + j.id + '\'>' + "Battery with ID: " + j.id + '</option>';
                    $('#battery_id_selector').append(row);
                });
                $('#battery_id_selectof').show();
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
        var row = '<option value=\'' + 'nullest' + '\' selected>' + '--- None ---' + '</option';
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

                var row = '<option value=\'' + 'nullest' + '\' selected>' + '--- None ---' + '</option>';
                $('#column_id_selector').append(row);

                $.each(data, function(i,j){
                    row = '<option value=\'' + j.id + '\'>' + "Column with ID: " + j.id + '</option>';
                    $('#column_id_selector').append(row);
                });
                $('#column_id_selector').show();
            }
        });
    }
    ShowHide();
});

$('#column_id').change(function(){
    var id_value_string = $(this).val();
    console.log(id_value_string, "id of column chosen");
    if (id_value_string == "") {
        $('#elevator_id_selector option').remove();
        var row = '<option value=\'' + 'nullest' + '\' selected>' + '--- None ---' + '</option';
        $(row).append('#elevator_id_selector');
    } else{
        //Send request and update course dropdown
        $.ajax({
            dataType: 'json',
            cache: false,
            url: '/get_elevator_by_column/' + id_value_string,
            timeout: 5000,
            error: function(XMLHttpRequest, errorTextStatus, error){
                alert('failed to submit: ' + errorTextStatus + ';' + error);
            },
            success: function(data){
                console.log(data, "data");

                $('#elevator_id_selector option').remove();

                var row = '<option value=\'' + 'nullest' + '\' selected>' + '--- None ---' + '</option>';
                $('#elevator_id_selector').append(row);

                $.each(data, function(elevator) {
                    row = '<option value=\'' + data[elevator].id + '\'>' + "Elevator with serial number: " + data[elevator].SerialNumber+ '</option>';
                    $('#elevator_id_selector').append(row);
                });
            }
        });
    }
    ShowHide();
});

function ShowHide(){
    $("#building_id_selector").hide();
    $("#building_id").hide();

    $("#battery_id_selector").hide();
    $("#battery_id").hide();

    $("#column_id_selector").hide();
    $("#column_id").hide();

    $("#elevator_id_selector").hide();
    $("#elevator_id").hide();

    if($("#customer_id_selector").val() != "nulltest"){
        $("#building_id_selector").show();
        $("#building_id").show();

        if($("#building_id_selector").val() != "nulltest"){
            $("#battery_id_selector").show();
            $("#battery_id").show();

            if($("#battery_id_selector").val() != "nulltest"){
                $("#column_id_selector").show();
                $("#column_id").show();

                if($("#column_id_selector").val() != "nulltest"){
                    $("#elevator_id_selector").show();
                    $("#elevator_id").show();
                }
            }
        }
    }
}