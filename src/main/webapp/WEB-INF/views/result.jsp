<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

      <!-- DataTables CSS -->
      <link href="/resources/css/dataTables.bootstrap.min.css" rel="stylesheet">
      <link href="/resources/css/jquery.dataTables.min.css" rel="stylesheet">

      <!-- Material Design Bootstrap -->
      <link href="/resources/css/mdb.min.css" rel="stylesheet">

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

    <br><br><br><br>
    <main>
    <div class="container">
      <!--Section: Main features & Quick Start-->
      <section>

        <h3 class="h3 text-center mb-5">Restaurant Finder</h3><br>

        <!-- Form -->
        <form name="" action="result" method="post">
          
          <div class = "row">
            <div class="col-12">
              <h3 class="dark-grey-text">
                <strong>Find Another Category and Location</strong>
              </h3>
            </div>

            <div id="map_canvas"></div>
          
            <div class="col-5">
              <div class="md-form">
                <i class="fa fa-server prefix grey-text"></i>
                <input type="text" id="category" class="form-control" name = "category">
                <label for="category">Category</label>
              </div>
            </div>

            <div class="col-5">
              <div class="md-form">
                <i class="fa fa-map-marker prefix grey-text"></i>
                <input type="text" id="location" class="form-control" name = "location">
                <label for="location">Location</label>
              </div>
            </div>

            <div class="col-2">
              <div class="text-center">
                <button class="btn btn-indigo">Find</button>
              </div>
            </div>
          </div>

        </form>
        <!-- Form -->
        <br>
        <br>

        <h3 class="dark-grey-text">
                <strong>Results for ${category} category near ${location}</strong>
        </h3>
        <!--First row-->
        <div class="row">
          <div class="col-12">
            <table id = "result" class = "table table-striped table-bordered" cellspacing="0">
              <thead>
                <th>Image</th>
                <th width = "25%">Details</th>
                <th>Rating</th>
                <th>Review Count</th>
                <th width = "25%">Address & Phone</th>
              </thead>
              <tfoot>
                
              </tfoot>
              <tbody>

                <c:forEach var = "rest" items = "${restaurants}" varStatus = "loop">
                  <tr>
                    <td align = "center"><img src = '${rest.getImageUrl()}' class = "img-result"/></td>

                    <td><strong>${rest.getName()}</strong>
                        <br><br>
                        <strong><i class="fa fa-calculator prefix grey-text"></i> Price</strong>
                        <c:choose>
                          <c:when test = '${!rest.getPrice().equals("")}'>
                            <br>${rest.getPrice()}
                          </c:when>
                          <c:otherwise>
                            <br>-
                          </c:otherwise>
                        </c:choose>

                        <c:if test = '${rest.getCategories().size() > 0}'>
                          <br><br>
                          <strong><i class="fa fa-server prefix grey-text"></i> Categories</strong><br>
                          <c:forEach var = "ctg" items = "${rest.getCategories()}" varStatus = "loops">
                            - ${ctg} <br>
                          </c:forEach>
                        </c:if>
                    </td>

                    <td><i class="fa fa-star prefix grey-text"></i> 
                        ${rest.getRating()}
                    </td>

                    <td>${rest.getReviewCount()}</td>

                    <td>
                        <strong><i class="fa fa-building prefix grey-text"></i> Address<br></strong>
                        <c:forEach var = "addr" items = "${rest.getAddresses()}">
                          ${addr}<br>
                        </c:forEach>

                        <br>
                        <strong><i class="fa fa-phone prefix grey-text"></i> Phone<br></strong>
                        ${rest.getPhone()}
                    </td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
        <!--/First row-->
      </section>
      <!--Section: Main features & Quick Start-->
    </div>
  </main>

  <footer class="page-footer text-center font-small mt-4 wow fadeIn">
    <!--Copyright-->
    <div class="footer-copyright py-3">
      &copy; 2018 Copyright:
      <a href="https://mdbootstrap.com/bootstrap-tutorial/" target="_blank"> MDBootstrap.com </a>
    </div>
    <!--/.Copyright-->
  </footer>
  <!--/.Footer-->

  <!-- SCRIPTS -->
  <!-- JQuery -->
  <script type="text/javascript" src="/resources/js/jquery-3.3.1.min.js"></script>
  <script type="text/javascript" src="/resources/js/jquery.dataTables.min.js"></script>

  <!-- Bootstrap tooltips -->
  <script type="text/javascript" src="/resources/js/popper.min.js"></script>

  <!-- Bootstrap core JavaScript -->
  <script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>

  <!-- DataTables JavaScript -->
  <script type="text/javascript" src="/resources/js/dataTables.bootstrap.min.js"></script>
  
  <!-- MDB core JavaScript -->
  <script type="text/javascript" src="/resources/js/mdb.min.js"></script>

  <script type="text/javascript" src="/resources/js/app.js"></script>
  
  </body>
</html>