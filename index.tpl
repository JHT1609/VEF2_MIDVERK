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

    <h1>Veldu fyrirtæki:</h1>
    % for company in company:
        <h2><a href="/company/{{company}}">{{company}}</a></h2>
    % end

    <%
    bensin95disc = []
    for station in data['results']:
        if station['bensin95_discount'] != None:
            bensin95disc.append({'company': station['company'], 'bensin95_discount': station['bensin95_discount']})
        end
    end

    minb95 = min(data['results'], key=lambda x: x['bensin95'])
    minb95disc = min(bensin95disc, key=lambda x: x['bensin95_discount'])
    mind = min(data['results'], key=lambda x: x['diesel'])

    %>

    <h4>Lægsta verð - Bensín 95: {{minb95['bensin95']}}, {{minb95['company']}}</h4>
    <h4>Lægsta verð með afslætti - Bensín 95: {{minb95disc['bensin95_discount']}}, {{minb95disc['company']}}</h4>
    <h4>Lægsta verð - Diesel: {{mind['diesel']}} hjá {{mind['company']}}</h4>



</body>
</html>
