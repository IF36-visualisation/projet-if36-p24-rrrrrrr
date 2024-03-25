[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/Fj4cXJY4)

![_e755825b-9a0b-4d9f-8f7b-15b27b2c749c](https://github.com/IF36-visualisation/projet-if36-p24-rrrrrrr/assets/134507615/40029478-7fe4-4bb6-8101-9f2e9bb7f562)

# Analyse des conditions de vie des étudiants
**Proposition projet IF36**

## Introduction
Le projet d'IF36 est pour nous l'occasion d'atudier un domaine qui nous intéresse. Etant nous-mêmes étudiants, quoi de mieux que les conditions de vie des étudiants?
Notre objectif durant cette analyse exploratoire d'un dataset sur ce sujet sera de mettre en avant l'existence ou non de relations entre différents aspects de la vie d'étudiants. Nous couvrirons globalement l'ensemble des pilliers sur lesquels repose la vie typique d'un étudiant: la scolarité, l'éducation, la vie extra-scolaire et les relations privées.

## Données
Notre dataset provient de l'UCI Machine Learning trouvé sur kaggle. [Lien vers le dataset](https://www.kaggle.com/datasets/uciml/student-alcohol-consumption/data)

Il contient 649 observations et 32 variables. Les variables sont de type binaire, numérique et nominal. Ce dataset décrit de manière globale les différentes facette de la vie d'un étudiant (scolaire, extra-scolaire, relation, consommation alcool, milieu familial). Il convient donc à notre utilisation. De plus ce dataset est libre d'utilisation (CC0: Public Domain). Les données ont été obtenues lors d'une enquête auprès des étudiants des cours de mathématiques et de portugais au lycée.

>Information sur le dataset de référence : 
>P. Cortez and A. Silva. Using Data Mining to Predict Secondary School Student Performance. In A. Brito and J. Teixeira Eds., Proceedings of 5th FUture BUsiness TEChnology Conference (FUBUTEC 2008) pp. 5-12, Porto, Portugal, April, 2008, EUROSIS, ISBN 978-9077381-39-7.


**Données brutes du dataset**

- `school` : l'école de l'étudiant (binaire : 'GP' pour Gabriel Pereira ou 'MS' pour Mousinho da Silveira)
- `sex` : sexe de l'étudiant (binaire : 'F' pour femme ou 'M' pour homme)
- `age` : âge de l'étudiant (numérique : de 15 à 22 ans)
- `address` : type d'adresse du domicile de l'étudiant (binaire : 'U' pour urbain ou 'R' pour rural)
- `famsize` : taille de la famille (binaire : 'LE3' pour 3 ou moins ou 'GT3' pour plus de 3)
- `Pstatus` : statut de cohabitation des parents (binaire : 'T' pour vivent ensemble ou 'A' pour séparés)
- `Medu` : niveau d'éducation de la mère (numérique : 0 - aucun, 1 - éducation primaire (4e année), 2 – 5e à 9e année, 3 – éducation secondaire ou 4 – éducation supérieure)
- `Fedu` : niveau d'éducation du père (numérique : 0 - aucun, 1 - éducation primaire (4e année), 2 – 5e à 9e année, 3 – éducation secondaire ou 4 – éducation supérieure)
- `Mjob` : emploi de la mère (nominal : 'teacher', 'health' care related, 'services' civils (par exemple, administratif ou police), 'at_home' ou 'other')
- `Fjob` : emploi du père (nominal : 'teacher', 'health' care related, 'services' civils (par exemple, administratif ou police), 'at_home' ou 'other')
- `reason` : raison de choisir cette école (nominal : proche de 'home', réputation de l'école, préférence de 'course' ou 'other')
- `guardian` : tuteur de l'étudiant (nominal : 'mother', 'father' ou 'other')
- `traveltime` : temps de trajet domicile-école (numérique : 1 - <15 min., 2 - 15 à 30 min., 3 - 30 min. à 1 heure, ou 4 - >1 heure)
- `studytime` : temps d'étude hebdomadaire (numérique : 1 - <2 heures, 2 - 2 à 5 heures, 3 - 5 à 10 heures, ou 4 - >10 heures)
- `failures` : nombre d'échecs aux classes précédentes (numérique : n si 1<=n<3, sinon 4)
- `schoolsup` : soutien éducatif supplémentaire (binaire : oui ou non)
- `famsup` : soutien éducatif familial (binaire : oui ou non)
- `paid` : cours supplémentaires payants dans la matière du cours (Mathématiques ou Portugais) (binaire : oui ou non)
- `activities` : activités extra-scolaires (binaire : oui ou non)
- `nursery` : a fréquenté l'école maternelle (binaire : oui ou non)
- `higher` : souhaite poursuivre une éducation supérieure (binaire : oui ou non)
- `internet` : accès à Internet à domicile (binaire : oui ou non)
- `romantic` : en relation amoureuse (binaire : oui ou non)
- `famrel` : qualité des relations familiales (numérique : de 1 - très mauvais à 5 - excellent)
- `freetime` : temps libre après l'école (numérique : de 1 - très peu à 5 - très élevé)
- `goout` : sorties avec des amis (numérique : de 1 - très peu à 5 - très élevé)
- `Dalc` : consommation d'alcool en semaine (numérique : de 1 - très faible à 5 - très élevé)
- `Walc` : consommation d'alcool le week-end (numérique : de 1 - très faible à 5 - très élevé)
- `health` : état de santé actuel (numérique : de 1 - très mauvais à 5 - très bon)
- `absences` : nombre d'absences scolaires (numérique : de 0 à 93)
- `G1` : note du premier trimestre (numérique : de 0 à 20)
- `G2` : note du deuxième trimestre (numérique : de 0 à 20)
- `G3` : note finale (numérique : de 0 à 20, cible de sortie)

**Regroupement des données :**

### Detail personnel : 
  - Description de l'étudiant : sex, age, adresse
  - Famille : famsize, Pstatus, Medu, Fedu, Mjob, Fjob
  - Santé: health
### Ecole : 
  - Général : school,reason,guardian,traveltime,nursery
  - Cours supplémentaire : schoolsup,famsup,paid
  - Volonté de continuer dans le suppérieur : higher
  - Note : G1,G2,G3 
  - Absences : absences
  - Echec : failures
  - Temps passer à travailler : studytime
### Extrascolaire : 
  - activities,internet,
  - famrel,romantic
  - freetime,goout
### Consommation d'alcool :
  - Dalc,Walc

Le dataset est au format csv.

## Plan d'analyse
Sans écrire la moindre ligne de code, élaborez sur les questions que vous souhaitez vous poser sur les données.
Quelles sont vos interrogations ?
Quelles informations pensez-vous obtenir ?
Quelles variables souhaitez-vous comparer ?
Qu’est-ce qui pourrait poser problème ?
Autrement dit : comment comptez-vous analyser ces données ?

