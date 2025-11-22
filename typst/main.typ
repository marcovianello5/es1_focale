#import "configurazione.typ": configurazione

#set document(title: [Stima della distanza focale di una lente (non troppo) spessa e studio delle aberrazioni])

#let abstract = [#lorem(20)]

#show: configurazione.with(
  
  autori: (
    (
      nome: "Marco Vianello",
      email: "marco.vianello.14@studenti.unipd.it",
      matricola: 2158657),
    (
      nome: "Nome Cognome",
      email: "nome.cognome.numero@studenti.unipd.it",
      matricola: 1234567)
    ),

  abstract: [#abstract],
)

= Cose da fare per quanto riguarda la relazione
  - Abstract
    - Basicamente stimiamo la lunghezza focale di una lente e poi la usiamo pre studiare le aberrazioni cromatiche/sferiche di un'altra lente. Però a una certa casini quindi abbiamo resortato su un doppietto.

  - Introduzione
    - Descrivere brevissimamente la teoria delle lenti fine e spesse.
    - Descrivere brevissimamente che cosa abbiamo misurato e dove vogliamo andare a parare (quindi sezioncine tipo "Misura della focale con punti coniugati/Besse" e "Misura delle aberrazioni")

  - Descrizione dell'apparato e del processo di misura
    - Scriviamo giù tutti gli oggetti che avevamo (famo 'na specie di lista)
    - Poi io farei sottosezioni tipo "Stima con punti coniugati", "Stima con Bessel", ecc. Dentro ognuna di queste la descrizione turbo-autism di come abbiamo fatto a prendere le misure CAD compresi (chi li fa)?
  
  - Descrizione del processo di analisi dati e conclusioni
    - Qui magari scriviamo come abbiamo apportato le correzioni (riferendoci ai disegni fatti col CAD di cui sopra), e spieghiamo come abbiamo determinato le incertezze (che io nn ho ancora capito come cabbo si fa)

= Cose da fare per quanto riguarda l'analisi dati
  - prkd