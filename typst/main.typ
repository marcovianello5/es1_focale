#set document(title: [Verifica della legge delle lenti sottili e studio delle aberrazioni ottiche])

#let abstract = [La lunghezza focale di una prima lente convergente è stata determinata utilizzando il metodo dei punti coniugati e il metodo di Bessel. Le aberrazioni cromatica e sferica di una seconda lente sono state analizzate rispettivamente osservando la variazione del punto focale con la lunghezza d'onda e misurando la diversa focalizzazione dei raggi marginali rispetto a quelli parassiali. In questa seconda fase è stato utilizzato un doppietto ottico di lunghezza focale nota per generare un fascio di luce collimata, in quanto la prima lente si è dimostrata non adatta allo scopo.]


#import "@preview/unify:0.7.1": num, qty, numrange, qtyrange
#import "@preview/drafting:0.2.2": *
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#import "@preview/physica:0.9.5": *
#import "@preview/ctheorems:1.1.3": *

// Configurazione di ctheorems

#show: thmrules.with(qed-symbol: $square$)

#let theorem = thmbox("theorem", "Theorem", fill: rgb("#eeffee"))

#let corollary = thmplain("corollary",
  "Corollary",
  base: "theorem",
  titlefmt: strong
)

#let definition = thmbox("definition", "Definition", inset: (x: 1.2em, top: 1em))

#let example = thmplain("example", "Example").with(numbering: none)
#let proof = thmproof("proof", "Proof")

// Definizioni matematiche
#show sym.colon: $class("punctuation", colon) space.thin$
#let to = math.arrow
#let mapsto = math.arrow.bar
#let blank = math.class("normal", $dash.en$)
#let diff = math.upright("d")
#let wedge = math.and
#let tb = math.upright("T")
#let tensors(body, ..sink) = $tensor(upright(T), ..sink) (#body)$
#let Hom = math.op("Hom")
#let lin = math.cal("L")
#let ltensors(from, to, ..sink) = $tensor(lin, ..sink) (from; to)$
#let vf = math.cal("X")
#let cntsf(deg) = $cal(C)^deg$
// #let otimes = math.times.o
#let lrangle(fst, snd) = $angle.l fst, snd angle.r$

// Configurazione del documento 

#set par(
  first-line-indent: 1em,
  justify: true
)

#set page(
  paper: "a4"
)

#set text(
  lang: "it"
)

#set heading(
  numbering: "1.1"
)

#set math.equation(numbering: n => {
  numbering("(1.1)", counter(heading).get().first(), n)
  // if you want change the number of number of displayed
  // section numbers, modify it this way:
  /*
  let count = counter(heading).get()
  let h1 = count.first()
  let h2 = count.at(1, default: 0)
  numbering("(1.1.1)", h1, h2, n)
  */
})

#set table(
  stroke: none,
  gutter: 0.2em,
  fill: (x, y) =>
    if y == 0 or y == 1 { gray },
  inset: (right: 1.5em),
)

// Pagina del titolo

/*
#show: configurazione.with(
  [#context document.title],
  autori: (
    (nome: "Marco Vianello", email: "marco.vianello.14@studenti.unipd.it", matricola: 2158657),
    (nome: "diocane", email: "diocane", matricola: "diocane")
    )
)
*/

#text(size: 16pt)[#context document.title]

#align(center)[
  #grid(
    columns: (1fr,1fr),
    row-gutter: 24pt,
    [Marco Vianello\ #link("mailto:marco.vianello.14@studenti.unipd.it")\ 2158657],
    [stocazzo\ stocazzo\ stocazzo]
  )
]

#align(center)[
  #par(justify: false)[
    *Abstract* \
    #abstract
  ]
]

// Il documento vero e proprio

= Che cosa manca da fare

#inline-note(fill: orange.lighten(80%))[
  - (Opzionale) Forse migliorare un po' la descrizione descrizione delle correzioni e aggiungere valori numerici.
  - Terminare la descrizione della procedura di misura metodo punti coniugati.
    - Commentare grafico in @pprelim-focale.
    - Inserire grafici fit.
    - Manca da spiegare la faccenda delle cinque foto per determinare l'incertezza su $p_"prelim"$.
    
  - Scrivere metodo di Bessel.
  - Scrivere come sono stati analizzati i dati.
]

= Introduzione <introduzione>
L'equazione fondamentale delle lenti sottili

$
  1 / p + 1 / q = 1 / f
$ <fina>

dove $p$ è la distanza oggetto-lente, $q$ è la distanza lente-immagine nitida e $f$ è la lunghezza focale della lente in esame, si deriva nell'approssimazione parassiale (per raggi poco inclinati rispetto all'asse ottico) e descrive il comportamento ideale di una lente priva di aberrazioni.

