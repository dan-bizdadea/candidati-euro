User id: {{$user_id}} <br/>

    <table>
        <tr>
            <th>Criteriu</th>
            <th>Nota</th>
        </tr>
        @foreach($criteria as $criterion)
            <tr>
                <td>{{$criterion['criterion_name']}}</td>
                <td>

                    <select name="criterion_{{$criterion['criterion_id']}}" data-id="{{$criterion['criterion_id']}}" class="nota">
                        <option value="0">Alege nota</option>
                        <option @if ($criterion['score'] == 1) selected="selected" @endif value="1">1</option>
                        <option @if ($criterion['score'] == 2) selected="selected" @endif value="2">2</option>
                        <option @if ($criterion['score'] == 3) selected="selected" @endif value="3">3</option>
                        <option @if ($criterion['score'] == 4) selected="selected" @endif value="4">4</option>
                        <option @if ($criterion['score'] == 5) selected="selected" @endif value="5">5</option>
                    </select>
                </td>
            </tr>
        @endforeach
    </table>
    <input type="button" name="save" id="save" value="Salveaza"/>

<script type="text/javascript">
    $(document).ready(function() {
       $('#save').on('click', function() {
           var scores = [];
          $('.nota').each(function(e) {
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
              url: '/note/{{$candidate_id}}',
              method: 'post',
              data: 'scores=' + encodeURIComponent(JSON.stringify(scores)),
              success: function(data) {
                  alert("Scoruri salvate");
              }
          });
       });
    });
</script>