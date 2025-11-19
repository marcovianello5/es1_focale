# Stima della determinazione della distanza focale di una lente (non troppo) spessa e studio delle aberrazioni cromatiche

Ovvero, la prima esperienza di laboratorio per il corso "Sperimentazioni di fisica 2" del corso di laurea in Fisica dell'Università degli Studi di Padova.

## Che cosa c'è qui

 - Un notebook di Julia;
 - Una cartella `dati` con dentro i tre `.csv` contenenti le misure;
 - Una cartella `img` con dentro le immagini acquisite durante l'esperienza;
 - Una cartella `typst` con il sorgente [Typst](https://typst.app/) della relazione.

 ## Le immagini

 Alcune immagini seguono la denominazione `x_y_z_n.jpg` dove (nelle notazioni dell'appendice (che per ora non esiste)) `x` è il risultato `z` della procedura di determinazione dell'offset oggetto-guida, `y` è il valore segnato sulla guida dal lato sinistro della base sulla quale è montata la lente, `z` è il valore segnato sulla guida dal lato sinistro della base sulla quale è montata la camera ed `n` è un valore compreso tra `0001` e `0005` (vd. tabella).

 | n    | significato |
 |------|-------------|
 | 0001 | a fuoco     |
 | 0002 | + 0.5 mm    |
 | 0003 | - 0.5 mm    |
 | 0004 | + 1.0 mm    |
 | 0005 | - 1.0 mm    |

 Le rimenenti si riferiscono alle misure riportate in `dati/aberrazione.csv`.

## Come si usa tutto ciò

Il linguaggio scelto è [Julia](https://julialang.org/). Per visualizzare il notebook e interagire con esso ho utilizzato il pacchetto il pacchetto [IJulia](https://github.com/JuliaLang/IJulia.jl) e l'editor [VSCodium](https://vscodium.com/) con le estensioni per [Jupyter](https://jupyter.org/) e Julia.

