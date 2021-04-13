## Autor:          PE2_UF2_JISMB_Posada_Xavier.md
## Date:           13/04/21
## Description:    Prova M02 - UF02 Linux 1  
#### 1. Descarrega't el fitxer markdown annexat a la tasca.
#### 2. Renombra el fitxer amb el següent format: PE2_UF2_Grup_Cognom_alumne.md
#### 3. Puja el fitxer al GitLab
#### 4. Fes els exercicis fent servir scripts i Linux.
#### 5. Enganxa la solució al fitxer markdown. No cal que incloguis la capçalera.
#### 6. Al acabar la prova, recorda annexar el markdown a la tasca i fer un commit de tots els canvis.
--------

1. **( 1 punt ) Copia aquest fitxer en el teu repositori remot ( GitLab, GitHub ), a la carpeta /m-02/uf2/prova-escrita/**  
**Escriu aquí el link.**   
https://github.com/XaviPM/XaviPM/tree/master/m02-so/UF2/prova-escrita

2. **(1 punt ) Escriu un script que ens dongui informació sobre la caducitat i validesa dels usuaris del Sistema.**  
chage -l root

**Si l'ordre retorna un estat de sortida 0, informeu que "l'ordre s'ha realitzat correctament" i sortiu amb un estat de sortida 0.**  
**Si l'ordre retorna un estat de sortida diferent de zero, informeu "Comanda fallida" i sortiu amb un estat de sortida 1.** 
comprobacio=$(echo $?)

if [ $comprobacio -eq 0 ]; then
        echo "L'ordre s'ha realitzat correctament"
else
        echo "Comanda fallida"
fi 

3. **( 1 punt ) Quin cron farem servir per tal que l'script anterior es faci a les 23:45 cada diumenge?** 
45 23  * * Sun

4. **(1 punt ) Feu un script que comprovi si existeix el fitxer "/tmp/prova". Si no existeix el crea. Feu que informi a l'usuari del que ha passat.**
if [ -f /tmp/prova ]; then
        echo "El fitxer /tmp/prova ja existeix"
else
        touch /tmp/prova
        echo  "El fitxer /tmp/prova no existia, aixi que l'he creat"
fi

5. **(1 punt ) Que estem fent en la següent comanda? grep -w 8 fitxer**
Amb el grep, estem buscant una cadena de caràcters, que amb l'opció -w són nomès paraules concretes, en aquest cas 8. Això ho buscarà a tots els fitxers. ignorant la seva extensió

6. **(1 punt ) Com comprovem que la anterior ordre s'hagi executat amb èxit?.**
echo $?

Al executar la comanda "echo $?", comprovarem si l'anterior ordre ha resultat exitosa. Aquesta comanda ens donarà un resultat. Si ens dona 0, l'anterior ordre s'haurà executat correctament, si ens dona 1, l'ordre no haurà estat exitosa.

7. **(1 punt ) Fer un script qur crei un fitxer .txt de nom la data i hores actuals a /tmp**

avui=$(date +%Y_%m_%d_%T)

touch /tmp/$avui.txt

8. **(1 punt ) Fer un script que rep tres arguments i valida que siguin exactament 3.**
if [ $# -eq 3 ]; then
        echo "Has introduit 3 arguments, perfecte"
else 
        echo "No has introduit exactament 3 arguments, malament"
fi


9. **(1 punt ) Que fa la següent comanda? cat file1.txt file2.txt file3.txt | sort > file4.txt**
Farà un cat (mostrar el contingut) de file1 file2 i file3. Desprès, aquest contingut serà escrit sencer a un altre fitxer, file4. Però, al haber possat ">", cada vegada que executem l'ordre, es reescriura el contingut de file4.

10. **(1 punt ) Si tenim en un fitxer el següent contingut:**

```
one	two	three	four	five
alpha	beta	gamma	delta	epsilon
gener   febrer  març    abril
```

**Quina ordre hem d'executar per obtenir**

```
two
beta
febrer
```
cat fitxer | grep -d " " -f 2



