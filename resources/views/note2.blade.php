

<div class="card shadow mb-4 form-group">
    <div class="card-header py-3">
        <h3><em>{{$candidate1->firstname}} {{$candidate1->lastname}}</em> vs <em>{{$candidate2->firstname}} {{$candidate2->lastname}}</em> </h3>
    </div>
    <div class="card-body">
        <table class="table table-striped highlight" align="center">
            <thead>
            <tr>
                <th>Criteriu</th>
                <th>{{$candidate1->firstname}} {{mb_strtoupper($candidate1->lastname)}}</th>
                <th>{{$candidate2->firstname}} {{mb_strtoupper($candidate2->lastname)}}</th>
            </tr>
            </thead>
            <tbody>
            @foreach($criteria1 as $key=>$criterion)
                <tr>
                    <td>{{$criterion['criterion_name']}}</td>
                    <td>
                        <select name="criterion_{{$candidate1->id}}_{{$criterion['criterion_id']}}" id="criterion_{{$candidate1->id}}_{{$criterion['criterion_id']}}" data-id="{{$criterion['criterion_id']}}" class="nota1 form-control select-note">
                            <option value="0">Alege nota</option>
                            <option @if ($criteria1[$key]['score'] == 1) selected="selected" @endif value="1">1</option>
                            <option @if ($criteria1[$key]['score'] == 2) selected="selected" @endif value="2">2</option>
                            <option @if ($criteria1[$key]['score'] == 3) selected="selected" @endif value="3">3</option>
                            <option @if ($criteria1[$key]['score'] == 4) selected="selected" @endif value="4">4</option>
                            <option @if ($criteria1[$key]['score'] == 5) selected="selected" @endif value="5">5</option>
                        </select>
                    </td>
                    <td>
                        <select name="criterion_{{$candidate2->id}}_{{$criterion['criterion_id']}}" id="criterion_{{$candidate2->id}}_{{$criterion['criterion_id']}}" data-id="{{$criterion['criterion_id']}}" class="nota2 form-control select-note">
                            <option value="0">Alege nota</option>
                            <option @if ($criteria2[$key]['score'] == 1) selected="selected" @endif value="1">1</option>
                            <option @if ($criteria2[$key]['score'] == 2) selected="selected" @endif value="2">2</option>
                            <option @if ($criteria2[$key]['score'] == 3) selected="selected" @endif value="3">3</option>
                            <option @if ($criteria2[$key]['score'] == 4) selected="selected" @endif value="4">4</option>
                            <option @if ($criteria2[$key]['score'] == 5) selected="selected" @endif value="5">5</option>
                        </select>
                    </td>
                </tr>
            @endforeach
            </tbody>
        </table>
        </table>
        <a id="compute" class="btn btn-primary btn-icon-split" href="javascript://" data-toggle="modal" data-target="#scores-dialog">
            <span class="icon text-white-50"></span>
            <span class="text">Calculeaza scorul final</span>
        </a>

        <div class="modal fade" tabindex="-1" role="dialog" id="scores-dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Scorul candidatilor</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" id="scor-candidati">
                        <em id="candidat1_name_container"></em> este pe primul loc cu scorul <strong id="candidat1_score_container"></strong>. <br/>
                        <em id="candidat2_name_container"></em> are scorul <strong id="candidat2_score_container"></strong>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Inchide</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>



<script type="text/javascript">
    var candidat1 = '{{$candidate1->firstname}} {{$candidate1->lastname}}';
    var candidat2 = '{{$candidate2->firstname}} {{$candidate2->lastname}}';

    $(document).ready(function() {
        $('#save').on('click', function() {
            var scores = [];
            $('.nota1').each(function(e) {
                var criterion_id = $(this).data('id');
                var note = $(this).val();
                var score = {
                    'criterion_id': criterion_id,
                    'note':note
                };
                scores.push(score);
            });
            $.ajax({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                url: '/note/{{$candidate1->id}}/{{$candidate2->id}}',
                method: 'post',
                data: 'scores=' + encodeURIComponent(JSON.stringify(scores)),
                success: function(data) {
                    alert("Scoruri salvate");
                }
            });
        });

        var score1 = 0;
        var score2 = 0;

        $('#compute').unbind('click').click(function(e) {
            e.preventDefault();
            // save the scores
            var scores = [];
            $('.nota1').each(function(e) {
                var criterion_id = $(this).data('id');
                var note = $(this).val();
                var score = {
                    'criterion_id': criterion_id,
                    'note':note
                };
                scores.push(score);
            });
            $.ajax({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                url: '/note/{{$candidate1->id}}',
                method: 'post',
                data: 'scores=' + encodeURIComponent(JSON.stringify(scores)),
                success: function(data) {
                    //alert("Scoruri salvate");
                }
            });
            var scores = [];
            $('.nota2').each(function(e) {
                var criterion_id = $(this).data('id');
                var note = $(this).val();
                var score = {
                    'criterion_id': criterion_id,
                    'note':note
                };
                scores.push(score);
            });
            $.ajax({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                url: '/note/{{$candidate2->id}}',
                method: 'post',
                data: 'scores=' + encodeURIComponent(JSON.stringify(scores)),
                success: function(data) {
                    //alert("Scoruri salvate");
                }
            });

            // display the result
            var sum = 0;
            var nr = 0;
            $('.nota1').each(function(e) {
                sum += parseInt($(this).val());
                nr++;
            });
            score1 = sum / (nr*1.0);

            sum = 0; nr = 0;
            $('.nota2').each(function() {
                sum += parseInt($(this).val());
                nr++;
            });
            score2 = sum / nr;


           // $('#scor-candidati').html(candidat1 + ': ' + (Math.round(score1*100) / 100) + '<br/>' + candidat2 + ': ' + (Math.round(score2*100)/100));
            var score1 = Math.round(score1*10) / 10;
            var score2 = Math.round(score2*10)/10;
            if (score1 > score2) {
                $('#candidat1_name_container').html(candidat1); $('#candidat2_name_container').html(candidat2);
                $('#candidat1_score_container').html(score1);
                $('#candidat2_score_container').html(score2);
            } else {
                $('#candidat1_name_container').html(candidat2); $('#candidat2_name_container').html(candidat1);
                $('#candidat1_score_container').html(score2);
                $('#candidat2_score_container').html(score1);
            }

        });
    });
</script>