import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:http/http.dart' as http;

import 'dart:developer' as developer;

Future<List<CountryReport>> fetchCountryData(http.Client client) async {
  final response =
      await client.get('https://api.protikoroni.si/');
  return compute(parseCountryResponse, response.body);
}

List<CountryReport> parseCountryResponse(String responseBody) {
  final data = jsonDecode(responseBody)['data'];
  final parsed = data.cast<Map<String, dynamic>>();
  return parsed
      .map<CountryReport>((json) => CountryReport.fromJson(json))
      .toList();
}

class InfectedPerCountry extends StatelessWidget {
  final List<charts.Series<CountryReport, String>> seriesList;
  final bool animate;

  InfectedPerCountry(this.seriesList, {this.animate});

  // [BarLabelDecorator] will automatically position the label
  // inside the bar if the label will fit. If the label will not fit and the
  // area outside of the bar is larger than the bar, it will draw outside of the
  // bar. Labels can always display inside or outside using [LabelPosition].
  //
  // Text style for inside / outside can be controlled independently by setting
  // [insideLabelStyleSpec] and [outsideLabelStyleSpec].
  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList,
      animate: animate,
      vertical: true,
      // Set a bar label decorator.
      // Example configuring different styles for inside/outside:
      //       barRendererDecorator: new charts.BarLabelDecorator(
      //          insideLabelStyleSpec: new charts.TextStyleSpec(...),
      //          outsideLabelStyleSpec: new charts.TextStyleSpec(...)),
      barRendererDecorator: new charts.BarLabelDecorator<String>(),
      // Hide domain axis.
      domainAxis:
          new charts.OrdinalAxisSpec(renderSpec: new charts.NoneRenderSpec()),
    );
  }
}

class InfectedPerCountryChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CountryReport>>(
      future: fetchCountryData(http.Client()),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);

        List<charts.Series<CountryReport, String>> seriesList = [
          new charts.Series<CountryReport, String>(
              id: 'Države',
              domainFn: (CountryReport report, _) => report.country,
              measureFn: (CountryReport report, _) => report.totalCases,
              data: snapshot.data,
              // Set a label accessor to control the text of the bar label.
              labelAccessorFn: (CountryReport report, _) =>
              '${report.country}: ${report.totalCases.toString()}')
        ];

        return snapshot.hasData
            ? InfectedPerCountry(seriesList)
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}

/// Sample ordinal data type.
class CountryReport {
  final String country;
  final int totalCases;
  final int newCases;
  final int totalDeaths;
  final int newDeaths;
  final int totalRecovered;
  final int activeCases;
  final int seriousCases;

  CountryReport(
      {this.country,
      this.totalCases,
      this.newCases,
      this.totalDeaths,
      this.newDeaths,
      this.totalRecovered,
      this.activeCases,
      this.seriousCases});

  factory CountryReport.fromJson(Map<String, dynamic> json) {
    return CountryReport(
      country: json['country'] as String,
      totalCases: json['total_cases'] as int,
      newCases: json['new_cases'] as int,
      totalDeaths: json['total_deaths'] as int,
      newDeaths: json['new_deaths'] as int,
      totalRecovered: json['total_recovered'] as int,
      activeCases: json['active_cases'] as int,
      seriousCases: json['serious_cases'] as int,
    );
  }
}
