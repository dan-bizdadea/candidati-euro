<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

use Illuminate\Http\Request;

Route::get('/', function () {
    $candidates = App\Candidate::all();
    $nr_candidates = count($candidates);
    return view('candidati')->with(array('candidates' => $candidates, 'nr_candidates' => $nr_candidates));
});


Route::get('/parties', function () {
    $parties = App\Party::all();
    $nr_parties = count($parties);
    return view('parties')->with(array('parties' => $parties, 'nr_parties' => $nr_parties));
});

Route::get('/compare', function () {
    $parties = App\Party::all();
    $nr_parties = count($parties);
    $criteria = App\Criterion::all();
    return view('compare')->with(array('parties' => $parties, 'parties_json' => $parties->toJson(), 'nr_parties' => $nr_parties, 'criteria'=>$criteria));
});

Route::get('/note/{candidate_id}', function ($candidate_id) {
    $user_id = session('user_id');
    if (!$user_id) {
        $name = uniqid();
        $email = $name.'@test.com';
        $password = 'pass';
        $user = new App\User(array('name'=>$name, 'email' => $email, 'password'=>$password));
        $user->save();
        $user_id = $user->getAttribute('id');
        session(['user_id' => $user_id]);
    }


    $criteria = App\Criterion::all();
    $candidateScores = App\CandidateScore::where('user_id', $user_id)->where('candidate_id', $candidate_id)->get();

    $criteria_scores = array();

    if (count($candidateScores->toArray())) {
        foreach ($candidateScores as $score) {
            foreach ($criteria as $criterion) {
                if ($score->criterion_id == $criterion->id) {
                    $criteria_score['criterion_name'] = $criterion->getAttribute('name');
                    $criteria_score['criterion_id'] = $criterion->getAttribute('id');
                    $criteria_score['score'] = $score->getAttribute('score');
                    $criteria_scores[] = $criteria_score;
                }
            }
        }
    } else {
        foreach ($criteria as $criterion) {
            $criteria_score['criterion_name'] = $criterion->getAttribute('name');
            $criteria_score['criterion_id'] = $criterion->getAttribute('id');
            $criteria_score['score'] = 0;
            $criteria_scores[] = $criteria_score;
        }
    }
    return view('note')->with(array('criteria'=>$criteria_scores, 'user_id' => $user_id, 'candidate_id' => $candidate_id));
});

Route::post('/note/{candidate_id}', function(Request $request, $candidate_id) {
    $user_id = session('user_id');
    $scores = json_decode($request->post('scores'), true);

    foreach ($scores as $score) {
        $candidateScore = App\CandidateScore::where('user_id', $user_id)->where('candidate_id', $candidate_id)->where('criterion_id', $score['criterion_id'])->first();
        if (!$candidateScore) {
            $candidateScore = new App\CandidateScore();
        }
        $candidateScore->setAttribute('user_id', $user_id);
        $candidateScore->setAttribute('candidate_id', $candidate_id);
        $candidateScore->setAttribute('criterion_id', $score['criterion_id']);
        $candidateScore->setAttribute('score', $score['note']);
        $candidateScore->save();
    }
});

