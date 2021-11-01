# LaTeX-Formatvorlage `japuzk`

Dies ist eine frei verfügbare, inoffizielle Formatvorlage, die die Vorgaben für das Wissenschaftliche Arbeiten am Ostasiatischen Seminar, Abteilung Japanologie der Universität zu Köln in `LaTeX` umsetzt.

**Es handelt sich um ein studentisches Projekt "Marke Eigenbau". Es werden keinerlei Garantien oder Haftung übernommen!**

## Voraussetzungen

Die mit dieser Formatvorlage verfassten Dokumente müssen mit `lualatex` kompiliert werden. Dieser Compiler hat das einzige (aktuelle) Ökosystem für die Arbeit mit japanischen Fonts.

## Installation

Die drei Dateien `japuzk.cls`, `japuzkbib.bbx` und `japuzkbib.cbx` müssen für LaTeX verfügbar gemacht werden. In den meisten TeX-Systemen geht dies beispielsweise durch Nutzung des lokalen TeX-Verzeichnisses `$HOME/texmf/tex/latex/`

```bash
$HOME/texmf/tex
└── latex
	├── biblatex
	│	├── bbx
	│	│	└── japuzkbib.bbx
	│	└── cbx
	│		└── japuzkbib.cbx
	└── japuzk
		└── japuzk.cls
```

*Tipp*: Diese Dateien können auch als Symlinks angelegt werden, die dann auf dieses GitHub-Repository verweisen. So werden bei einem einfachen `git pull` alle Änderungen sofort in das LaTeX-Build-System propagiert.

## Verwendung

Die Formatvorlage kann mit `\documentclass{japuzk}` eingebunden werden. Weitere Anpassungen des Formates insgesamt stehen derzeit nicht zur Verfügung.

Alle benötigten Pakete werden automatisch geladen. Insbesondere greift die Formatvorlage für den japanischen Textsatz auf `luatexja` zurück.

### Titelseite

Für das Befüllen der Titelseite stehen folgende Befehle zur Verfügung:

- `\title{}`: Titel der Arbeit
- `\subtitle{}`: Titel des Moduls
- `\date{}`: Datum
- `\author{}`: Vorname Nachname
- `\japdocModuleTitle{}`: Titel des Moduls
- `\japdocType{}`: Hausarbeit / Essay
- `\japdocLvTitle{}`: Titel der Lehrveranstaltung
- `\japdocSemester{}`: Winter / Sommersemester 20XX
- `\japdocSupervisor{}`: (Prof. Dr. / Dr.) Name des Dozierenden
- `\japdocMatriculation{}`: Matrikelnummer
- `\japdocStudySemester{}`: XX
- `\japdocFieldOfStudy{}`: Studiengang
- `\japdocEmail{}`: E-Mail-Adresse
- `\japdocAddress{}`: Straße Hausnummer, PLZ Ort

### Japanische Begriffe

Die korrekte Verwendung von japanischen Begriffen wird über ein internes Glossar implementiert. Ähnlich wie in einer naturwissenschaftlichen Publikation, bei der Maßeinheiten das erste Mal beim vollen Namen genannt und im folgenden nur noch über das Formelzeichen referenziert werden, wird hier bei der ersten Nennung eines Begriffes die _rômaji_-Lateinumschrift mitsamt der Kanji (und eventuell weiterer relevanter Daten) angezeigt, danach nur noch die _rômaji_.

Die Formatvorlage kann **nicht** automatisch transkribieren. Die Datenbank aus Einträgen mit _rômaji_ und _kanji_ muss manuell im Präambel des Dokuments gepflegt werden. Dazu stehen folgende Befehle bereit:

- `\japterm{kanji}{漢字}`: Japanischer Begriff.
- `\japtermTranslate{shôjo manga}{少女マンガ}{Mädchencomic}`: Japanischer Begriff mit Übersetzung.
- `\japtermName{Toyotomi}{Hideyoshi}{豊臣秀吉}{1537}{1598}`: Japanischer Name mit Lebensdaten.
- `\japtermWesternName{Obama}{Barack}{1961}{}`: Westlicher Name mit Lebensdaten.
- `\japtermEra{Meiji}{1868}{1912}`: Ära der japanischen Zeitrechnung.

Diese Einträge können dann im Fließtext mithilfe des Befehls `\japref{id}` eingebunden werden. Der Befehl entscheidet selbstständig, ob es sich um die erste Nennung im Dokument handelt und demnach die volle oder die kurze Darstellungsform abgedruckt werden sollte.

Die `id` ist dabei stets das erste Argument der jeweiligen `\japterm...` Befehle: `\japref{kanji}`, `\japref{Obama}`. Manche Systeme haben Schwierigkeiten mit nicht-ASCII-Zeichen als `id`, daher gibt es für jeden `\japterm` Befehl entsprechende `\japtermId` Pendants: `\japtermTranslateId`, `\japtermEraId` usw. Diese nehmen als **zusätzliches erstes** Argument eine manuelle `id`, die dann für `\japref` verwendet werden kann:

```latex
\japtermId{shoujo-manga}{shôjo manga}{少女マンガ}{Mädchencomic}

\begin{document}
	Es handelt sich um \japref{shoujo-manga}. Abbildung 42 zeigt einen Auszug aus einem \japref{shoujo-manga}.
	% Ergibt: "Es handelt sich um shôjo manga 少女マンガ (Mädchencomic). Abbildung 42 zeigt einen Auszug aus einem shôjo manga"
	% (inklusive Kursivsetzung von "shôjo manga" in beiden Fällen, die in Markdown-Codeblöcken technisch leider nicht möglich ist)
\end{document}
```

Standardmäßig lösen `\japrefName` und `\japrefWesternName` bei Folgenennungen zum Nachnamen auf. In manchen Fällen, insbesondere bei Künstlernamen oder sonstigen Pseudonymen, soll jedoch die Folgenennung den Vornamen nutzen. Dies kann über das zusätzliche **optionale** Argument `[pre]` realisiert werden:

```latex
\japtermNameId[pre]{souseki}{Natsume}{Sôseki}{夏目漱石}{1867}{1916}

\begin{document}
	Das Buch wurde von \japref{souseki} verfasst. \japref{souseki} ist ein japanischer Autor.
	% Ergibt: "Sôseki ist ein japanischer Autor" anstatt wie sonst üblich "NATSUME ist ein japanischer Autor"
\end{document}
```

**ACHTUNG**: Die unterliegende Implementation des Glossars liefert das Paket `glossaries-extra`. Es ist daher nicht möglich, eigene Glossare über dieses Paket zu führen. Die Konfiguration gerät sonst in Konflikt mit den japanischen Begriffen.

### Bibliographie

Die Bibliographie-Formate beruhen im wesentlichen auf dem großartigen Paket `geschichtsfrkl`. Es wurde geringfügig angepasst, um die genauen Vorgaben unserer Fakultät zu erfüllen und für unsere Zwecke unnötige Features (weitestgehend) zu entfernen.

Beispiele für die einzelnen bibliographischen Angaben sind in `sample.bib` zu finden. Die Arbeit mit japanischen Zeichen ist separat im Dokument `sample.tex` erklärt.
