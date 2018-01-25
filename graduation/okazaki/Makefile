
TARGET = Graduation_Thesis

all: dvi pdf

dvi: $(TARGET).tex
	platex $(TARGET).tex
	pbibtex $(TARGET)
	platex $(TARGET).tex
	platex $(TARGET).tex

pdf: $(TARGET).dvi
	dvipdfmx $(TARGET).dvi
