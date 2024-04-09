[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/Fj4cXJY4)

![_e755825b-9a0b-4d9f-8f7b-15b27b2c749c](https://github.com/IF36-visualisation/projet-if36-p24-rrrrrrr/assets/134507615/40029478-7fe4-4bb6-8101-9f2e9bb7f562)

illustration générée à l'aide de Copilot

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


### Données brutes du dataset

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

### Regroupement des données :
#### Detail personnel :
  - Description de l'étudiant : sex, age, adresse
  - Famille : famsize, Pstatus, Medu, Fedu, Mjob, Fjob
  - Santé: health
#### Ecole : 
  - Général : school,reason,guardian,traveltime,nursery
  - Cours supplémentaire : schoolsup,famsup,paid
  - Volonté de continuer dans le suppérieur : higher
  - Note : G1,G2,G3 
  - Absences : absences
  - Echec : failures
  - Temps passer à travailler : studytime
#### Extrascolaire : 
  - activities,internet,
  - famrel,romantic
  - freetime,goout
#### Consommation d'alcool :
  - Dalc,Walc

Le dataset est au format csv.

## Plan d'analyse
Maintenant que nous avons à notre disposition une grande source de données sur la vie des étudiants, il fallait que l’on se pose les bonnes interrogations pour essayer de lier certaines de ces données.   

Et justement, en tant qu’étudiants, on a tous eu ces grandes questions qui n’ont jamais connu de réponses. Ces questions qui ont toujours semblé vraies ou parfois fausses mais qui n’ont jamais eu de finalité.   
Faire du sport permet-il vraiment d’avoir de meilleurs résultats scolaires ?   
Les geeks sont-vraiments meilleurs en maths ?   
Les fêtards sont-ils plus heureux que les autres ?   

C’est ainsi que nous avons élaboré une liste de questions auxquelles nous allons essayer de répondre à l'aide du dataset.   

Les questions étant les suivantes :   
- Faire du sport permet-il vraiment d’avoir de meilleurs résultats scolaires ?   
- Les geeks sont-vraiments meilleurs en maths ?   
- Les fêtards sont-ils plus heureux que les autres ?
- La taille de la famille au foyer influe-t-elle sur les résultats scolaires ?
- Le fait de sortir souvent avec des amis entraîne-t-il nécessairement une plus grande consommation d'alcool ?
- Y-a-t-il un lien entre la consommation d'alcool et l'échec scolaire, l'absentéisme ?
- De manière générale, lesquels des hommes ou des femmes ont de meilleurs résultats scolaires ?
- Les hommes sont-ils plus fétards que les femmes ? Ou est-ce l'inverse ?
- Avoir une mère au foyer pousse-t-il à avoir de bons résultats scolaires ?
- Habiter loin de son lieu d'apprentissage réduit-il la fréquence de sorties avec des amis ?
- Le niveau d'éducation des parents pousse-t-il les enfants à avoir de bons résultats scolaires ?


### Mais comment pourrait-on essayer de répondre à nos interrogations ?  
   
Par exemple pour la question suivante : Faire du sport permet-il vraiment d’avoir de meilleurs résultats scolaires ?  

On peut tout d'abord identifier les sportifs comme ceux ayant un niveau de santé supérieur ou égal à 3/5 et prenant part à des activités extra scolaires.  
   
![image](https://github.com/IF36-visualisation/projet-if36-p24-rrrrrrr/assets/147445740/77a7aa27-4d43-443c-a6ee-fdf7e64d7986)


Ensuite, nous avons les résultats scolaires de chacun des étudiants à chaque période et au final, on peut donc en calculer une moyenne.   
   
![image](https://github.com/IF36-visualisation/projet-if36-p24-rrrrrrr/assets/147445740/f3058a2a-b10f-4d23-b539-5656e035bbb3)

Enfin, maintenant que nous avons nos catégories, on peut comparer directement les résultats scolaires des étudiants et leur sportivité pour savoir s'il y a réellement une corrélation.   

Pour cette question-ci, avant analyse et par expérience étudiante, il nous semble que les sportifs sont généralement meilleurs.   
Suite à l'étude de notre dataset on pourra donc déterminer avec certitude si nos ressentis ont été bons ou bien si nous-nous sommes trompés.   
   
### Quels sont les résultats auxquels on s'attend ?   

- Faire du sport permet-il vraiment d’avoir de meilleurs résultats scolaires ?   
*Oui, c'est les boss !*   
- Les geeks sont-vraiments meilleurs en maths ?   
*Non, c'est les sportifs*   
- Les fêtards sont-ils plus heureux que les autres ?   
*Oui, amusez-vous de temps à autre !*   
- La taille de la famille au foyer influe-t-elle sur les résultats scolaires ?   
*Non*   
- Le fait de sortir souvent avec des amis entraîne-t-il nécessairement une plus grande consommation d'alcool ?   
*Conséquence souvent logique*   
- Y-a-t-il un lien entre la consommation d'alcool et l'échec scolaire, l'absentéisme ?   
*Oui, les matins à 8h*   
- De manière générale, lesquels des hommes ou des femmes ont de meilleurs résultats scolaires ?   
*Les femmes ?*   
- Les hommes sont-ils plus fétards que les femmes ? Ou est-ce l'inverse ?   
*Les hommes*   
- Avoir une mère au foyer pousse-t-il à avoir de bons résultats scolaires ?   
*Grand mystère*   
- Habiter loin de son lieu d'apprentissage réduit-il la fréquence de sorties avec des amis ?   
*Certainement*   
- Le niveau d'éducation des parents pousse-t-il les enfants à avoir de bons résultats scolaires ?   
*Oui, on suit nos exemples*   
  
