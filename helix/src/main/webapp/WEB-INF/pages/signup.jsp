<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<style>
* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

.fullscreen-container {
  height: 100vh;
  width: 100vw;
// background-image: url('data:image/svg+xml,%3Csvg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 80 80" width="80" height="80"%3E%3Cpath fill="%239C92AC" fill-opacity="0.4" d="M14 16H9v-2h5V9.87a4 4 0 1 1 2 0V14h5v2h-5v15.95A10 10 0 0 0 23.66 27l-3.46-2 8.2-2.2-2.9 5a12 12 0 0 1-21 0l-2.89-5 8.2 2.2-3.47 2A10 10 0 0 0 14 31.95V16zm40 40h-5v-2h5v-4.13a4 4 0 1 1 2 0V54h5v2h-5v15.95A10 10 0 0 0 63.66 67l-3.47-2 8.2-2.2-2.88 5a12 12 0 0 1-21.02 0l-2.88-5 8.2 2.2-3.47 2A10 10 0 0 0 54 71.95V56zm-39 6a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm40-40a2 2 0 1 1 0-4 2 2 0 0 1 0 4zM15 8a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm40 40a2 2 0 1 0 0-4 2 2 0 0 0 0 4z"%3E%3C/path%3E%3C/svg%3E');
  background-color: #00acee;
  display: flex;
  justify-content: center;
  align-items: center;
}

.container {
  width: 100vw;
  display: flex;
  justify-content: space-around;
  align-items: center;
  padding: 0 10px;
}

.heading h1 {
  color: white;
  font-family: "Open Sans", sans-serif;
  font-size: 2.75rem;
  text-align: center;
}

.heading span {
  color: #FF5252;
  font-size: 4rem;
}

.form-container {
  background: #212122;
  padding: 50px;
  color: white;
  display: flex;
  flex-direction: column;
  gap: 20px;
  width: 100%;
  max-width: 400px;
}

form {
  display: flex;
  flex-direction: column;
  gap: 20px;
}

.input-group {
  display: flex;
  flex-direction: column;
  gap: 10px;
}

.input-group label {
  font-size: .9rem;
  letter-spacing: 1px;
}

.input-group input {
  border: none;
  outline: none;
  padding: 7px;
  font-size: 1rem;
}

.input-group input:focus {
  box-shadow: 0 0 0 3px #FF5252;
}

button {
  padding: 10px;
  margin-top: 20px;
  outline: none;
  border: none;
  font-size: 1rem;
  background: #00acee;
  color: white;
  cursor: pointer;
}

button:focus,
button:hover {
  background: hsl(0, 100%, 76%);
}

@media (max-width: 700px){
  .container {
    flex-direction: column;
    gap: 25px;
  }
}
</style>
</head>
<body>
  <div class="fullscreen-container">
    <div class="container">
        <div class="heading">
          <h1>Create your account</h1>
        </div>

        <div class="form-container">
          <form>
            <div class="input-group">
              <label for="name">Name</label>
              <input type="text" id="signup-name" name="name" placeholder="Fill your Name">
            </div>
            <div class="input-group">
              <label for="email">Email</label>
              <input type="email" id="signup-email" name="email" placeholder="Fill your Email">
            </div>
            <div class="input-group">
              <label for="password">Password</label>
              <input type="Password" id="signup-password" name="Password" placeholder="Fill your Password">
            </div>
          </form>
          <p style="color:red; display:none " id="signup-error"></p>
          <button type="button" id="btn-signup">SIGNUP</button>
        </div>
    </div>
  </div>
  <script>
   function validateSignupForm(){
   var name=$("#signup-name").val();
   var email=$("#signup-email").val();
   var password=$("#signup-password").val();
   var error="";
   //if name is empty
   if(!name)
   {
   error+="Name is empty.";
   }
   if(!email)
   {
   error+="Email is empty.";
   }
   if(!password)
   {
   error+="Password is empty.";
   }
   if(!!password && password.length<3)
   {
   error+="Password length must be greater than 3 characters";
   }
   $("#signup-error").html(error);


   if(error.length>0)
   {
   return false;
   }

   return true;
   }
  $("#btn-signup").click(
  function(){
      var isFormValid= validateSignupForm();
      if(isFormValid)
      {
       $("#signup-error").hide();
       var user = {
       "name" : $("#signup-name").val(),
       "email" : $("#signup-email").val(),
       "password" : $("#signup-password").val()
      }
        $.ajax({
          type: "POST",
          url: "/signup",
          data: JSON.stringify(user),
          success: function(response)
          {
            if(!!response)
            {

            alert(response.message);
            }


          },
          contentType: "application/json"
        })
      }
      else
      {
       $("#signup-error").show();

      }

  });

  </script>
</body>
</html>