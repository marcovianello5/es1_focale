#set document(title: [Verifica della legge delle lenti sottili e studio delle aberrazioni ottiche])

#let abstract = [La lunghezza focale di una prima lente convergente è stata determinata utilizzando il metodo dei punti coniugati e il metodo di Bessel. Le aberrazioni cromatica e sferica di una seconda lente sono state analizzate rispettivamente osservando la variazione del punto focale con la lunghezza d'onda e misurando la diversa focalizzazione dei raggi marginali rispetto a quelli parassiali. In questa seconda fase è stato utilizzato un doppietto di Dullond di lunghezza focale nota per generare un fascio di luce collimata, in quanto la prima lente si è dimostrata non adatta allo scopo.]

#import "configurazione.typ": configurazione

#show: configurazione.with(
  [#context document.title],
  
  autori: (
    (
      nome: "Marco Vianello",
      email: "marco.vianello.14@studenti.unipd.it",
      matricola: 2158657),
    ),
  abstract: [#abstract],
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

= Cose da fare per quanto riguarda la relazione
  - Descrizione dell'apparato e del processo di misura
    - Scriviamo giù tutti gli oggetti che avevamo (famo 'na specie di lista)
    - Poi io farei sottosezioni tipo "Stima con punti coniugati", "Stima con Bessel", ecc. Dentro ognuna di queste la descrizione turbo-autism di come abbiamo fatto a prendere le misure CAD compresi (chi li fa)?
  
  - Descrizione del processo di analisi dati e conclusioni
    - Qui magari scriviamo come abbiamo apportato le correzioni (riferendoci ai disegni fatti col CAD di cui sopra), e spieghiamo come abbiamo determinato le incertezze (che io nn ho ancora capito come cabbo si fa). Non so.

= Introduzione <introduzione>
L'equazione fondamentale delle lenti sottili

$
  1 / p + 1 / q = f
$ <fina>

dove $p$ è la distanza oggetto-lente, $q$ è la distanza lente-immagine nitida e $f$ è la lunghezza focale della lente in esame, si deriva nell'approssimazione parassiale (per raggi poco inclinati rispetto all'asse ottico) e descrive il comportamento ideale di una lente priva di aberrazioni.

== Prima parte: stima della lunghezza focale di una lente e verifica dell'@fina

 Nella prima parte dell'esperienza la validità dell'@fina è stata verificata e sfruttata per determinare la lunghezza focale di una lente convergente (in seguito "lente numero 1", "prima lente", ecc.). La procedura di misura seguita è riassunta nel "metodo dei punti coniugati" e nel "metodo di Bessel", ora descritti brevemente. I dettagli sul setup sperimentale e sulla procedura di misura e di analisi dei dai sono riportati nella @setup.

*Il metodo dei punti coniugati*. Su una breadboard ottica sono stati allestiti un oggetto (costituito da una sorgente luminosa a piè della quale è stata posta una una maschera opaca forata) e una guida metrica lineare. La lente in esame e una camera CCD sono state disposte a posizione variabile sulla guida metrica in modo da determinare il maggior numero di coppie $(p,q)$ di "punti coniugati" per i quali l'immagine dell'oggetto prodotta dalla lente risultasse a fuoco sulla camera. La lunghezza focale $f$ della prima lente è stata quindi calcolata mediante un fit lineare sulle coppie $(1/p,1/q)$, la cui relazione funzionale è descritta appunto dall'@fina.

*Il metodo di Bessel*. Sulla breadboard ottica equipaggiata come nel punto precedente la camera è stata fissata a una distanza $d>4f$ (dove $f$ è la distanza focale stimata con il metodo precedente) dall'oggetto. In tali condizioni si ricava che esistono due punti distinti tra oggetto e camera nei quali l'immagine è a fuoco. Se $Delta$ è la distanza tra tra queste due posizioni la lunghezza focale si calcola con la relazione
$
  f = (d^2 - Delta^2)/(4d) ,
$
pertanto è possibile fornire una stima precisa di $f$ ripetendo la procedura di misura della distanza $Delta$ per diverse posizioni della camera.

La determinazione diretta dei valori $p$ e $q$ nel metodo dei punti coniugati è soggetta dalla difficoltà pratica di individuare con precisione i piani principali della lente, ovvero i punti di riferimento teorici dai quali si misurano le distanze oggetto-lente e lente-camera. È stato assunto che ciascun piano principale fosse collocato a circa un terzo dello spessore $V V'$ della lente all'interno del vetro, ovvero a una distanza $(V V')/3$ dal vertice corrispondente. Tuttavia, questa rimane una stima approssimata la cui incertezza contribuisce direttamente all'incertezza sistematica nella determinazione diretta di $p$ e $q$ per il metodo dei punti coniugati. Il metodo di Bessel è esente da questo tipo di errore sistematico.

== Seconda parte: studio delle aberrazioni ottiche

Per lo studio qualitativo delle aberrazioni il banco ottico è stato riconfigurato per ottenere un fascio di luce parallelo incidente sulla lente in esame (in seguito "lente numero 2", "seconda lente", ecc.). Questo è stato realizzato posizionando la sorgente luminosa nel fuoco anteriore di un doppietto ottico, che ha funto in tal modo da collimatore dei raggi luminosi.

Successivamente,
1. È stata registrata la variazione del punto focale della seconda lente in funzione della lunghezza d'onda della luce emessa dalla sorgente al fine di valutare quantitativamente l'aberrazione cromatica longitudinale.

2. Diocane

= L'apparato sperimentale e la metodologia di misura <setup>