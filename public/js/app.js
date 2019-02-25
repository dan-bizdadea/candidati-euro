
function prepareCompare() {
	$(document).ready(function() {
		$('#partid').empty()
		$.each(parties, function(key, value) {
			$('#partid').append('<option value="' + key     + '">' + value.name + '</option>');
		});

		$('#candidat').empty();
		$.each(parties[0].candidates, function(key, value) {
			$('#candidat').append('<option value="' + value.id + '">' + value.firstname + ' ' + value.lastname + '</option>');
		});

		$('#partid').on('change', function() {
			$('#candidat').empty();
			$.each(parties[$('#partid').val()].candidates, function(key, value) {
				$('#candidat').append('<option value="' + value.id + '">' + value.firstname + ' ' + value.lastname + '</option>');
			});
		});

		$('#candidat').on('change', function() {
			$.ajax({
				url: '/note/'+this.value,
				method: 'get',
				data: '',
				success: function(data) {
					$('#scores').empty().append(data);
				},
				error: function(data) {
					console.log("Eroare");
				}
			});
		})
	})
}