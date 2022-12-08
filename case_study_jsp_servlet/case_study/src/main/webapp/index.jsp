<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 12/6/2022
  Time: 10:50 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Furama Resort Danang</title>
  <link rel="stylesheet" href="../css/bootstrap.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
<div>
  <!--Header-->
  <div class="row container-fluid" style="background-color: #fdfdfe; padding: 0">
    <div class="col-lg-3">
      <img src="https://furamavietnam.com/wp-content/uploads/2018/08/logo@2x.png"
           style="width: 100px; margin-left: 70px">
    </div>
    <div class="col-lg-9 pt-5">
      <div class="row">
        <div class="info col-lg-5">
          <p style="text-align: center; color: #1e2125 ">
            103-105 Đường Võ Nguyên Giáp,
            Phường Khuê Mỹ, Quận Ngũ Hành Sơn, Tp.
            Đà Nẵng, Việt Nam
            7.0 km từ Sân bay Quốc Tế Đà Nẵng
          </p>
        </div>
        <div class="col-lg-5">
          <p style="text-align: center; color: #1e2125">
            84-236-3847 333/888
            <br>
            reservation@furamavietnam.com
          </p>
        </div>
        <div class="col-lg-2">
          <p style="color: #1e2125">Lu Xinhhh</p>
        </div>
      </div>
    </div>
  </div>

  <!--    Navbar-->
  <div class="row sticky-top" style="background: #046056; height: 60px; text-align: center">
    <nav class="navbar navbar-expand-lg" style="background: #046056">
      <div class="collapse navbar-collapse container-fluid" id="navbarNavAltMarkup">
        <div class="col-lg-1"></div>
        <div class="navbar-nav col-lg-8">
          <!--DropDowns-->
          <div>
            <button type="button" class="btn btn-close-white">
              <a href="/index.jsp">Home</a>
            </button>
          </div>
          <!--DropDowns2-->
          <div class="btn-group" style="margin-left: 30px">
            <button type="button" class="btn btn-close-white">
              <a href="/employee">Employee</a>
            </button>
          </div>
          <div class="btn-group" style="margin-left: 30px">
            <button type="button" class="btn btn-close-white">
              <a href="/customer">Customer</a>
            </button>
          </div>
          <div class="btn-group" style="margin-left: 30px">
            <button type="button" class="btn btn-close-white">
              <a href="/facility">Service</a>
            </button>
          </div>
          <div class="btn-group" style="margin-left: 30px">
            <button type="button" class="btn btn-close-white">
              <a href="/contract">Contract</a>
            </button>
          </div>
        </div>
        <div class="col-lg-3">
          <form class="d-flex">
            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success text-white" type="submit">Search</button>
          </form>
        </div>
      </div>
    </nav>
  </div>
  <div class="row" style="height: 90%; margin-top: 5%">
    <div class="col-md-12">
      <div class="row">
        <img src="https://media.baodautu.vn/Images/ngoctan/2017/08/29/Furama_Resort_Danang_-_Ocean_Pool_2.JPG">
      </div>
    </div>
  </div>

  <!--    Footer-->
  <div class="row" style="background: #046056">
    <div class="col-lg-2">
    </div>
    <div class="col-lg-3" style="background-color: #fdfdfe; color: black">
      <h2 style="color: #cbbe73; font-family: 'Al Nile'; margin-top: 30px; margin-left: 30px ">
        How to Get to Us
      </h2>
      <p style="font-family: Times New Roman; margin-left: 30px">
        Furama is a premier base for exploring one of Asia's most exciting new destinations.
        Just a short drive from Danang lay four UNESCO-listed World Heritage Sites
      </p>
      <h4 style="color: #cbbe73; font-family: 'Al Nile'; margin-top: 30px; margin-left: 30px ">
        Local Places
      </h4>
      <ol style="color: black; font-family: Times New Roman">
        <li>The former imperial city of HUE 2 hours</li>
        <li>The ancient Hoi An 30 minutes</li>
        <li>Champa civilization, My Son 90 minutes</li>
        <li>Phong Nha Caves 3 hours</li>
      </ol>
    </div>
    <div class="col-lg-3" style="margin-top: 30px">
      <ul style="color: darkgray">
        <li><a style="color: white" href="https://furamavietnam.com/activities/">New</a></li>
        <li style="margin-top: 10px"><a style="color: white"
                                        href="https://furamavietnam.com/furama-resort-danang-rack-rate/"> Rack
          Rate</a></li>
        <li style="margin-top: 10px"><a style="color: white" href="https://furamavietnam.com/lifestyle-blog/">Lifestyle
          Blog</a></li>
        <li style="margin-top: 10px"><a style="color: white" href="https://furamavietnam.com/work-with-us/">Work
          with us</a></li>
        <li style="margin-top: 10px"><a style="color: white" href="https://furamavietnam.com/contact/"> Contact
          us</a></li>
      </ul>
      <img style="margin-top: 200px"
           src="https://furamavietnam.com/wp-content/uploads/2019/02/Ariyana-Tourism-Complex-02-2.png"
           alt="Ariyana Tourism Complex" width="500px;"></div>
    <div class="col-lg-4">
      <h5 style="color: #cbbe73"> Contact US</h5>
      <p style="color: darkgray; margin: 40px">103 - 105 Vo Nguyen Giap Street, Khue My Ward, Ngu Hanh Son
        District, Danang City, Vietnam
        Tel.: 84-236-3847 333/888 * Fax: 84-236-3847 666
        Email: reservation@furamavietnam.com * www.furamavietnam.com GDS Codes: Amadeus-GD DADFUR,
        Galileo/Apollo-GD 16236, Sabre-GD 032771, Worldspan- GD DADFU</p>
    </div>
  </div>
</div>
</div>
<script src="../js/bootstrap.js"></script>
</body>
</html>
