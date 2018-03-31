$(document).ready(function() {
	
	//Reset password
	$('#submitButton').click(function() {
		var newPassword = $('#newPasswordInput').val();
		if(!newPassword) {
			$('#modifyPasswordContainer .passwordEmpty').fadeIn();
			return;
		} else if(newPassword.length < 6) {
			$('#modifyPasswordContainer .passwordMinLength').fadeIn();
			return;
		}
		
		if(newPassword != $('#repeatPasswordInput').val()) {
			$('#modifyPasswordContainer .repeatPasswordDifferent').fadeIn();
			return;
		}
		
		$('#submitButton').button('loading');
		$.post(baseUrl + '/op/operater/modifyPassword', { oldPassword: $('#oldPasswordInput').val(), newPassword: newPassword }, function(response) {
			$('#submitButton').button('reset');
			if(response.result) {
				$('#modifyPasswordContainer input[type=password]').val('');
				alert("密码修改成功");
				location.href = baseUrl + '/op/logout';
			} else {
				$('#modifyPasswordContainer .' + response.msg).fadeIn();
			}
		}, 'json');
	});
	
	$('#oldPasswordInput').keyup(function(e) {
		if($('#modifyPasswordContainer .oldPasswordError:visible').length > 0) {
			$('#modifyPasswordContainer .oldPasswordError').fadeOut();
		}
	});

	$('#newPasswordInput').keyup(function(e) {
		if($('#modifyPasswordContainer .passwordEmpty:visible').length > 0 && $('#newPasswordInput').val().length > 0) {
			$('#modifyPasswordContainer .passwordEmpty').fadeOut();
		}
		if($('#modifyPasswordContainer .passwordMinLength:visible').length > 0 && $('#newPasswordInput').val().length >= 6) {
			$('#modifyPasswordContainer .passwordMinLength').fadeOut();
		}
	});
	
	$('#repeatPasswordInput').keyup(function(e) {
		if($('#modifyPasswordContainer .repeatPasswordDifferent:visible').length > 0 && $('#newPasswordInput').val() == $('#repeatPasswordInput').val()) {
			$('#modifyPasswordContainer .repeatPasswordDifferent').fadeOut();
		}
	});
	
});