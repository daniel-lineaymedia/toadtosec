#!/bin/bash
# Buscar nuevos ficheros .zip en la carpeta /home/pi/Downloads
cd /home/pi/Downloads/
for i in *.zip;
do
if [ "$i" != "*.zip" ]; then
    # obtiene el fichero a mover
    fichamover=`zipinfo -1 "$i"`;
    numficherosantes=`ls | wc -l` 
    # descomprimir fichero encontrado
    unzip -j -o -qq "$i" ;
    numficherosdespues=`ls | wc -l`
    numficheros=$(($numficherosdespues-$numficherosantes))
    cont=1
    # cambiar el nombre para no volverlo a procesar
    mv -f "$i" "$i".BAK;
    # encontrar el fichero descargado para averiguar su rom
    cual=$(grep -nr "$fichamover" /opt/retropie/configs/all/toad/scripts/TOSEC);
    # buscar las cadenas dentro de cual para detectar qué rom es
    rom="";
    path="/opt/retropie/configs/all/toad/scripts/TOSEC/";
    busca="Commodore Amiga";
    if [[ $cual == $path$busca* ]]
    then 
        rom="amiga";
    fi;
    busca="Amstrad CPC";
    if [[ $cual == $path$busca* ]]
    then 
        rom="amstradcpc";
    fi;
    busca1="Apple II ";
    busca2="Apple IIGS";
    if [[ $cual == $path$busca1* ]] || [[ $cual == $path$busca2* ]]
    then 
        rom="apple2";
    fi;
    busca="Atari 2600";
    if [[ $cual == $path$busca* ]]
    then 
        rom="atari2600";
    fi;
    busca="Atari 5200";
    if [[ $cual == $path$busca* ]]
    then 
        rom="atari5200";
    fi;
    busca="Atari 7800";
    if [[ $cual == $path$busca* ]]
    then 
        rom="atari7800";
    fi;
    busca="Atari 8bit";
    if [[ $cual == $path$busca* ]]
    then 
        rom="atari800";
    fi;
    busca="Atari ST";
    if [[ $cual == $path$busca* ]]
    then 
        rom="atarist";
    fi;
    busca="Commodore C64";
    if [[ $cual == $path$busca* ]]
    then 
        rom="c64";
    fi;
    busca="Coleco";
    if [[ $cual == $path$busca* ]]
    then 
        rom="coleco";
    fi;
    busca="Dragon Data";
    if [[ $cual == $path$busca* ]]
    then 
        rom="dragon32";
    fi;
    busca="Nintendo Famicom Disk System";
    if [[ $cual == $path$busca* ]]
    then 
        rom="fds";
    fi;
    busca="Sega Game Gear";
    if [[ $cual == $path$busca* ]]
    then 
        rom="gamegear";
    fi;
    busca="Nintendo Game Boy -";
    if [[ $cual == $path$busca* ]]
    then 
        rom="gb";
    fi;
    busca="Nintendo Game Boy Advance";
    if [[ $cual == $path$busca* ]]
    then 
        rom="gba";
    fi;
    busca="Nintendo Game Boy Color";
    if [[ $cual == $path$busca* ]]
    then 
        rom="gbc";
    fi;
    busca="Sega Mega Drive";
    if [[ $cual == $path$busca* ]]
    then 
        rom="megadrive";
    fi;
    busca="Mattel Intellivision";
    if [[ $cual == $path$busca* ]]
    then 
        rom="intellivision";
    fi;
    busca="Sega Mark III";
    if [[ $cual == $path$busca* ]]
    then 
        rom="mastersystem";
    fi;
    busca="MSX";
    if [[ $cual == $path$busca* ]]
    then 
        rom="msx";
    fi;
    busca="Nintendo 64";
    if [[ $cual == $path$busca* ]]
    then 
        rom="n64";
    fi;
    busca="Nintendo Famicom";
    if [[ $cual == $path$busca* ]]
    then 
        rom="nes";
    fi;
    busca="SNK Neo-Geo Pocket -";
    if [[ $cual == $path$busca* ]]
    then 
        rom="ngp";
    fi;
    busca="SNK Neo-Geo Pocket Color";
    if [[ $cual == $path$busca* ]]
    then 
        rom="ngpc";
    fi;
    busca="SNK Neo-Geo";
    if [[ $cual == $path$busca* ]]
    then 
        rom="neogeo";
    fi;
    busca="Tangerine Oric-1";
    if [[ $cual == $path$busca* ]]
    then 
        rom="oric";
    fi;
    busca1="IBM PC";
    busca2="NEC PC ";
    if [[ $cual == $path$busca1* ]] || [[ $cual == $path$busca2* ]]
    then 
        rom="pc";
    fi;
    busca="NEC PC-Engine";
    if [[ $cual == $path$busca* ]]
    then 
        rom="pcengine";
    fi;
    busca="MGT Sam Coupe";
    if [[ $cual == $path$busca* ]]
    then 
        rom="samcoupe";
    fi;
    busca="Sega 32X";
    if [[ $cual == $path$busca* ]]
    then 
        rom="sega32x";
    fi;
    busca="Sega Mega-CD";
    if [[ $cual == $path$busca* ]]
    then 
        rom="segacd";
    fi;
    busca="Sega Game 1000";
    if [[ $cual == $path$busca* ]]
    then 
        rom="sg-1000";
    fi;
    busca="Nintendo Super";
    if [[ $cual == $path$busca* ]]
    then 
        rom="snes";
    fi;
    busca="Texas Instruments TI-99";
    if [[ $cual == $path$busca* ]]
    then 
        rom="ti99";
    fi;
    busca="GCE Vectrex";
    if [[ $cual == $path$busca* ]]
    then 
        rom="vectrex";
    fi;
    busca="Philips Videopac";
    if [[ $cual == $path$busca* ]]
    then 
        rom="videopac";
    fi;
    busca="Bandai Wonderswan -";
    if [[ $cual == $path$busca* ]]
    then 
        rom="wonderswan";
    fi;
    busca="Bandai Wonderswan Color";
    if [[ $cual == $path$busca* ]]
    then 
        rom="wonderswancolor";
    fi;
    busca="Infocom Z-Machine";
    if [[ $cual == $path$busca* ]]
    then 
        rom="zmachine";
    fi;
    busca="Sinclair";
    if [[ $cual == $path$busca* ]]
    then 
        rom="zxspectrum";
    fi;
    if [[ $rom == "" ]]
    then
       rom="desconocido";
    fi
    mv -f "$fichamover" /home/pi/RetroPie/roms/$rom
    echo "Moviendo $fichamover a rom $rom ($cont de $numficheros)";
fi
done
cd /home/pi/Downloads
rm -f *.BAK
cd /opt/retropie/configs/all/toad
