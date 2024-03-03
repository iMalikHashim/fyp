import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Report {
  String userId;
  String al;
  String bp;
  String bu;
  String hemo;
  String pot;
  String rbc;
  String rbcc;
  String sc;
  String sg;
  String sod;
  String su;
  String wbcc;

  Report({
    required this.userId,
    required this.al,
    required this.bp,
    required this.bu,
    required this.hemo,
    required this.pot,
    required this.rbc,
    required this.rbcc,
    required this.sc,
    required this.sg,
    required this.sod,
    required this.su,
    required this.wbcc,
  });

  factory Report.fromDocument(DocumentSnapshot doc) {
    return Report(
      userId: doc.id,
      al: doc.get('Al') ?? '',
      bp: doc.get('Bp') ?? '',
      bu: doc.get('Bu') ?? '',
      hemo: doc.get('Hemo') ?? '',
      pot: doc.get('Pot') ?? '',
      rbc: doc.get('Rbc') ?? '',
      rbcc: doc.get('Rbcc') ?? '',
      sc: doc.get('Sc') ?? '',
      sg: doc.get('Sg') ?? '',
      sod: doc.get('Sod') ?? '',
      su: doc.get('Su') ?? '',
      wbcc: doc.get('Wbcc') ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'Al': al,
      'Bp': bp,
      'Bu': bu,
      'Hemo': hemo,
      'Pot': pot,
      'Rbc': rbc,
      'Rbcc': rbcc,
      'Sc': sc,
      'Sg': sg,
      'Sod': sod,
      'Su': su,
      'Wbcc': wbcc,
    };
  }
}

class ReportCard extends StatelessWidget {
  final Report report;

  const ReportCard({required this.report});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('User ID: ${report.userId}'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('AL: ${report.al}'),
            Text('BP: ${report.bp}'),
          ],
        ),
      ),
    );
  }
}

class ReportList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('reports').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }
        final List<Report> reports =
            snapshot.data!.docs.map((doc) => Report.fromDocument(doc)).toList();
        return ListView.builder(
          itemCount: reports.length,
          itemBuilder: (context, index) {
            return ReportCard(report: reports[index]);
          },
        );
      },
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health Reports',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Health Reports'),
        ),
        body: ReportList(),
      ),
    );
  }
}
