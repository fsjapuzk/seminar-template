\NeedsTeXFormat{LaTeX2e} % TODO
\ProvidesClass{japuzk}[Richtlinien Wissenschaftliches Arbeiten UzK, Stand Juni 2019]

\LoadClass[12pt]{scrartcl}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\newcommand{\japdoctype}[1]{\gdef\@japdoctype{#1}}
\newcommand{\japdocmoduletitle}[1]{\gdef\@japdocmoduletitle{#1}}
\newcommand{\japdoclvtitle}[1]{\gdef\@japdoclvtitle{#1}}
\newcommand{\japdocsemester}[1]{\gdef\@japdocsemester{#1}}
\newcommand{\japdocsupervisor}[1]{\gdef\@japdocsupervisor{#1}}
\newcommand{\japdocmatriculation}[1]{\gdef\@japdocmatriculation{#1}}
\newcommand{\japdocstudysemester}[1]{\gdef\@japdocstudysemester{#1}}
\newcommand{\japdocfieldofstudy}[1]{\gdef\@japdocfieldofstudy{#1}}
\newcommand{\japdocemail}[1]{\gdef\@japdocemail{#1}}
\newcommand{\japdocaddress}[1]{\gdef\@japdocaddress{#1}}

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
		\huge \@title\\
		[0.7cm]
		\normalsize \@japdocmoduletitle\\
		\@japdoctype~in der Veranstaltung\\	
		\enquote{\@japdoclvtitle}\\
		im \@japdocsemester\\
		Bei \@japdocsupervisor\\
	\end{center}
	\vfill
	\begin{center}
		Eingereicht am \@date\\	
		von\\
		\@author\\
		Matrikelnummer: \@japdocmatriculation\\
		{\@japdocstudysemester}. Fachsemester\\
		\@japdocfieldofstudy\\
		\@japdocemail\\
		%[0.75cm]
		%\@japdocaddress\\
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
\RequirePackage{fancyhdr} % page number positioning
\RequirePackage{csquotes}
\RequirePackage{xspace}
\RequirePackage{boxedminipage}
\RequirePackage[a4paper, left=2cm, right=3cm, top=2.5cm, bottom=2cm, includefoot]{geometry}
\RequirePackage[parfill]{parskip}
\RequirePackage[acronyms,xindy]{glossaries-extra}
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
	hrsg=true,
	citeinit=false
]{biblatex}

\newcommand{\@japfacultyleading}{16pt}
\leading{\@japfacultyleading}

\setlength\parindent{0pt}
%TODO \setlength\parskip{\@japfacultyleading}

%TODO is this formally required?
\pagestyle{fancy}
% remove pre-configured fancyhdr stuff
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\fancyfoot[R]{\thepage}

% glossaries parenthesis behavior
\setabbreviationstyle[acronym]{long-only-short-only}

% japterm(romaji, kokuji)
\newcommand{\@japtermrawsqueeze}[2]{
	\newacronym{#1}{\textit{#1}}{#1#2}
}
\newcommand{\@japtermraw}[2]{
	\newacronym{#1}{\textit{#1}}{#1\space#2}
}
\newcommand{\japterm}[2]{
	\newacronym{#1}{\textit{#1}}{\textit{#1}\space#2}
}

\newcommand{\japtermtranslate}[3]{\japterm{#1}{#2\space(#3)}}
% japtermname(family, name, kanji, from, to)
\newcommand{\japtermname}[5]{\@japtermraw{#1}{#2\space#3\space(#4-#5)}}
\newcommand{\japtermwesternname}[4]{\japterm{#1}{#2\space(#3-#4)}}
% japtermmedium(name, kanji, release, meaning)
\newcommand{\japtermmedium}[4]{\japterm{#1}{#2\space(#3, dt. #4)}}
% japtermera(name, from, to)
\newcommand{\japtermera}[3]{\@japtermrawsqueeze{#1}{-Zeit (#2-#3)}}

% TODO nice acronyms style
% FIXME japref with names that contain non-ascii
\newcommand{\japref}[1]{\gls{#1}}
