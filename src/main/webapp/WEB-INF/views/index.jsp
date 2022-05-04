<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

  <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <meta http-equiv="x-ua-compatible" content="ie=edge">
      <title>Restaurant Finder</title>

      <!-- Font Awesome -->
      <link href="/resources/css/font-awesome.min.css" rel="stylesheet" >

      <!-- Bootstrap core CSS -->
      <link href="/resources/css/bootstrap.min.css" rel="stylesheet">

      <!-- Material Design Bootstrap -->
      <link href="/resources/css/mdb.min.css" rel="stylesheet">

      <!-- Your custom styles (optional) -->
      <link href="/resources/css/style.min.css" rel="stylesheet">
  </head>

  <body>
    <!-- Navbar -->
    <nav class="navbar fixed-top navbar-expand-lg navbar-dark scrolling-navbar">
      <div class="container">

        <!-- Brand -->
        <a class="navbar-brand" href="https://mdbootstrap.com/material-design-for-bootstrap/" target="_blank">
          <strong>Restaurant Finder</strong>
        </a>

      </div>
    </nav>
    <!-- Navbar -->

    <!-- Full Page Intro -->
    <div class="view full-page-intro" style="background-image: url('/resources/image/bg.jpg'); background-repeat: no-repeat; background-size: cover;">

      <!-- Mask & flexbox options-->
      <div class="mask rgba-black-light d-flex justify-content-center align-items-center">

        <!-- Content -->
        <div class="container">

          <!--Grid row-->
          <div class="row wow fadeIn">

            <!--Grid column-->
            <div class="col-md-6 mb-4 white-text text-center text-md-left">

              <h1 class="display-4 font-weight-bold">Restaurant Finder</h1>

              <hr class="hr-light">

              <p>
                <strong>Find the Best Restaurant in Town</strong>
              </p>

            </div>
            <!--Grid column-->

            <!--Grid column-->
            <div class="col-md-6 col-xl-5 mb-4">

              <!--Card-->
              <div class="card">

                <!--Card content-->
                <div class="card-body">

                  <!-- Form -->
                  <form name="" action="result" method="post">
                    <!-- Heading -->
                    <h3 class="dark-grey-text text-center">
                      <strong>Find Near Restaurants</strong>
                    </h3>
                    <hr>

                    <div class="md-form">
                      <i class="fa fa-server prefix grey-text"></i>
                      <input type="text" id="category" class="form-control" name = "category">
                      <label for="category">Category</label>
                    </div>

                    <div class="md-form">
                      <i class="fa fa-map-marker prefix grey-text"></i>
                      <input type="text" id="location" class="form-control" name = "location">
                      <label for="location">Location</label>
                    </div>

                    <div class="text-center">
                      <button class="btn btn-indigo">Find</button>
                    </div>

                  </form>
                  <!-- Form -->
                </div>
              </div>
              <!--/.Card-->
            </div>
            <!--Grid column-->
          </div>
          <!--Grid row-->
        </div>
        <!-- Content -->
      </div>
      <!-- Mask & flexbox options-->
    </div>
    <!-- Full Page Intro -->

    <!-- SCRIPTS -->
    <!-- JQuery -->
    <script type="text/javascript" src="/resources/js/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="/resources/js/popper.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="/resources/js/mdb.min.js"></script>   

  </body>
</html>