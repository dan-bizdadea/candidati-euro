@extends('layouts.master')
@section('header')
    <h2>About this site</h2>
@stop
@section('content')
    <p>There are over {{$nr_candidates}}on this site!</p>


    @foreach ($candidates as $candidate)
        <div class="cat">
            <a href="{{ url('cats/'.$candidate->id) }}">
                <strong>{{ $candidate->firstname }} {{ $candidate->lastname }}</strong> - {{ $candidate->party->name}}
            </a>
        </div>
    @endforeach
@stop