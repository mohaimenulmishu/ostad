import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_score/models/score_model.dart';
import 'package:firebase_score/views/screens/score_details.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<ScoreModel> scoreList = [];
  final Stream<QuerySnapshot> _footballScore =
      FirebaseFirestore.instance.collection('football_score').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Match List'),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: _footballScore,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            if (snapshot.hasData) {
              scoreList.clear();
              for (var score in snapshot.data!.docs) {
                scoreList.add(ScoreModel(
                  id: score.id,
                  teamAName: score.get('teamAName'),
                  teamBName: score.get('teamBName'),
                  teamAScore: score.get('teamAScore'),
                  teamBScore: score.get('teamBScore'),
                  totalTime: double.parse(score.get('totalTime').toString()),
                  spendTime: double.parse(score.get('spendTime').toString()),
                ));
              }
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: scoreList.length,
                  itemBuilder: (context, index) => Card(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ScoreDetails(score: scoreList[index]),
                          ),
                        );
                      },
                      title: Text(
                        '${scoreList[index].teamAName} vs ${scoreList[index].teamBName}',
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      trailing: const Icon(Icons.arrow_forward),
                    ),
                  ),
                ),
              );
            }
            return const Center(
              child: Text('There is nothing to show'),
            );
          }),
    );
  }
}
