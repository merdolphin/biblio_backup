#! /bin/bash
##
./clean.sh
trap "exit 1" INT TERM
pdflatex biblio
bibtex biblio
pdflatex biblio
## ad hoc
makeindex -s gtsIndex-aut.ist -o biblio.aut.ind -t biblio.aut.ilg biblio.aut.idx
pdflatex biblio
if (type thumbpdf &> /dev/null); then
  thumbpdf biblio
  pdflatex biblio
fi
exit 0
##
## End of file `biblio/remake-pdf.sh'.
