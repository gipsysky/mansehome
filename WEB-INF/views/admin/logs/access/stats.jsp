<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h1>홈페이지 접속통계</h1>

<canvas id="accessPageChart" width="800" height="400"></canvas>
<canvas id="dailyChart" width="400" height="200"></canvas>
<canvas id="monthlyChart" width="400" height="200" style="margin-top:50px;"></canvas>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    $(function(){
        // 일별 데이터
        var dailyLabels = [];
        var dailyData = [];

        <c:forEach items="${dailyStats}" var="row">
        dailyLabels.push('${row.day}');
        dailyData.push(${row.count});
        </c:forEach>

        var dailyCtx = document.getElementById('dailyChart').getContext('2d');
        var dailyChart = new Chart(dailyCtx, {
            type: 'line',
            data: {
                labels: dailyLabels,
                datasets: [{
                    label: '일별 접속 수',
                    data: dailyData,
                    borderColor: 'rgba(75, 192, 192, 1)',
                    fill: false
                }]
            }
        });

        // 월별 데이터
        var monthlyLabels = [];
        var monthlyData = [];

        <c:forEach items="${monthlyStats}" var="row">
        monthlyLabels.push('${row.month}');
        monthlyData.push(${row.count});
        </c:forEach>

        var monthlyCtx = document.getElementById('monthlyChart').getContext('2d');
        var monthlyChart = new Chart(monthlyCtx, {
            type: 'bar',
            data: {
                labels: monthlyLabels,
                datasets: [{
                    label: '월별 접속 수',
                    data: monthlyData,
                    backgroundColor: 'rgba(153, 102, 255, 0.6)'
                }]
            }
        });
    });
</script>


<script>
    // 서버에서 가져온 데이터 준비
    const labels = [
        <c:forEach items="${pageAccessList}" var="item" varStatus="status">
        "<c:out value='${item.url_desc}'/>"<c:if test="${!status.last}">,</c:if>
        </c:forEach>
    ];
    const data = [
        <c:forEach items="${pageAccessList}" var="item" varStatus="status">
        <c:out value="${item.count}"/><c:if test="${!status.last}">,</c:if>
        </c:forEach>
    ];
    const pageUrls = [
        <c:forEach items="${pageAccessList}" var="item" varStatus="status">
        "<c:out value='${item.page_url}' escapeXml='false'/>"<c:if test="${!status.last}">,</c:if>
        </c:forEach>
    ];

    // 차트 그리기
    const ctx = document.getElementById('accessPageChart').getContext('2d');
    const accessChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: labels,
            datasets: [{
                label: '방문 수',
                data: data,
                backgroundColor: 'rgba(54, 162, 235, 0.6)',
                borderColor: 'rgba(54, 162, 235, 1)',
                borderWidth: 1
            }]
        },
        options: {
            indexAxis: 'y', // y축에 페이지 url
            onClick: (event, elements) => {
                if (elements.length > 0) {
                    const index = elements[0].index;
                    const url = pageUrls[index];
                    if (url) {
                        window.open(url, '_blank'); // 새 창으로 열기
                    }
                }
            },
            scales: {
                x: {
                    beginAtZero: true,
                    title: {
                        display: true,
                        text: '방문 수'
                    }
                },
                y: {
                    title: {
                        display: true,
                        text: '페이지 URL'
                    }
                }
            },
            plugins: {
                tooltip: {
                    callbacks: {
                        label: function(context) {
                            return '방문 수: ' + context.formattedValue;
                        }
                    }
                }
            }
        }
    });
</script>
