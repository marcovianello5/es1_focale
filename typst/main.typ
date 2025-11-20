// =====================================================
// Configurazione del documento
// =====================================================

// Importo i pacchetti
#import "@preview/ctheorems:1.1.3": *
#show: thmrules.with(qed-symbol: $square$)

#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

#import "@preview/physica:0.9.5": *


// Configurazione di ctheorems
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
#let otimes = math.times.o
#let lrangle(fst, snd) = $angle.l fst, snd angle.r$


// Setup della pagina
// Cfr. https://typst.app/docs/tutorial/making-a-template/

#set page(paper: "a4")
#set heading(numbering: "1.1")
#set text(font: "New Computer Modern")

// Configurazione del titolo
#set document(title: [Stima della distanza focale di una lente (non troppo) spessa e studio delle aberrazioni cromatiche])

#show title: set align(center)
#show title: set block(below: 1.2em)

#title()

#grid(
  columns: (1fr, 1fr),

  align(center)[
    Marco Vianello\
    #link("mailto:marco.vianello.14@studenti.unipd.it")\
    matricola
  ],

  align(center)[
    Nome Cognome\
    #link("mailto:nome.cognome.numero@studenti.unipd.it")\
    matricola
  ]
)

#align(center)[
  #set par(justify: false)
  *Abstract*\
  #lorem(80)
]



// =====================================================
// Inizio del documento
// =====================================================


= Introduzione

Qui ci va la parte di ottica geometrica.

= Descrizione dell'apparato e delle misure effettuate

#lorem(30)

#lorem(30)

= Analisi dati

#lorem(30)

= Conclusioni

#lorem(30)