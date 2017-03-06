{ALGO : Garage Automobile
BUT : Créer un algorithme qui permet d'enregistrer des garages et les voitures de ces mêmes garages. 
ENTREES : Caractéristiques des véhicules et des garages 
SORTIES : Caractéristiques des véhicules et des garages, gestion et affichage.
// Cette version contient la creation d'un garage 
// Cette version ne contient pas la creation d'une voiture (procedure)
// Elle ne contient pas les fonctionnalités d'affichage (toutes les procedures/fo)
// Mon algo ne génère pas les plaques, ne calcule pas l'âge, la cote argus et n'associe pas les voitures aux garages

CONST 
	MaxGarage=15
	MinGarage=6
	MAX=500

TYPE MARQUE = (Opel,Peugeot,Citroen,Renault,Audi)

TYPE ENERGIE = (Essence,Diesel,GPL,Electrique,Hybride)

TYPE COULEUR = (Noir,Blanc,Bleu,Rouge,Jaune)

Type calendrier = enregistrement
		jour:integer
		mois:integer
		annee:integer
FIN

TYPE GARAGE = enregistrement
		numgar:entier
		nbvoitgar:entier
		nom:chaine
		adresse :chaine
		codepostal:chaine
		tel:chaine
		email:chaine
FIN

TYPE VOITURE = enregistrement
		gar:garage
		numvoit:entier
		marque:MARQUE
		modele:chaine
		energie:ENERGIE
		puissfisc:entier
		puissDYN:entier
		couleur:COULEUR
		options:string
		annee:calendrier
		prixneuf:integer
		coteargus:integer
		datecirc:calendrier
		age:integer
		plaque:chaine
FIN

TYPE tabgarage=tableau[1..MAX] de GARAGE
TYPE tabvoiture=tableau[1..MAX] de VOITURE

PROCEDURE CreationGarage (TabGar:tabgarage)
	
	VAR
		longueurmail:entier
		saisie:chaine
		j:entier
		i:entier
		valid1:booleen
		valid2:booleen

	DEBUT

		valid1<-FALSE
		valid2<-FALSE

		TabGar[i].numgar<-i
		i<-i+1

		ECRIRE("Veuillez entrer un nom de garage")
		LIRE(TabGar[i].nom)

		ECRIRE("Veuillez entrer une adresse (Numero de rue et nom de la voie,code postal, ville et pays)")
		LIRE(TabGar[i].adresse)

		ECRIRE ("Veuillez entrer le numero de telephone du garage")
		LIRE (TabGar[i].tel)
		
		REPETER 											//Verification de la validite de l'adresse mail
			ECRIRE ("Veuillez entrer l'email du garage")
			LIRE (TabGar[i].email)
			saisie<-TabGar[i].email
			longueurmail<-longueur(saisie)
			POUR j DE 1 A longueurmail FAIRE
				SI (saisie[j]="@") 
					valid1<-VRAI
				FINSI
				SI (saisie[j]=".")
					valid2<-VRAI
				FINSI
			FINPOUR
		JUSQU'A (valid1=TRUE) ET (valid2=TRUE)

	FIN

//PROCEDURE CreationVoiture (TabVoit:tabvoiture) 

	//VAR



VAR
	nb:entier
	tab1:tabgarage
	tab2:tabvoiture
	i:entier

DEBUT
	ECRIRE("Programme de gesiton de garage automobile")
	i<-1
	REPETER
		ECRIRE "Veuillez entrer 1 pour saisir un garage"
		ECRIRE "Veuillez entrer 2 pour saisir une voiture"
		ECRIRE "Veuillez entrer 0 pour quitter"
		LIRE (nb)
		CAS nb PARMI 
			1 : CreationGarage(tab1)
			2 : CreationVoiture(tab2)
		FINCASPARMI
	JUSQU'A (nb=0)

FIN