DIRS = resume-games resume-games-ai resume-web-ai
OUTDIR = output

save: clean
	@bash save.sh

pull: clean
	@bash pull.sh

both: all fullurl

all: $(OUTDIR)
	$(foreach dir, $(DIRS), latexmk -pdf -cd $(dir)/main_default.tex;)
	$(foreach dir, $(DIRS), cp $(dir)/main_default.pdf $(OUTDIR)/$(dir).pdf;)

fullurl: $(OUTDIR)
	$(foreach dir, $(DIRS), latexmk -pdf -cd $(dir)/main_fullurls.tex;)
	$(foreach dir, $(DIRS), cp $(dir)/main_fullurls.pdf $(OUTDIR)/$(dir)-fullurls.pdf;)

$(OUTDIR):
	mkdir -p $(OUTDIR)

clean:
	$(foreach dir, $(DIRS), latexmk -C -cd $(dir)/main_default.tex;)
	$(foreach dir, $(DIRS), rm -f $(dir)/main_default.pdf $(dir)/main_fullurls.pdf $(dir)/*.aux $(dir)/*.log $(dir)/*.out $(dir)/*.fls $(dir)/*.fdb_latexmk $(dir)/*.synctex.gz;)
	rm -rf $(OUTDIR)

# Individual targets
games: $(OUTDIR)
	latexmk -pdf -cd resume-games/main_default.tex
	cp resume-games/main_default.pdf $(OUTDIR)/resume-games.pdf

games-full: $(OUTDIR)
	latexmk -pdf -cd resume-games/main_fullurls.tex
	cp resume-games/main_fullurls.pdf $(OUTDIR)/resume-games-fullurls.pdf

games-ai: $(OUTDIR)
	latexmk -pdf -cd resume-games-ai/main_default.tex
	cp resume-games-ai/main_default.pdf $(OUTDIR)/resume-games-ai.pdf

games-ai-full: $(OUTDIR)
	latexmk -pdf -cd resume-games-ai/main_fullurls.tex
	cp resume-games-ai/main_fullurls.pdf $(OUTDIR)/resume-games-ai-fullurls.pdf

web-ai: $(OUTDIR)
	latexmk -pdf -cd resume-web-ai/main_default.tex
	cp resume-web-ai/main_default.pdf $(OUTDIR)/resume-web-ai.pdf

web-ai-full: $(OUTDIR)
	latexmk -pdf -cd resume-web-ai/main_fullurls.tex
	cp resume-web-ai/main_fullurls.pdf $(OUTDIR)/resume-web-ai-fullurls.pdf