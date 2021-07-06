rem https://www.imagemagick.org/script/mogrify.php
@echo off
::========================TITRE=============================
:: Script resize
::=====================DESCRIPTION==========================
:: Permet de transformer plusieurs image PNG dans plusieurs taille
:: Seuls les fichiers modifiés sont traités => sauvegarde différentielle.
:: Ce script fonctionne avec cette application : https://www.imagemagick.org/script/mogrify.php
::=======================METHODE===========================
:: 1- L'arborescence à respecter :
::
:: ResizeImagemy-app/
:: ├─ ImageMagick/
:: │  ├─ <dossier contenant le programe>
:: ├─ sources/
:: │  ├─ <dossier contenant les images à traiter>
:: │  ├─ image1.png
:: ├─ resize.bat
:: ├─ <ici seront copiée les nouvelles images traitées>
:: ├─ <les images sont automatiquement supprimées>
::
:: 2- Copier les images dans le repertoire source
:: 3- Executer resize.bat
::=======================AUTEUR====================================
:: By JPA - 2021
::================================================================


:: le chemin d'acces de magick.exe
set path_magick="%~dp0ImageMagick\magick.exe"

:: le chemin d'acces des images à redimensionner
set path_source="%~dp0sources"

::Déclaration des tailles ici
::*****************************************************************************
set listformat="512" "256" "128" "64" "32" "16"
::*****************************************************************************

:: "Suppression des anciens traitements"
echo "==================================="
echo "Suppression des anciens traitements"
for %%f in (%~dp0*.png) do (
   
	del %%f /f /q

)
echo "FIN de Suppression des anciens traitements"


echo "==================================="
echo "Converstion des jpg en PNG dans le repertoire source"
:: On boucle sur tous les fichier dans le repertoire source
for %%f in (%path_source%\*.jpg) do (
	
	:: Command avec imageMagic
	%path_magick% convert %%f "%path_source%\%%~nf.png"

)


:: On boucle sur chaques tailles
for %%i in ("512" "256" "128" "64" "32" "16") do (
	echo " Transformation en %%ix%%i"

	echo "==================================="
	echo " 1 - Copie des fichiers dans le repertoire de destination"
	:: On boucle sur tous les fichier dans le repertoire source
	for %%f in (%path_source%\*.png) do (
		
		:: On copie le fichier en le renommant avec le bon format cible
		copy %%f "%~dp0%%~nf_%%i.png"
		:: On copie également un version originale
		copy %%f "%~dp0%%~nf_original.png"

	)

	echo "==================================="
	echo " 2 - Traitement des images"

	:: On lance la transformation uniquement sur les fichiers au format actuel
	%path_magick% mogrify -resize %%ix%%i %~dp0*_%%i.png

)

pause
