# $Id: Makefile 228 2010-12-11 21:20:15Z soohyunc $

# define TeX files
TEXFILES=$(wildcard *.tex)

# define the source TeX file and target
SRC := $(shell egrep -l '^[^%]*\\begin\{document\}' $(TEXFILES))
TRG := $(SRC:%.tex=%.pdf)
# RES := $(shell egrep -l 'cls/res' $(TEXFILES) | sed s/.tex//)
LET := $(shell egrep -l 'begin{letter}' $(TEXFILES) | sed s/.tex//)
TARGET= $(shell egrep -l '^[^%]*\\begin\{document\}' $(TEXFILES) | sed s/.tex//)
ART = article
STA = statement
OUTPUT=webrtc-tizen.pdf
PWD := $(shell pwd)

RM		:= rm -f
RMLOG	:= ./sh/rmlog.sh

# make pdf
all: ${ART}.pdf ${LET}.pdf ${STA}.pdf

${ART}.pdf:  ${ART}.ps
	@ps2pdf ${ART}.ps

${LET}.pdf:  ${LET}.ps
	@ps2pdf ${LET}.ps

${STA}.pdf: ${STA}.ps
	@ps2pdf ${STA}.ps

${ART}.ps:  ${ART}.dvi
	@dvips -t a4 -o ${ART}.ps ${ART}

${LET}.ps:  ${LET}.dvi
	@dvips -t a4 -o ${LET}.ps ${LET}

${STA}.ps: ${STA}.dvi
	@dvips -t a4 -o ${STA}.ps ${STA}

# shortcut, so we can say "make ps"
ps: ${ART}.ps ${LET}.ps ${STA}.ps

# make target
${ART}.dvi: ${ART}.tex
	@latex ${ART}
	@bibtex ${ART}
	@latex ${ART}
	@latex ${ART}

${LET}.dvi: ${LET}.tex
	@latex ${LET}

${STA}.dvi: ${STA}.tex
	@latex ${STA}

clean:
	@echo "Start cleaning..."
	@${RMLOG} ${ART}
	@${RMLOG} ${LET}
	@${RMLOG} ${STA}
	@${RMLOG} $(shell find . -name ${OUTPUT} | sed s/\.\// | sed s/.pdf//)
	@$(RM) *.*~
	@echo "done!"

distclean: clean
	@echo ""
	@echo "Start cleaning figures..."
	@${RMFIG}
	@echo "done!"

merge: ${ART}.pdf ${LET}.pdf ${STA}.pdf
	    @gs -q -sPAPERSIZE=a4 -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=${OUTPUT} chris6.pdf ${ART}.pdf ${LET}.pdf {STA}.pdf

wc:
	@echo Approximate word count: \
	`grep -v '^\\\\' $(TEXFILES) | grep -v '^%' | wc -w`


.PHONY : ps all clean wc fig
