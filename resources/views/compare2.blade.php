@extends('layouts.master')

@section('header_includes')
    <script type="text/javascript">
        var parties = [
                @foreach($parties as $party)
            {'id':'{{$party->id}}','name': '{{$party->name}}', 'candidates': [
                        @foreach($party->candidates as $candidate)
                    {'id':'{{$candidate->id}}', 'firstname':'{{$candidate->firstname}}', 'lastname':'{{$candidate->lastname}}'},
                    @endforeach
                ]},
            @endforeach
        ];

        var criteria = [
                @foreach($criteria as $criterion)
            {'name':'{{$criterion->name}}'},
            @endforeach
        ];
        $(document).ready(function(){prepareCompare2()});
    </script>
    <script type="text/javascript" src="js/app.js"></script>
@stop

@section('header')
    <h2>Comparator candidati</h2>
@stop
@section('content')
    <div class="container-fluid">
        <div class="row">
            <div class="col-xl-4">
                <div class="card shadow mb-4 form-group">
                    <div class="card-header py-3">
                        <h3> Alegere candidati </h3>
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <span>Alege primul candidat</span>
                            <select name="partid1" id="partid1" class="form-control select-cls"></select>
                            <select name="candidat1" id="candidat1" class="form-control select-cls"></select>
                            <br/>
                            <span>Alege cel de-al doilea candidat</span>
                            <select name="partid2" id="partid2" class="form-control select-cls"></select>
                            <select name="candidat2" id="candidat2" class="form-control select-cls"></select>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-8">
                <div id="scores"></div>
            </div>
        </div>
    </div>







    <script type="text/javascript">

        function prepareCompare2() {
            $(document).ready(function() {
                $('#partid1').empty()
                $('#partid1').append('<option value="0">Alege partidul</option>');
                $.each(parties, function(key, value) {
                    $('#partid1').append('<option value="' + key     + '">' + value.name + '</option>');
                });

                $('#candidat1').empty();
                $('#candidat1').append('<option value="0">Alege primul candidat</option>');

                $('#partid1').on('change', function() {
                    $('#candidat1').empty();
                    $('#candidat1').append('<option value="0">Alege primul candidat</option>');
                    $.each(parties[$('#partid1').val()].candidates, function(key, value) {
                        $('#candidat1').append('<option value="' + value.id + '">' + value.firstname + ' ' + value.lastname + '</option>');
                    });
                });

                $('#candidat1').on('change', function() {
                   if (validSelectForm()) {
                       showScoresForm();
                   }
                });

                $('#candidat2').on('change', function(){
                   if (validSelectForm()) {
                       showScoresForm();
                   }
                });

                $('#compare').on('click', showScoresForm);

                $('#partid2').empty()
                $('#partid2').append('<option value="0">Alege partidul</option>');
                $.each(parties, function(key, value) {
                    $('#partid2').append('<option value="' + key     + '">' + value.name + '</option>');
                });

                $('#candidat2').empty();
                $('#candidat2').append('<option value="0">Alege al doilea candidat</option>');


                $('#partid2').on('change', function() {
                    $('#candidat2').empty();
                    $('#candidat2').append('<option value="0">Alege al doilea candidat</option>');
                    $.each(parties[$('#partid2').val()].candidates, function(key, value) {
                        $('#candidat2').append('<option value="' + value.id + '">' + value.firstname + ' ' + value.lastname + '</option>');
                    });
                });

            })
        }

        function validSelectForm() {
            if ($('#candidat1').val() == 0 || $('#candidat2').val() == 0) {
                return false;
            }

            if ($('#candidat1').val() == $('#candidat2').val()) {
                return false;
            }
            return true;
        }

        function showScoresForm() {
            if (!validSelectForm()){
                return false;
            }
            $.ajax({
                url: '/note2/'+$('#candidat1').val() + '/' + $('#candidat2').val(),
                method: 'get',
                data: '',
                success: function(data) {
                    $('#scores').empty().append(data);
                },
                error: function(data) {
                    console.log("Eroare");
                }
            });
        }


    </script>

@stop
