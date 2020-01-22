\NeedsTeXFormat{LaTeX2e} % TODO
\ProvidesClass{japo}[Richtlinien Wissenschaftliches Arbeiten UzK, Stand Juni 2019]

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

\newcommand{\@japfacultyleading}{16pt}

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
	\vspace{6.5cm}
	\begin{center}
		\huge \@title\\
		[0.2cm]
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
		[0.75cm]
		\@japdocaddress\\
	\end{center}
	\end{titlepage}
}

\RequirePackage[ngerman]{babel} % spell checker
\RequirePackage{leading} % Zeilenabstand in pt.
\RequirePackage{mathptmx} % Times New Roman
\RequirePackage{luatexja-fontspec} % Kanji
\RequirePackage{fancyhdr} % page number positioning
\RequirePackage{csquotes}
\RequirePackage{xspace}
\RequirePackage{boxedminipage}
\RequirePackage[a4paper, left=2cm, right=3cm, top=2.5cm, bottom=2cm, includefoot]{geometry}
\RequirePackage[parfill]{parskip}
%\RequirePackage[nolist]{acronym}

\leading{\@japfacultyleading}

\setlength\parindent{0pt}
%TODO \setlength\parskip{\@japfacultyleading}

%TODO is this formally required?
\pagestyle{fancy}
% remove pre-configured fancyhdr stuff
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\fancyfoot[R]{\thepage}

%\newcommand{\japterm}[3]{\acrodef{#1}[#1]{\textit{#1} #2 (#3)}}
%\newcommand{\japref}[1]{\ac{#1}}

%TODO quot
%TODO acronyms japanese