== Parte prima: verifica dell'@fina e determinazione della lunghezza focale di una lente <intro-focale>

 Nella prima parte dell'esperienza la validità dell'@fina è stata verificata e sfruttata per determinare la lunghezza focale di una lente convergente (in seguito "lente numero 1", "prima lente", ecc.). La procedura di misura seguita è riassunta nel "metodo dei punti coniugati" e nel "metodo di Bessel", ora descritti brevemente. I dettagli sul setup sperimentale adottato e sulla procedura di misura sono riportati nella @setup.

*Il metodo dei punti coniugati*. Su una breadboard ottica sono stati allestiti un oggetto (costituito da una sorgente luminosa a piè della quale è stata posta una una maschera opaca forata) e una guida metrica lineare. La lente in esame e una camera CCD sono state disposte a posizione variabile sulla guida metrica in modo da determinare il maggior numero di coppie $(p,q)$ di "punti coniugati" per i quali l'immagine dell'oggetto prodotta dalla lente risultasse a fuoco sulla camera. La lunghezza focale $f$ della prima lente è stata calcolata mediante un fit lineare sulle coppie $(1/p,1/q)$, la cui relazione funzionale è descritta appunto dall'@fina.

*Il metodo di Bessel*. Sulla breadboard ottica equipaggiata come nel punto precedente la camera è stata fissata a una distanza $d>4f$ (dove $f$ è la distanza focale stimata con il metodo precedente) dall'oggetto. In tali condizioni si ricava che esistono due punti distinti tra oggetto e camera nei quali l'immagine è a fuoco. Se $Delta$ è la distanza tra tra queste due posizioni la lunghezza focale si calcola con la relazione
$
  f = (d^2 - Delta^2)/(4d) ,
$
pertanto è possibile fornire una stima precisa di $f$ ripetendo la procedura di misura della distanza $Delta$ per diverse posizioni della camera.

La determinazione diretta dei valori $p$ e $q$ nel metodo dei punti coniugati è soggetta alla difficoltà pratica di individuare con precisione i piani principali della lente, ovvero i punti di riferimento teorici dai quali si misurano le distanze oggetto-lente e lente-camera #footnote[È stato assunto che ciascun piano principale fosse collocato a circa un terzo dello spessore $V V'$ della lente all'interno del vetro, ovvero a una distanza $(V V')/3$ dal vertice corrispondente. Tuttavia, questa rimane una stima approssimata la cui incertezza contribuisce direttamente all'incertezza sistematica nella determinazione diretta di $p$ e $q$ per il metodo dei punti coniugati.]. Inoltre, gli elementi ottici hanno dimensioni fisiche non trascurabili delle quali è opportuno tenere conto, non senza introdurre però un'ulteriore fonte di errore casuale ed eventualmente sistematico nelle misure. Il metodo di Bessel è esente da questo primo tipo di errore sistematico, mentre partecipa degli altri. Nella @setup sono state discusse le correzioni da apportare alle misure per ovviare alla presenza di questi errori.

== Seconda parte: studio delle aberrazioni ottiche

In questa seconda parte si è affrontato lo studio delle deviazioni dal modello di lente sottile ideale riportato in @fina.

Il banco ottico è stato riorganizzato in modo da avere a disposizione una sorgente di luce collimata (raggi paralleli). Successivamente,

  1. è stata registrata la variazione del punto focale della seconda lente in funzione della lunghezza d'onda della luce emessa dalla sorgente al fine di valutare quantitativamente l'aberrazione cromatica longitudinale (per tre lunghezze d'onda: blu, giallo e rosso);

  2. è stato registrato l'offset che separa il punto di focalizzazione dei raggi parassiali da quello dei raggi marginali al fine di valutare l'aberrazione sferica.

Per i dettagli sul setup sperimentale adottato e sulla procedura di misura si rimanda sempre alla @setup.

#inline-note(fill: orange.lighten(80%))[
Aggiungere parte dove si spiega come sono state analizzate le immagini.
]

= L'apparato sperimentale e la metodologia di misura <setup>

L'incertezza statistica associata alle misure di distanza presentate in questa sezione è pari a $#qty(0.1, "mm")$. Un'analisi più approfondita dell'incertezza di misura sarà discussa alla @analisi.

