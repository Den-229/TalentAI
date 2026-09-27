# TalentAI — Recrutement & Analyse de Compétences par IA

TalentAI structure les CV, extrait les compétences, et effectue un matching sémantique entre candidats et offres d'emploi.

## Architecture
- **Web Next.js/HTML5** : Portal candidats & recruteurs, CV parsing dropzone, Skill gap matrix.
- **Backend Laravel 11 API** : API `/api/v1/`, queues parsing asynchrone, matching.
- **Mobile React Native** : Consultation des offres, suivi des candidatures, recommandation de formations.

## Database Tables
`users`, `candidates`, `recruiters`, `resumes`, `skills`, `job_offers`, `applications`, `matches`, `interviews`, `recommendations`.
