import 'package:flutter/material.dart';

class ChallangeTeam extends StatefulWidget {
  const ChallangeTeam({super.key});

  @override
  State<ChallangeTeam> createState() => _ChallangeTeamState();
}

class _ChallangeTeamState extends State<ChallangeTeam> {
  int _teamAPoints = 0;
  int _teamBPoints = 0;

  static const Color _primaryCoral = Color(0xFFEB5346);
  static const Color _textColor = Color(0xFF2C3E50);

  void _addPointsTeamA(int points) {
    setState(() {
      _teamAPoints += points;
    });
  }

  void _addPointsTeamB(int points) {
    setState(() {
      _teamBPoints += points;
    });
  }

  void _resetPoints() {
    setState(() {
      _teamAPoints = 0;
      _teamBPoints = 0;
    });
  }

  Widget _buildTeamColumn({
    required String teamName,
    required int score,
    required void Function(int) onAddPoints,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          teamName,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: _textColor,
          ),
        ),
        Text(
          '$score',
          style: const TextStyle(
            fontSize: 140,
            fontWeight: FontWeight.w300,
            color: _textColor,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: () => onAddPoints(1),
          style: ElevatedButton.styleFrom(
            backgroundColor: _primaryCoral,
            foregroundColor: Colors.white,
            fixedSize: const Size(140, 42),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 0,
          ),
          child: const Text(
            'Add 1 Point',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: () => onAddPoints(2),
          style: ElevatedButton.styleFrom(
            backgroundColor: _primaryCoral,
            foregroundColor: Colors.white,
            fixedSize: const Size(140, 42),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 0,
          ),
          child: const Text(
            'Add 2 Point',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: () => onAddPoints(3),
          style: ElevatedButton.styleFrom(
            backgroundColor: _primaryCoral,
            foregroundColor: Colors.white,
            fixedSize: const Size(140, 42),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 0,
          ),
          child: const Text(
            'Add 3 Point',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: _primaryCoral,
        centerTitle: true,
        title: const Text(
          'BasketBall',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 32),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildTeamColumn(
                  teamName: 'Team A',
                  score: _teamAPoints,
                  onAddPoints: _addPointsTeamA,
                ),
                const VerticalDivider(
                  color: Color(0xFFB0BEC5),
                  thickness: 1.2,
                  indent: 10,
                  endIndent: 10,
                ),
                _buildTeamColumn(
                  teamName: 'Team B',
                  score: _teamBPoints,
                  onAddPoints: _addPointsTeamB,
                ),
              ],
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: _resetPoints,
            style: ElevatedButton.styleFrom(
              backgroundColor: _primaryCoral,
              foregroundColor: Colors.white,
              fixedSize: const Size(120, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 0,
            ),
            child: const Text(
              'Reset',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 48),
        ],
      ),
    );
  }
}
