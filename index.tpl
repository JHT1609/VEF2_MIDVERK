<!DOCTYPE HTML>
<html lang="en">
<head>
    <link rel="stylesheet" type="text/css" href="/static/styles.css">
    <meta charset="utf-8">
        <title>Miðannar Verkefni</title>
</head>
<body>

<h1>Bensín or Dísel fyrirtæki á Íslandi</h1>

<div class="wrapper">
    <%
        company = []
        for station in data['results']:
            if station['company'] not in company:
                company.append(station['company'])
            end
        end
        %>
        % for c in company:
            <br>
            <div class="box"> <a href="/company/{{c}}"> {{c}} </a> </div>
        %end

</div>

<%
    min_bensin=min(data['results'], key=lambda x:x['bensin95'])
    min_diesel=min(data['results'], key=lambda x:x['diesel'])
%>

<h2>Ódýrasta bensín:{{min_bensin['bensin95']}} hjá {{min_bensin['company']}} </h2>
<h2>Ódýrasta dísel: {{min_bensin['diesel']}} hjá {{min_diesel['company']}} </h2>


</body>
