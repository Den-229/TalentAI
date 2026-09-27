import 'package:flutter/material.dart';

class Candidate {
  final String id;
  final String name;
  final String role;
  final int matchScore;
  final String experience;
  final List<String> topSkills;
  bool isShortlisted;

  Candidate({
    required this.id,
    required this.name,
    required this.role,
    required this.matchScore,
    required this.experience,
    required this.topSkills,
    this.isShortlisted = false,
  });
}

class TalentPortalScreen extends StatefulWidget {
  const TalentPortalScreen({super.key});

  @override
  State<TalentPortalScreen> createState() => _TalentPortalScreenState();
}

class _TalentPortalScreenState extends State<TalentPortalScreen> {
  bool _isRecruiterMode = true;

  final List<Candidate> _candidates = [
    Candidate(
      id: 'CAND-01',
      name: 'Sophie Martin',
      role: 'Lead FullStack Engineer',
      matchScore: 96,
      experience: '6 ans',
      topSkills: ['Laravel', 'React', 'Docker', 'PostgreSQL'],
    ),
    Candidate(
      id: 'CAND-02',
      name: 'Alexandre Dubois',
      role: 'Architecte Data & AI',
      matchScore: 92,
      experience: '8 ans',
      topSkills: ['Python', 'RAG AI', 'TensorFlow', 'FastAPI'],
    ),
    Candidate(
      id: 'CAND-03',
      name: 'Camille Leroy',
      role: 'UI/UX Mobile Lead',
      matchScore: 89,
      experience: '5 ans',
      topSkills: ['Flutter', 'Figma', 'Design Systems'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: const Color(0xFF8B5CF6),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.psychology, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 8),
            const Text('TalentAI HR Studio', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(_isRecruiterMode ? Icons.business_center : Icons.person, color: const Color(0xFF8B5CF6)),
            onPressed: () {
              setState(() => _isRecruiterMode = !_isRecruiterMode);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Persona Switcher Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF161824),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFF8B5CF6).withValues(alpha: 0.3)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _isRecruiterMode ? 'Mode Recruteur (Pipeline AI)' : 'Mode Candidat (Offres & Match)',
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),
                        ),
                        Text(
                          _isRecruiterMode ? 'Scoring sémantique & CV RAG actif' : 'Recommandations de postes sur mesure',
                          style: const TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF8B5CF6),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: () => setState(() => _isRecruiterMode = !_isRecruiterMode),
                      child: Text(_isRecruiterMode ? 'Vue Candidat' : 'Vue RH'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _isRecruiterMode ? 'Candidats Recommandés par l\'IA' : 'Offres d\'Emploi à Fort Match AI',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const Text('Filtre: Top Score', style: TextStyle(color: Color(0xFF8B5CF6), fontSize: 12, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 12),

              // Candidate List Cards
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _candidates.length,
                itemBuilder: (context, index) {
                  final candidate = _candidates[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF161824),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: Colors.white10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: const Color(0xFF8B5CF6).withValues(alpha: 0.2),
                                  child: Text(candidate.name[0], style: const TextStyle(color: Color(0xFF8B5CF6), fontWeight: FontWeight.bold)),
                                ),
                                const SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(candidate.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white)),
                                    Text('${candidate.role} • ${candidate.experience}', style: const TextStyle(color: Colors.grey, fontSize: 12)),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: const Color(0xFF10B981).withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: const Color(0xFF10B981)),
                              ),
                              child: Text('${candidate.matchScore}% Match', style: const TextStyle(color: Color(0xFF10B981), fontSize: 12, fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),

                        // Skills Badges Row
                        Wrap(
                          spacing: 6,
                          children: candidate.topSkills.map((skill) {
                            return Chip(
                              label: Text(skill, style: const TextStyle(fontSize: 11, color: Colors.white70)),
                              backgroundColor: Colors.white.withValues(alpha: 0.05),
                              padding: EdgeInsets.zero,
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 12),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: Colors.white24),
                                foregroundColor: Colors.white,
                              ),
                              onPressed: () {},
                              icon: const Icon(Icons.description, size: 16),
                              label: const Text('Voir CV RAG'),
                            ),
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: candidate.isShortlisted ? const Color(0xFF10B981) : const Color(0xFF8B5CF6),
                                foregroundColor: Colors.white,
                              ),
                              onPressed: () {
                                setState(() => candidate.isShortlisted = !candidate.isShortlisted);
                              },
                              icon: Icon(candidate.isShortlisted ? Icons.check : Icons.star),
                              label: Text(candidate.isShortlisted ? 'Sélectionné' : 'Présélectionner'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
