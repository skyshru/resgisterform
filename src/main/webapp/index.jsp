<html>
<head>

    <title>
        Signup
    </title>
    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>


</head>
<body style="background: url(Images/cherry.jpg); background-size:cover; background-attachment:fixed;">
<div class= "container ">
    <!---it will be used to center the content --->
    <div class="row">
        <div class= "col m6 offset-m3">
            <div class="card z-depth-3"> <!-- Added z-depth-3 for shadow -->
                <div class="card-content "  >

                    <div class="form center-align" >

                        <h2>Register Here</h2>
                        <h5 id="msg_success" style="display:none" class="center-align green">Successfully Registered!!</h5>
                        <h5 id="msg_fail" style="display:none" class="center-align red">An Error Occurred</h5>
                        <form action="Register" method="post" id="myform" >
                            <input type="text" placeholder="Enter your name" name="name1">
                            <input type="password" placeholder="Enter your password" name="password1">
                            <input type="email" placeholder="Enter your email" name="email1">

                            <button type="submit" class="btn pink accent-2" > Submit </button>

                        </form>
                    </div>

                    <div class="loader" style="display:none">

                        <!--- display none means by default it will be hidden-->
                        <div class="progress">
                            <div class="indeterminate"></div>
                        </div>

                        <h4> Please wait...</h4>

                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

    <script
        src="https://code.jquery.com/jquery-3.7.1.min.js"
        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
        crossorigin="anonymous">

    </script>

    <script>
        $(document).ready(function () {
            console.log("page is ready...");

            $("#myform").on('submit', function (event){
            /// form ko dosre page yani servlet pr jane se rok rhe hein
                event.preventDefault();
            //by default jo behaviour hai usko rok deta hai

                var f= $(this).serialize();
                //poore form ko string mei convert krdenge key value pair ki form mei store krdenge

                console.log(f);

                //we want that as soon as we submit (just before the request goes throgh ajax, the form dissapears and the loader shows up
                $(".loader").show();
                $(".form").hide();


                //now we will pass value to the servlet

                $.ajax({
                url: "Register",
                data: f,
                type: 'POST',

                success: function (data,textStatus, jqXHR) {
                        console.log(data);
                        console.log("sucess.......;")

                         $(".loader").hide();
                         $(".form").show();
                         $("#msg_success").show();
                                                           },

                error: function ( jqXHR, textStatus, errorThrown) {
                        console.log(data);
                        console.log("error.......;")

                        $(".loader").hide();
                        $(".form").show();
                        $("#msg_fail").hide();
                                                                 }


                })

            })
        })
    </script>


</body>
</html>
