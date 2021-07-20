# Videoflix

##  Modelisation et conception de base de données

Videoflix est une plateforme de streaming vidéo qui permet de consulter des films à raison de 600 minutes par mois et par utilisateur.
La plateforme est accessible uniquement à travers un e-mail et propose des films en tous genres en version originale.

Les films les mieux notés, les films récemment sortis en salle et les films locaux selon le pays de l'utilisateur sont mis en avant. 
Il se peut aussi qu'un film non sorti en salle soit référencé auprès de Videoflix.

Un moteur de recherche avancée permet un recherche intuitif au contenu, que ce soit sur les informations techniques du film (films, casting, membres de la production) ou sa popularité.

Une fiche technique du film est disponible, elle possède :
* une vignette
* un synopsis
* la durée
* le casting ainsi que les rôles joués dans le film
* les membres de la direction

Pour finir l'utilisateur pourra attribuer une note au film ainsi qu'un commentaire s'il le souhaite.


### Schema MCD (Modèle conceptuel des données)
![https://github.com/sfinx13/videoflix-database/blob/main/schema-entity-relationship-model.png](https://github.com/sfinx13/videoflix-database/blob/main/schema-entity-relationship-model.png)

### Schema base de données 
![schema-entity-relationship-model.png](https://github.com/sfinx13/videoflix-database/blob/main/schema-database.png)

#### Remarque: 
Nous nous appuierons sur des données normalisées pour le pays et la langue 
[ISO-3166 Country Codes and ISO-639 Language Codes](https://docs.oracle.com/cd/E13214_01/wli/docs92/xref/xqisocodes.html)


## Requêtes SQL
Ci joint l'ensemble des requêtes à executer

### Requête niveau basique

[SQLBASIC.md](SQLBASIC.md)

### Requête niveau normal

[SQLNORMAL.md](SQLNORMAL.md)

