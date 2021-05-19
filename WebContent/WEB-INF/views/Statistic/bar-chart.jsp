<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html lang="en">

<head>
	<base href="${pageContext.servletContext.contextPath}/">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title> </title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
	
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawStuff);

      function drawStuff() {
    	var SLDAperYears=<%=request.getAttribute("SLDAperYear") %>;
    	var namofSLDAs=<%=request.getAttribute("namofSLDA") %>;
    	<%-- var AllDoAns=<%=request.getAttribute("AllDoAn") %>; --%>
        var data = new google.visualization.arrayToDataTable([
          ["Đồ án mỗi năm", 'Số lượng']
        ]);
        
        
        for (var i = 0; i < SLDAperYears.length; i ++) {
        	data.Vf[i] = [namofSLDAs[i], SLDAperYears[i]]
        	data.Vf[i] = {
        			c: [
        				{
            				v: namofSLDAs[i]
            			},
            			{
            				v: SLDAperYears[i]
            			}
        			]
        	}
        }
/*         
        console.log(data.Vf) */

        var options = {
          title: 'ĐỒ ÁN TRONG TỪNG NĂM!!!',
          width: 900,
          legend: { position: 'none' },
          chart: { title: 'Năm bao nhiêu, đồ án bấy nhiêu',
                   subtitle: 'Viết đại gì đấy' },
          bars: 'horizontal', // Required for Material Bar Charts.
          axes: {
            x: {
              0: { side: 'top', label: 'Số lượng đồ án'} // Top x-axis.
            }
          },
          bar: { groupWidth: "90%" }
        };

        var chart = new google.charts.Bar(document.getElementById('top_x_div'));
        chart.draw(data, options);
      };
    </script>
	
	
	
</head>

<body id="page-top">
	<div>
	<div id="top_x_div" style="width: 900px; height: 500px;"></div>
	<br/>
	
	
	<%-- <table border="1" class="table table-striped table-bordered" style="font-size: 16px;">
	            <tr style="text-align: center; color: #0096ff">
	            			<th>Mã Da</th>
		                    <th>Tên DA</th>
		                    <th>Chi tiết</th>
		                    <th>Năm</th>
		                    
	            </tr>
            	<c:forEach items="${doAns}" var="doAn">
            		<tr style="text-align: center; font-weight: normal; font-size: 13px">
            			<th>${doAn.getMaDA()}</th>
	                    <th>${doAn.getTenDA()}</th>
	                    <th>${doAn.getChiTiet()}</th>
	                    <th>${doAn.getNam()}</th>
	                    <th>${SLDA}</th>
	                    <td><a href="#">Click</a></td>
	                    
            		</tr>
            	</c:forEach>
            </table> --%>
	</div>
    <!-- Page Wrapper -->
<%--     <div id="wrapper">
        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
                    <div class="row">

                        <div class="col-xl-8 col-lg-7">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Bar Chart</h6>
                                </div>
                                <div class="card-body">
                                    <div class="chart-bar">
                                        <canvas id="myBarChart"></canvas>
                                    </div>
                                    <hr>
                                    Styling for the bar chart can be found in the
                                    <code>resources//js/demo/chart-bar-demo.js</code> file.
                                </div>
                            </div>
                        </div>
                        <!-- Donut Chart -->
                    </div>

                </div>
            </div>
        </div>
        <!-- End of Content Wrapper -->

    </div> --%>
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
    <script src="resources/vendor/jquery/jquery.min.js"></script>
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="resources/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="resources/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="resources/js/demo/chart-area-demo.js"></script>
    <script src="resources/js/demo/chart-pie-demo.js"></script>
    <script src="resources/js/demo/chart-bar-demo.js"></script>

</body>