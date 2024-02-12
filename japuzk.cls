\NeedsTeXFormat{LaTeX2e} % TODO
\ProvidesClass{japuzk}[Richtlinien Wissenschaftliches Arbeiten UzK, Stand Juni 2019]

\LoadClass[12pt,parskip=half]{scrartcl}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\newcommand{\japdoctype}[1]{\japdocType{#1}}
\newcommand{\japdocType}[1]{\gdef\@japdocType{#1}}
\newcommand{\japdocmoduletitle}[1]{\japdocModuleTitle{#1}}
\newcommand{\japdocModuleTitle}[1]{\gdef\@japdocModuleTitle{#1}}
\newcommand{\japdoclvtitle}[1]{\japdocLvTitle{#1}}
\newcommand{\japdocLvTitle}[1]{\gdef\@japdocLvTitle{#1}}
\newcommand{\japdocsemester}[1]{\japdocSemester{#1}}
\newcommand{\japdocSemester}[1]{\gdef\@japdocSemester{#1}}
\newcommand{\japdocsupervisor}[1]{\japdocSupervisor{#1}}
\newcommand{\japdocSupervisor}[1]{\gdef\@japdocSupervisor{#1}}
\newcommand{\japdocmatriculation}[1]{\japdocMatriculation{#1}}
\newcommand{\japdocMatriculation}[1]{\gdef\@japdocMatriculation{#1}}
\newcommand{\japdocstudysemester}[1]{\japdocStudySemester{#1}}
\newcommand{\japdocStudySemester}[1]{\gdef\@japdocStudySemester{#1}}
\newcommand{\japdocfieldofstudy}[1]{\japdocFieldOfStudy{#1}}
\newcommand{\japdocFieldOfStudy}[1]{\gdef\@japdocFieldOfStudy{#1}}
\newcommand{\japdocemail}[1]{\japdocEmail{#1}}
\newcommand{\japdocEmail}[1]{\gdef\@japdocEmail{#1}}
\newcommand{\japdocaddress}[1]{\japdocAddress{#1}}
\newcommand{\japdocAddress}[1]{\gdef\@japdocAddress{#1}}

\newcommand{\japfacultyhomepage}{https://japanologie.phil-fak.uni-koeln.de/}

\renewcommand{\maketitle}{
	\begin{titlepage}
	\begin{minipage}{\textwidth}
		\flushleft
		Universität zu Köln\\
		Ostasiatisches Seminar\\
		Abteilung Japanologie
	\end{minipage}
	%\hfill
	%\begin{minipage}{0.45\textwidth}
	%	\flushright
	%\end{minipage}
	\vspace{6.0cm}
	\begin{center}
		\huge \@title \ifx\@subtitle\@empty{\\[0.7cm]}\else{\\[0.2cm]}\fi
		\Large \ifx\@subtitle\@empty{}\else{\@subtitle\\[0.7cm]}\fi
		\normalsize \@japdocModuleTitle\\
		\@japdocType~in der Veranstaltung\\	
		\enquote{\@japdocLvTitle}\\
		im \@japdocSemester\\
		Bei \@japdocSupervisor\\
	\end{center}
	\vfill
	\begin{center}
		Eingereicht am \@date\\	
		von\\
		\@author\\
		Matrikelnummer: \@japdocMatriculation\\
		{\@japdocStudySemester}. Fachsemester\\
		\@japdocFieldOfStudy\\
		\@japdocEmail\\
		%[0.75cm]
		%\@japdocAddress\\
	\end{center}
	\end{titlepage}
	\setcounter{page}{1}
}

\let\OldTableofcontents\tableofcontents
\renewcommand{\tableofcontents}{
	\thispagestyle{empty}
	\OldTableofcontents
	\pagebreak
	\setcounter{page}{1}
}

\RequirePackage[ngerman]{babel} % spell checker
\RequirePackage{leading} % Zeilenabstand in pt.
%\RequirePackage{mathptmx} % Times New Roman
\RequirePackage{luatexja-fontspec} % Kanji
\RequirePackage{scrlayer-scrpage}
\RequirePackage{csquotes}
\RequirePackage{xspace}
\RequirePackage{boxedminipage}
\RequirePackage[a4paper, left=2cm, right=3cm, top=2.5cm, bottom=2cm, includefoot]{geometry}
\RequirePackage[acronyms,xindy]{glossaries-extra}
\RequirePackage[hang]{footmisc}
\RequirePackage{ifthen}
\RequirePackage[
	backend=biber,
	style=japuzkbib,
	abbreviate=true,
	block=space,
	sortlocale=de_DE,
	autolang=other,
	maxnames=3,
	mits=true,
	mitjahr=false,
	citeinit=false
]{biblatex}

\newcommand{\@japfacultyleading}{16pt}
\leading{\@japfacultyleading}

\cfoot*{} % empty center footmark
\ofoot*{\pagemark} % page number right (outer) footmark

% glossaries parenthesis behavior
\setabbreviationstyle[acronym]{long-only-short-only}

% japterm(?id, romaji, kokuji)
\newcommand{\japterm}[2]{\japtermId{#1}{#1}{#2}}
\newcommand{\japtermId}[3]{
	\newacronym{#1}{\textit{#2}}{\textit{#2}\space#3}
}

% japtermTranslate(?id, romaji, kokuji, translation)
\newcommand{\japtermtranslate}[3]{\japtermTranslate{#1}{#2}{#3}}
\newcommand{\japtermTranslate}[3]{\japtermTranslateId{#1}{#1}{#2}{#3}}
\newcommand{\japtermtranslateId}[4]{\japtermTranslateId{#1}{#2}{#3}{#4}}
\newcommand{\japtermTranslateId}[4]{
	\japtermId{#1}{#2}{#3\space(#4)}
}
% japtermName[position](?id, family, name, kanji, from, to)
\newcommand{\japtermname}[6][std]{\japtermName[#1]{#2}{#3}{#4}{#5}{#6}}
\newcommand{\japtermName}[6][std]{
	\ifthenelse{\equal{#1}{pre}}{
		\japtermNameId[#1]{#3}{#2}{#3}{#4}{#5}{#6}
	}{
		\japtermNameId[#1]{#2}{#2}{#3}{#4}{#5}{#6}
	}
}
\newcommand{\japtermnameId}[7][std]{\japtermNameId[#1]{#2}{#3}{#4}{#5}{#6}{#7}}
\newcommand{\japtermNameId}[7][std]{
	\ifthenelse{\equal{#1}{pre}}{
		\newacronym{#2}{#4}{\MakeUppercase{#3}\space#4\space#5\space(#6-#7)}
	}{
		\newacronym{#2}{#3}{\MakeUppercase{#3}\space#4\space#5\space(#6-#7)}
	}
}
% japtermWesternName(?id, fullname, kanji, from, to)
\newcommand{\japtermwesternname}[4]{\japtermWesternName{#1}{#2}{#3}{#4}}
\newcommand{\japtermWesternName}[4]{\japtermWesternNameId{#1}{#1}{#2}{#3}{#4}}
\newcommand{\japtermwesternnameId}[5]{\japtermWesternNameId{#1}{#2}{#3}{#4}{#5}}
\newcommand{\japtermWesternNameId}[5]{
	\japtermId{#1}{#2}{#3\space(#4-#5)}
}
% japtermMedium(?id, name, kanji, release, meaning)
\newcommand{\japtermmedium}[4]{\japtermMedium{#1}{#2}{#3}{#4}}
\newcommand{\japtermMedium}[4]{\japtermMediumId{#1}{#1}{#2}{#3}{#4}}
\newcommand{\japtermmediumId}[5]{\japtermMediumId{#1}{#2}{#3}{#4}{#5}}
\newcommand{\japtermMediumId}[5]{
	\japtermId{#1}{#2}{#3\space(#4, dt. #5)}
}
% japtermEra(?id, name, from, to)
\newcommand{\japtermera}[3]{\japtermEra{#1}{#2}{#3}}
\newcommand{\japtermEra}[3]{\japtermEraId{#1}{#1}{#2}{#3}}
\newcommand{\japtermeraId}[4]{\japtermEraId{#1}{#2}{#3}{#4}}
\newcommand{\japtermEraId}[4]{
	\newacronym{#1}{#2}{#2-Zeit (#3-#4)}
}

\newcommand{\japref}[1]{\gls{#1}}
