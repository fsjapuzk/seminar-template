TARGETS = draft.pdf
DEPS_DIR = .deps
# I disabled --interaction=errorstopmode bc it interferes with building unknown images
LATEXMK = latexmk -pdflatex="lualatex --interaction=batchmode --synctex=1" -recorder -use-make -deps \
	-e   'warn  qq(In   Makefile,  turn   off  custom dependencies\n);' \
	-e '@cus_dep_list = ();' \
	-e 'show_cus_dep();'
all : $(TARGETS)
$(foreach file,$(TARGETS),$(eval -include $(DEPS_DIR)/$(file)P))
$(DEPS_DIR) :
	mkdir $@

# stays in foreground and automatically re-builds the pdf if
# a file has changed.  Opens evince.
continuous:
	latexmk -pdf -pvc $(LATEXMKOPTS) $(FILENAME).tex \
	-e '$$pdf_previewer = "start evince";' \
	-e '$$pdf_update_method = 0;'

# $(FILENAME).pdf: $(FILENAME).tex
# 	latexmk -pdf $(LATEXMKOPTS) $(FILENAME).tex

clean:
	rm -f *.log *.aux *.fls *.out *.fdb_latexmk *.synctex.gz
	rm -f $(TARGETS)
	rm -rf .deps

%.svg: %.conll
	cd $(dir $<); \
	java -jar deptreeviz.jar < $(notdir $<) > $(notdir $@)

%.pdf: %.gpi
	cd $(dir $<); \
	gnuplot $(notdir $<) > $(notdir $@)

%.pdf: %.dot
	cd $(dir $<); \
	dot -Tpdf $(notdir $<) -o $(notdir $@)

%.pdf: %.svg
	cd $(dir $<); \
	inkscape --export-area-drawing -A $(notdir $@) $(notdir $<)

%.pdf: %.odg
	cd $(dir $<); \
	loffice --headless --convert-to pdf $(notdir $<)

%.pdf : %.tex
	if [ ! -e $(DEPS_DIR) ]; then mkdir $(DEPS_DIR); fi
	$(LATEXMK) -pdf -dvi- -ps- -deps-out=$(DEPS_DIR)/$@P $<

%.pdf : %.fig
	fig2dev -Lpdf $< $@
