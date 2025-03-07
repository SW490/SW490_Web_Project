<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<video autoplay muted loop id="myVideo">
  <source src="${contextPath}/resources/motion/rain.mp4" type="video/mp4">
  Your browser does not support HTML5 video.
</video>

<div class="content p-5">
  <h1 class="text-center text-warning">Heading</h1>
  <p class="text-warning">Lorem ipsum dolor sit amet, an his etiam torquatos. Tollit soleat phaedrum te duo, eum cu recteque expetendis neglegentur. Cu mentitum maiestatis persequeris pro, pri ponderum tractatos ei. Id qui nemore latine molestiae, ad mutat oblique delicatissimi pro.</p>
  <div class="d-flex justify-content-center">
  <button id="myBtn" onclick="myFunction()" class="btn btn-outline-warning px-5">Pause</button>
  </div>
  
</div>
<script src="${contextPath}/resources/js/video.js"></script>