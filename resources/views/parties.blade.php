@extends('layouts.master')
@section('header')
    <h2>Lista candidatilor la alegerile pentru europarlamentare 2019</h2>
@stop
@section('content')
    <p>Sunt {{$nr_parties}} partide</p>


    @foreach ($parties as $party)
        <div class="partid">
            <a href="{{ url('partide/'.$party->id) }}">
                <strong>{{ $party->name }}</strong>
            </a>
            <ul>
            @foreach( $party->candidates as $key => $candidate)
                    <li>  <a href="{{ url('candidati/'.$candidate->id) }}"> {{$key+1}}. <em>{{$candidate->lastname}}</em> {{$candidate->firstname}} </a></li>
            @endforeach
            </ul>

        </div>
    @endforeach
@stop