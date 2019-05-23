# -- ÉTAPE 2 : Transformation fichiers .rda en .csv

# -- 1ère méthode, écrire dans console R :

write_csv(flights, "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/NYCflights/flights.csv")
write_csv(airports, "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/NYCflights/airports.csv")
write_csv(airlines, "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/NYCflights/airlines.csv")
write_csv(planes,  "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/NYCflights/planes.csv")
write_csv(weather,  "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/NYCflights/weather.csv")


# -- 2ème méthode plus élégante : Autre possibilité : faire des boucles fortes :

mes_rda<- c("flights", "airlines", "airports", "planes", "weather")
rep_cible<-"C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/NYCflights/"

for (df in mes_rda) {
+ write_csv(get(df),paste0(rep_cible, df, ".csv"), na = "NULL")
+ }

# --1 = Vectoriser le chemin vers le dossier en rep_cible pour simplifier le code
# --2 = Fonction paste0 permet d'ajouter .csv à la fin
# --3 = utiliser get() pour définir dataframe

# supprimer des dataframes en utilisant fonction: rm(dataframe)



