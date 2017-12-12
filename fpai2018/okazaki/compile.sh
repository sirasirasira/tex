filename=fpai_okazaki

platex ${filename}.tex
pbibtex ${filename}
platex ${filename}.tex
platex ${filename}.tex
dvipdfmx ${filename}.dvi
