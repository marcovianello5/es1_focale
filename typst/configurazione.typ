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
// #let otimes = math.times.o
#let lrangle(fst, snd) = $angle.l fst, snd angle.r$


// Setup della pagina
// Cfr. https://typst.app/docs/tutorial/making-a-template/


#let configurazione(titolo, autori: (), abstract: [], documento) = {
  
  set par(
    first-line-indent: 1em,
    spacing: 0.65em,
    justify: true,
  )

  set page(
    paper: "a4"
  )

  set text(
    lang: "it"
  )

  set heading(
    numbering: "1.1"
  )

  // show title: set text(size: 17pt)

  place(top + center, float: true, scope: "parent", clearance: 3em)[
    
    #text(size: 16pt)[#titolo]

    #let count = autori.len()
    #let colonne = calc.min(count, 3)

    #grid(
      columns: (1fr,) * colonne,
      row-gutter: 24pt,

      ..autori.map(autore => [#autore.nome #footnote[#link("mailto:" + autore.email), numero di matricola #autore.matricola]])
    )

    #par(justify: false)[
      *Abstract* \
      #abstract
    ]
  ]

  documento
}