== Componenti
Per svolgere entrambe le parti dell'esperienza sono stati utilizzati
  - Breadboard ottica Thorlabs MB4590/M, paletti Thorlabs serie TR, portapaletti Thorlabs serie PH e adeguata viteria.
  - Sorgente luminosa equipaggiata con una maschera opaca forata che permette la propagazione dei raggi di luce esclusivamente nella direzione dell'asse ottico (l'"oggetto") e schermabile attraverso filtri a $lambda_"F" = #qty("486.1", "nm")$, $lambda_"D" = #qty("589.7", "nm")$ e $lambda_"C" = #qty("656.3", "nm")$.
  - Alimentatore da banco e cavi (per alimentare la sorgente luminosa).
  - Guida metrica Thorlabs RLA240 e carrelli Thorlabs RC1.
  - Schermo Thorlabs EDU-VS2M (utile per le procedure di allineamento).
  - Bastoncino di plastica di $#qty(81, "mm")$ di lunghezza.
  - Portalenti Thorlabs LMR2S/M.
  - Lente di lunghezza focale incognita in vetro N-BK7#footnote[Quest'informazione andrebbe verificata.] di produttore Thorlabs (cotrassegnata da un bollino verde).
  - Doppietto ottico (presumibilmente di produttore Thorlabs) di lunghezza focale nota $f = #qty(81, "mm")$.
  - Camera CCD Thorlabs CS165CU/M con cavetto USB.
  - Un PC con software ThorImageCAM per controllare la camera.

== Allestimento del banco ottico e determinazione dei fattori di correzione <allestimento-correzioni>

I componenti principali (camera, lente, ecc.) sono stati montati sulle rispettive strutture di supporto Thorlabs serie TR e PH, ad ognuna delle quali è stato avvitato uno carrello Thorlabs RC1. La sorgente luminosa equipaggiata con maschera e filtri è stata collegata all'alimentatore e assieme alla guida metrica è invece fissata direttamente alla breadboard ottica.

=== Offset oggetto-zero della guida metrica

L'offset $delta_1$ tra il foro della maschera (l'"oggetto") e lo zero della guida è stato determinato mediante la seguente procedura (cfr. @repo). Lo schermo Thorlabs EDU-VS2M (in seguito "lo schermo") è stato posto perpendicolarmente alla direzione di propagazione dei raggi luminosi a una distanza pari alla lunghezza $l_"bacchetta" = #qty(81, "mm")$ della bacchetta dall'oggetto. Il valore segnato dal lato sinistro del rispettivo carrello sulla guida metrica è stato registrato come $z$. Il valore di $delta_1$ è stato pertanto determinato come
$
  delta_1 = l_"bacchetta" + 1/2 l_"schermo" - 1/2 l_"carrello" - z = #qty(26.79, "mm")
$
dove $l_"schermo" = #qty(3, "mm")$ e $l_"carrello" = #qty(25.4, "mm")$ sono rispettivamente la misura dello spessore dello schermo e della lunghezza del lato lungo del carrello riportate nei disegni fatti mediante CAD e resi disponibili sulla pagina Moodle del corso o direttamente sul sito del produttore.

=== Offset carrello-lente
Gli offset $delta_2$ e $delta_3$ rispettivamente tra i lati sinistro e destro del carrello sul quale è alloggiata la prima lente e i suoi vertici sinistro e destro sono stati determinati mediante la seguente procedura (cfr. sempre i disegni alla @repo). Per determinare $delta_2$ schermo e lente sono stati disposti in quest'ordine sulla guida metrica, con lo schermo a distanza $l_"bacchetta"$ dal vertice sinistro della lente. È stata segnata la distanza $Delta$ tra il lato destro del carrello portante lo schermo e il lato sinistro del carrello portante la lente. Successivamente si è posto
$
  delta_2 = 1/2 l_"schermo" + l_"bacchetta" -1/2 l_"carrello" - Delta = #qty(2.79, "mm")
$
dove come prima $l_"schermo"$ e $l_"carrello"$ sono rispettivamente la misura dello spessore dello schermo e della lunghezza del lato lungo del carrello riportate nei disegni. In modo analogo è stato determinato $delta_3$, ponendo questa volta lo schermo a destra della lente.

=== Offset carrello-piano principale
Gli offset $delta_4$ e $delta_5$ tra rispettivamente il lato sinistro del carrello nel quale è alloggiata la lente e il suo primo piano principale, e tra il suo secondo piano principale e il lato destro del carrello sono stati determinati a partire dagli offset $delta_2$ e $delta_3$ carrello-lente nel modo seguente. Come preannunciato, è stato assunto che ciascun piano principale fosse collocato a circa un terzo dello spessore $V V'$ della lente all'interno del vetro. Pertanto abbiamo posto
$
  delta_4 = delta_2 + 1/2 V V' - 1/2 (V V')/3 = #qty(6.73, "mm")
$
dove il valore della quantità $V V'$ è tabulato pari a $V V' = #qty(11.8, "mm")$. In modo analogo è stato determinato $delta_5$.

