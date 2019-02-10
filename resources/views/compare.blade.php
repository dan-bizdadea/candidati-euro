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
    </script>
    <script type="text/javascript" src="js/app.js"></script>
@stop

@section('header')
    <h2>Lista candidatilor la alegerile pentru europarlamentare 2019</h2>
@stop
@section('content')
    <p>Sunt {{$nr_parties}} partide</p>


    <label for="partid">Selecteaza partid</label>
    <select name="partid" id="partid">
    </select>

    <label for="candidat">Selecteaza candidat</label>
    <select name="candidat" id="candidat">
    </select>
    <br/>

    <div id="scores"></div>

@stop