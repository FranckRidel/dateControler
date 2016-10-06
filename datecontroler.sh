#!/bin/bash
	#Ce script vérifie la validité d'une date
	clear
	echo "Entrez, en chiffres, une date que vous voulez contrôler: "

	#Répéter la demande jusqu'à ce que le jour soit composé uniquement de chiffres
	until [[ $day =~ ^[0-9]+$ ]]; do
		echo -n "Jour: "
		read day
	done

	#Répéter la demande jusqu'à ce que le mois soit composé uniquement de chiffres
	until [[ $month =~ ^[0-9]+$ ]]; do
		echo -n "Mois: "
		read month
	done

	#Répéter la demande jusqu'à ce que l'année soit composée uniquement de chiffres
	until [[ $year =~ ^[0-9]+$ ]]; do
		echo -n "Année: "
		read year
	done

	#Si le mois est avril, juin, septembre ou novembre, le mois à 30 jours
	if [[ $month -eq 4 || $month -eq 6 || $month -eq 9 || $month -eq 11 ]]; then
		dMax=30
	#Sinon si le mois à 31 jours
	elif [[ $month -eq 1 || $month -eq 3 || $month -eq 5 || $month -eq 7 || $month -eq 8 || $month -eq 10 || $month -eq 12 ]]; then
		dMax=31
	#Sinon si le mois est février et que l'année est divisible par 4 
	#OU si l'année n'est pas divisible par 100 mais qu'elle l'est par 400
	#elle est bisextile et le mois de février à 29 jours
	elif [[ $month -eq 2 && $year%4 -eq 0 && $year%100 -ne 0 || $month -eq 2 && $year%100 -ne 0 && $year%400 -eq 0 ]]; then 
		dMax=29
	#sSinon si le mois est février et que l'année n'est pas divisible par 4 
	#OU que l'année est divisible par 100
	#elle n'est pas bisextile et le mois de février à 28 jours
	elif [[ $month -eq 2 && $year%4 -ne 0 || $month -eq 2 && $year%100 -eq 0 ]]; then 	
		dMax=28
	else
		#Sinon le mois est faux, on met arbitrairement à 0 de manière à ce que $day soit forcément supérieur
		dMax=0;
	fi

	if [[ $day -le dMax && $month -le 12 ]]; then
		echo "La date est valide"
	else
		echo "La date n'est pas valide"
	fi

