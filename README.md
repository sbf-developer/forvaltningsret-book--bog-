# Forvaltningsret

En selvstændig dansk mini-bog af Scott Brodie Forsyth om offentlig magt,
sagsbehandling, borgerrettigheder, kontrol og digital forvaltning.

## Indhold

- `manuscript.md` — den redigerbare bogtekst
- `template.tex` — LaTeX-layout, typografi og forside
- `build_book.sh` — reproducerbar bygning af PDF
- `sources.md` — faktatjekregister og kildestatus

## Byg PDF’en

Kræver `pandoc` og `xelatex`:

~~~bash
./build_book.sh
~~~

Det færdige resultat placeres i projektmappen som:

`Forvaltningsret_Scott_Brodie_Forsyth.pdf`

Pandocs mellemfil og LaTeX-kompilerens arbejdsfiler ligger i `build/`.

Layoutet er optimeret til A5 med 12 pkt. brødtekst, øget linjeafstand,
serifbrødtekst, sans-serif-overskrifter, diskrete blå/guld-accenter og en
minimalistisk forside.

## Redaktionelle principper

Bogen skelner mellem gældende ret, beskrivelse af praksis, fortolkning og
normative vurderinger. Lovhenvisninger og tidsfølsomme digitale spørgsmål skal
kontrolleres mod de officielle kilder i `sources.md` før brug i en konkret sag.

Statusdatoen er 17. juli 2026. Bogen er ikke konkret juridisk rådgivning.