=== Offset carrello-sensore CCD
L'offset $delta_6$ tra il lato sinistro del carrello sul quale è alloggiata la camera e l'effettiva posizione del sensore CCD all'interno di essa è stato determinato a partire dai disegni tecnici forniti dal produttore come
$
  delta_6 = 1/2 l_"carrello" + #qty(3, "mm") = #qty(15.7, "mm")
$
dove come sempre $l_"carrello"$ denota la lunghezza del lato maggiore del carrello.


== Verifica della legge delle lenti sottili e determinazione della lunghezza focale della prima lente

Come accennato nell'Introduzione sono stati impiegati due metodi distinti per determinare la lunghezza focale della prima lente. Entrambi i metodi richiedono di essere svolti in un ambiente buio. Gli elementi ottici sono stati maneggiati indossando dei guanti in lattice.

Una volta che la breadboard ottica è stata allestita come indicato sopra alla @allestimento-correzioni, la camera è stata collegata al PC per visualizzare in tempo reale il suo output sul monitor, e la sorgente luminosa è stata alimentata con una tensione variabile da $#qty(0.0, "V")$ a $#qty(10.0, "V")$. Per svolgere la misura è stato utilizzato il filtro blu a lunghezza $lambda_"F" = #qty(486.1, "nm")$.

=== Determinazione dell'incertezza sulla posizione di fuoco

Per 

=== Metodo dei punti coniugati

La procedura delineata alla voce "Metodo dei punti coniugati" della @intro-focale è stata allora implementata nel modo seguente. La lente è stata posizionata ripetutamente sulla guida metrica (con il logo "THORLABS" del portalenti che guarda nella direzione di arrivo dei raggi luminosi) in modo che il lato sinistro del suo carrello di supporto corrispondesse a una serie di valori preliminari $p_"prelim"$ di distanza oggetto-lente da $#qty(60, "mm")$ a $#qty(490, "mm")$, con un passo di $#qty(10, "mm")$. Per ciascuna di queste posizioni è stata regolata la posizione della fotocamera lungo la guida, spostandola avanti e indietro finché l'immagine mostrata sullo schermo del PC è risultata sufficientemente nitida. Il valore segnato dal lato sinistro del carrello di supporto per la camera è stato registrato come distanza preliminare $q_"prelim"$ lente-camera.

I valori $p_"prelim"$ e $q_"prelim"$ sono stati corretti applicando i fattori discussi in @allestimento-correzioni. In particolare si è posto
$
  p &= p_"prelim" + delta_1 + delta_4 \
  q &= q_"prelim" - p_"prelim" - l_"carrello" + delta_5 +  delta_6
$
dove come in precedenza $l_"carrello"$ è la lunghezza del lato maggiore del carrello.

L'andamento generale delle nuove coppie $(p,q)$ è visualizzabile e delle coppie $(1/p, 1/q)$ è riportato in @pq e in @XY. Una porzione del dataset è riportata in tabella @punticoniugati_df_sample. Le misure grezze sono disponibili nel file `punticoniugati.csv` presenta nella cartella `dati` della repository associata alla relazione, vd. @repo.

#figure(
  table(
    columns: 4,
    $p_"prelim"$, $q_"prelim"$, $p$, $q$,
    [($#qty("", "mm")$)], [($#qty("", "mm")$)], [($#qty("", "mm")$)], [($#qty("", "mm")$)],
    ..csv("dati/punticoniugati_df_sample.csv").flatten()),
  caption: [Campione delle misure grezze per il metodo dei punti coniugati]
) <punticoniugati_df_sample>

L'@fina permette di fornire una prima stima grezza della lunghezza focale della lente in esame come
$
  f = (1/p + 1/q)^(-1) "."
$
L'andamento di questo valore in funzione delle distanze preliminari $p_"prelim"$ oggetto-lente è riportato in @pprelim-focale.


#place(top, float: true)[
  #grid(
    columns: (1fr,1fr),
    row-gutter: 24pt,
    [#figure(image("grafici/pq.svg", width: 110%), caption: [Andamento delle coppie $(p,q)$]) <pq>],
    [#figure(image("grafici/XY.svg", width: 110%), caption: [Andamento delle coppie $(1/p,1/q)$]) <XY>]
  )
]

#figure(
  placement: auto,
  image("grafici/pprelim_focale.svg", width:70%), caption: [Andamento di $f$ in funzione delle distanze preliminari oggetto-lente]
) <pprelim-focale>


= Analisi dei dati <analisi>

= Dati, codice e disegni tecnici <repo>

Il materiale di supporto alla relazione è archiviato in una repository al link #link("https://www.github.com/marcovianello5/es1_focale"). 