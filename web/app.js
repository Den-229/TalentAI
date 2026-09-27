function parseCV() {
    const res = document.getElementById('parse-res');
    res.style.display = 'block';
    res.innerHTML = '<h4>✔ Compétences Détectées :</h4><p>Laravel (Expert), React (Avancé)<br><strong>Score de Match : 94%</strong></p>';
}
function genQuestions() {
    const q = document.getElementById('questions-res');
    q.style.display = 'block';
    q.innerHTML = '<h4>❓ Question Ciblée sur la lacune Docker :</h4><p>"Pouvez-vous expliquer la différence entre un conteneur et une image Docker, et comment vous gérez la persistance des volumes SQL ?"</p>';
}
