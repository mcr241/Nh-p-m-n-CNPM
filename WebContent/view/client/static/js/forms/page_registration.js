var Registration = function () {

    return {
        
        //Registration Form
        initRegistration: function () {
	        // Validation       
	        $("#sky-form4").validate({                   
	            // Rules for form validation
	            rules:
	            {
	                username:
	                {
	                    required: true
	                },
	                email:
	                {
	                    required: true,
	                    email: true
	                },
	                password:
	                {
	                    required: true,
	                    minlength: 3,
	                    maxlength: 20
	                },
	                passwordConfirm:
	                {
	                    required: true,
	                    minlength: 3,
	                    maxlength: 20,
	                    equalTo: '#password'
	                },
	                firstname:
	                {
	                    required: true
	                },
	                lastname:
	                {
	                    required: true
	                },
	                terms:
	                {
	                    required: true
	                }
	            },
	            
	            // Messages for form validation
	            messages:
	            {
	                login:
	                {
	                    required: 'Nhập tài khoản của bạn'
	                },
	                email:
	                {
	                    required: 'Nhập email của bạn',
	                    email: 'Hãy nhập một email hợp lệ'
	                },
	                password:
	                {
	                    required: 'Nhập mật khẩu của bạn'
	                },
	                passwordConfirm:
	                {
	                    required: 'Nhập lại mật khẩu của bạn',
	                    equalTo: 'Nhập lại mật khẩu của bạn'
	                },
	                firstname:
	                {
	                    required: 'Hãy nhập tên của bạn'
	                },
	                lastname:
	                {
	                    required: 'Hãy nhập họ của bạn'
	                },
	                terms:
	                {
	                    required: 'Bạn phải đồng ý điều khoản để tiếp tục!'
	                }
	            },                  
	            
	            // Do not change code below
	            errorPlacement: function(error, element)
	            {
	                error.insertAfter(element.parent());
	            }
	        });
        }

    };
}();