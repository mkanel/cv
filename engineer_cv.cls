\ProvidesClass{engineer_cv}[2017/09/18 Engineer CV class]
\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}

%------------------------------------------------------------------------------
%	 REQUIRED PACKAGES
%------------------------------------------------------------------------------

\RequirePackage[quiet]{fontspec}
\RequirePackage[sfdefault]{ClearSans}

\def\arrow#1{\pspicture[shift=2pt](#1,0)\psline{->}(#1,0)\endpspicture}

\usepackage{pstricks}

\usepackage{fontawesome}
\RequirePackage{tikz}
\RequirePackage{xcolor}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{ragged2e}
\RequirePackage{etoolbox}
\RequirePackage{ifmtarg}
\RequirePackage{ifthen}
\RequirePackage{pgffor}
\RequirePackage{marvosym}
\RequirePackage{parskip}

\usepackage{enumitem}
\setlist[itemize]{leftmargin=*}

\RequirePackage[hidelinks]{hyperref}
\hypersetup{
	pdftitle={},
	pdfauthor={},
	pdfsubject={},
	pdfkeywords={},
	colorlinks=false,           % no lik border color
	allbordercolors=white       % white border color for all
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\ifxetex
  \usepackage{letltxmacro}
  \setlength{\XeTeXLinkMargin}{1pt}
  \LetLtxMacro\SavedIncludeGraphics\includegraphics
  \def\includegraphics#1#{% #1 catches optional stuff (star/opt. arg.)
	\IncludeGraphicsAux{#1}%
  }%
  \newcommand*{\IncludeGraphicsAux}[2]{%
	\XeTeXLinkBox{%
	  \SavedIncludeGraphics#1{#2}%
	}%
  }%
\fi

%------------------------------------------------------------------------------
%	 COLOURS
%------------------------------------------------------------------------------

\definecolor{materialindigo}{HTML}{3F51B5}
\definecolor{materialblue}{HTML}{2196F3}
\definecolor{materialcyan}{HTML}{00BCD4}
\definecolor{materialteal}{HTML}{009688}
\definecolor{materialgreen}{HTML}{4CAF50}
\definecolor{materiallime}{HTML}{CDDC39}
\definecolor{materialamber}{HTML}{FFC107}
\definecolor{materialbrown}{HTML}{795548}
\definecolor{materialred}{HTML}{FF4436}
\definecolor{materialorange}{HTML}{FF5722}

\definecolor{white}{HTML}{FFFFFF}
\definecolor{black}{HTML}{000000}
\definecolor{blue}{HTML}{397DDA}
\definecolor{red}{HTML}{FF3D3D}

\definecolor{mat_green}{HTML}{408000}
\definecolor{mat_red}{HTML}{802000}

\definecolor{grey}{HTML}{4D4D4D}
\definecolor{light_grey}{RGB}{210,210,210}
\definecolor{dark_gray}{HTML}{333333}

\definecolor{grey0}{RGB}{240,240,240}
\definecolor{grey1}{RGB}{220,220,220}
\definecolor{grey2}{RGB}{200,200,200}
\definecolor{grey3}{RGB}{180,180,180}
\definecolor{grey4}{RGB}{160,150,160}
\definecolor{grey5}{RGB}{140,140,140}
\definecolor{grey6}{RGB}{120,120,120}
\definecolor{grey7}{RGB}{100,100,100}
\definecolor{grey8}{RGB}{80,80,80}
\definecolor{grey9}{RGB}{60,60,60}
\definecolor{grey10}{RGB}{40,40,40}


\definecolor{lena_petrol}{HTML}{226666}
\definecolor{lena_raf}{HTML}{4FB6BB}

%------------------------------------------------------------------------------
%	 TEDI COLORS
%------------------------------------------------------------------------------

\ifdefined\bwPrint
	% Black and white
	\colorlet{textcolor}{black}
	\colorlet{sidecolor}{light_grey}
	\colorlet{headercolor}{black}

	\colorlet{header}{black}

	\colorlet{linkedin}{black}
	\colorlet{site}{black}
	\colorlet{mail}{black}

	\colorlet{progSkillsBar}{dark_gray}
	\colorlet{backgroundBar}{white}
	\colorlet{myColour}{black}
	\colorlet{titleColor}{black}
	\colorlet{firstThreeLetters}{black}
	%\colorlet{boldText}{black}

	\colorlet{skill_center}{grey0}
	\colorlet{skill_1}{grey1}
	\colorlet{skill_2}{grey2}
	\colorlet{skill_3}{grey3}
	\colorlet{skill_4}{grey4}
	\colorlet{skill_5}{grey5}
	\colorlet{skill_6}{grey6}
	\colorlet{skill_7}{grey1}
	\colorlet{skill_8}{grey2}
	\colorlet{skill_9}{grey3}
	\colorlet{skill_10}{grey4}
\else
	% Red
	\colorlet{cv_main_color}{mat_green}

	\colorlet{textcolor}{grey}
	\colorlet{sidecolor}{light_grey}
	\colorlet{headercolor}{grey}

	\colorlet{fillheader}{red}
	\colorlet{header}{grey}

	\colorlet{linkedin}{blue}
	\colorlet{site}{blue}
	\colorlet{mail}{mat_red}

	\colorlet{progSkillsBar}{cv_main_color}
	\colorlet{backgroundBar}{white}
	\colorlet{myColour}{cv_main_color}
	\colorlet{titleColor}{grey}
	\colorlet{firstThreeLetters}{cv_main_color}
	%\colorlet{boldText}{black}

	\colorlet{skill_center}{cv_main_color}
	\colorlet{skill_1}{materialblue}
	\colorlet{skill_2}{materialcyan}
	\colorlet{skill_3}{materialteal}
	\colorlet{skill_4}{lena_petrol}
	\colorlet{skill_5}{lena_raf}
	\colorlet{skill_6}{materialamber}
	\colorlet{skill_7}{materialbrown}
	\colorlet{skill_8}{materialred}
	\colorlet{skill_9}{materialorange}
	\colorlet{skill_10}{materialindigo}
\fi

%------------------------------------------------------------------------------
%	 MISC CONFIGURATIONS
%------------------------------------------------------------------------------

%\renewcommand{\bfseries}{\color{boldText}} % Make \textbf produce coloured text instead

\pagestyle{empty} % Disable headers and footers

\setlength{\parindent}{0pt} % Disable paragraph indentation

% -----------------------------------------------------------------------------
% 	FONTS
%------------------------------------------------------------------------------
\newfontfamily\headingfont[Path = fonts/]{coolvetica rg.ttf}

%------------------------------------------------------------------------------
%	 SIDEBAR DEFINITIONS
%------------------------------------------------------------------------------

\setlength{\TPHorizModule}{1cm} % Left margin
\setlength{\TPVertModule}{1cm} % Top margin

\newlength\imagewidth
\newlength\imagescale
\pgfmathsetlength{\imagewidth}{5cm}
\pgfmathsetlength{\imagescale}{\imagewidth/600}

\newcommand{\profilesection}[2]{\vspace{8pt}{\color{black!80} \huge #1 \rule[0.15\baselineskip]{#2}{1pt}}}

% Define custom commands for CV info
\newcommand{\cvdate}[1]{\renewcommand{\cvdate}{#1}}
\newcommand{\cvlinkedin}[1]{\renewcommand{\cvlinkedin}{#1}}
\newcommand{\cvgithub}[1]{\renewcommand{\cvgithub}{#1}}
\newcommand{\cvmail}[1]{\renewcommand{\cvmail}{#1}}
\newcommand{\cvnumberphone}[1]{\renewcommand{\cvnumberphone}{#1}}
\newcommand{\cvaddress}[1]{\renewcommand{\cvaddress}{#1}}
\newcommand{\cvsite}[1]{\renewcommand{\cvsite}{#1}}
\newcommand{\aboutme}[1]{\renewcommand{\aboutme}{#1}}
\newcommand{\profilepic}[1]{\renewcommand{\profilepic}{#1}}
\newcommand{\cvname}[1]{\renewcommand{\cvname}{#1}}
\newcommand{\cvjobtitle}[1]{\renewcommand{\cvjobtitle}{#1}}

% Command for printing the contact information icons
\newcommand*\icon[1]{\tikz[baseline=(char.base)]{\node[shape=circle,draw,inner sep=1pt, fill=mainblue,mainblue,text=white] (char) {#1};}}

%------------------------------------------------------------------------------
%    TEDI CUSTOM COMMANDS
%------------------------------------------------------------------------------

\newcommand\projects[1]{ 
	\renewcommand{\projects}{
		{#1}
	}
}

\newcommand{\progSkillsCounter}[1]
{
	\def\x{#1}
	\begin{tikzpicture}
		\node [above right] at (0, 6) {$0 \: LOC \: \arrow{3.2} \: \x \: LOC$};
	\end{tikzpicture}
}

\newcommand{\countProgrammingLanguage}[2]
{
	\def\x{#1}
	\def\y{#2}
	\begin{tikzpicture}
		\draw[fill=backgroundBar,backgroundBar] (0,0)rectangle (6,0.1);
		\draw[fill=white,progSkillsBar]         (0,0)rectangle (\y*0.06,0.1);
		\node [above right] at (0,0.1) {\x};
	\end{tikzpicture}
}

%------------------------------------------------------------------------------
%  SIDEBAR LAYOUT (RROFILE)
%------------------------------------------------------------------------------

\newcommand{\makeprofile}{
	\begin{tikzpicture}[remember picture,overlay]
	   \node [rectangle, fill=sidecolor, anchor=north, minimum width=9cm, minimum height=\paperheight+1cm] (box) at (-5cm,0.5cm){};
	\end{tikzpicture}
	
	%------------------------------------------------
	
	\begin{textblock}{6}(0.5, 0.2)
	
		%------------------------------------------------
		
		\vspace{4mm}
		{\Huge\color{myColour}\cvname}
		
		\vspace{2mm}

		%------------------------------------------------
		
		{\Large\color{titleColor}\cvjobtitle}

		%------------------------------------------------
		
		\vspace{3mm}
		\renewcommand{\arraystretch}{2}
		\begin{tabular}{p{1cm} @{\hskip 0.5cm}p{5cm}}
			\ifthenelse{\equal{\cvnumberphone}{}}{}
			{
				{$
					\begin{array}{l}
					\hspace{4mm} \Huge \textnormal{\faMobile} 
					\end{array}
					$} 
				& \cvnumberphone\\}
			\ifthenelse{\equal{\cvsite}{}}{}{
				{$
					\begin{array}{l}
					\hspace{2.8mm} \huge \textnormal{\textcolor{site}{\faGlobe}}
					\end{array}
					$}
				& \href{http://\cvsite}{\cvsite} \\}
			\ifthenelse{\equal{\cvmail}{}}{}{

				{$
					\begin{array}{l}
					\hspace{2.5mm} \huge \textnormal{\textcolor{mail}{\faEnvelopeO}}
					\end{array}
				$}
				& \href{mailto:\cvmail}{\cvmail} \\}
		  
			\ifthenelse{\equal{\cvlinkedin}{}}{}{
				{$
					\begin{array}{l}
					\hspace{3mm} \huge \textnormal{\textcolor{linkedin}{\faLinkedin}}
					\end{array}
					$}
				& \href{https://www.linkedin.com\cvlinkedin}{\cvlinkedin} \\}
			\ifthenelse{\equal{\cvgithub}{}}{}{
				{$
					\begin{array}{l}
					\hspace{3mm} \huge \textnormal{\faGithub}
					\end{array}
					$}
				& \href{https://www.github.com/\cvgithub}{\cvgithub} \\}            
		\end{tabular}

		%------------------------------------------------
		\vspace{3mm}
		\profilesection{Skills}{4cm}
		
		{\large \textbf{Overview}}

		   \skills
			
		%------------------------------------------------

		\vspace{2mm}

		{\large \textbf{Tools}}

			\countProgrammingLanguage{MS Office}{97}
			\countProgrammingLanguage{Spss}{97}
			\countProgrammingLanguage{Matlab}{92}
			\countProgrammingLanguage{Eviews}{74}
			\countProgrammingLanguage{Mathematica}{80}
			\countProgrammingLanguage{Efchaos}{95}
			\countProgrammingLanguage{Maxima}{99}
			\countProgrammingLanguage{R}{60}

		\vspace{2mm}

		{\large \textbf{Programming}}

			\countProgrammingLanguage{Python}{3}

		\vspace{2mm}

		{\large \textbf{OS}}

			\countProgrammingLanguage{Windows}{100}
			\countProgrammingLanguage{GNU/Linux}{85}

	\end{textblock}
}

%------------------------------------------------------------------------------
%  SIDEBAR LAYOUT (INFOGRAPHICS)
%------------------------------------------------------------------------------

\newcommand{\infographics}{
	\begin{tikzpicture}[remember picture,overlay]
	   \node [rectangle, fill=sidecolor, anchor=north, minimum width=9cm, minimum height=\paperheight+1cm] (box) at (-5cm,0.5cm){};
	\end{tikzpicture}
	
	%------------------------------------------------
	
	\begin{textblock}{6}(0.5, 0.2)

		%------------------------------------------------

		\vspace{4mm}

		\profilesection{Mini Projects}{1.7cm}

			\projects
	\end{textblock}
}


%------------------------------------------------------------------------------
%	 COLOURED SECTION TITLE BOX
%------------------------------------------------------------------------------

% Command to create the rounded boxes around the first three letters of section titles
\newcommand*\round[2]{%
	\tikz[baseline=(char.base)]\node[anchor=north west, draw,rectangle, rounded corners, inner sep=1.6pt, minimum size=5.5mm, text height=3.6mm, fill=#2,#2,text=white](char){#1};%
}

\def\@sectioncolor#1#2#3{%
	{%
		\color{firstThreeLetters} #1#2#3%
	}%
}

\renewcommand{\section}[1]
{
	\par\vspace{\parskip}
	{%
		\LARGE\headingfont\color{headercolor}%
		\@sectioncolor #1%
	}
	\par\vspace{\parskip}
}

\renewcommand{\subsection}[1]
{
	\par\vspace{.5\parskip}
	{%
		\Large\headingfont\color{headercolor} #1%
	}
	\par\vspace{.25\parskip}%
}

\pagestyle{empty}

%------------------------------------------------------------------------------
%	 LONG LIST ENVIRONMENT
%------------------------------------------------------------------------------

\setlength{\tabcolsep}{0pt}

% New environment for the long list
\newenvironment{longList}{%
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
	\end{tabular*}
}

\newcommand{\longListItem}[6]{%
	#1&\parbox[t]{0.83\textwidth}{%
		\textbf{#3}% 
		\hfill%
		{\footnotesize#4}%
		}\\%
	#2&\parbox[t]{0.83\textwidth}{%
		\ifblank{#5}{}{#5 \\}
		#6%
	}\\
}

%------------------------------------------------------------------------------
%	 SMALL LIST ENVIRONMENT
%------------------------------------------------------------------------------

\setlength{\tabcolsep}{0pt}

% New environment for the small list
\newenvironment{shortList}{%
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
	\end{tabular*}
}

\newcommand{\shortListItem}[2]{%
	#1&\parbox[t]{0.83\textwidth}{%
		#2%
	}\\
}

%------------------------------------------------------------------------------
%	 MARGINS AND LINKS
%------------------------------------------------------------------------------

\RequirePackage[left=7.6cm,top=0.1cm,right=1cm,bottom=0.1cm,nohead,nofoot]{geometry}


\usepackage{smartdiagram}
\smartdiagramset{
	bubble center node font = \footnotesize,
	bubble node font = \footnotesize,
	% specifies the minimum size of the bubble center node
	bubble center node size = 0.5cm,
	%  specifies the minimum size of the bubbles
	bubble node size = 0.5cm,
	% specifies which is the distance among the bubble center node and the other bubbles
	distance center/other bubbles = 0.3cm,
	% sets the distance from the text to the border of the bubble center node
	distance text center bubble = 0.5cm,
	% set center bubble color
	bubble center node color = skill_center,
	% define the list of colors usable in the diagram
	%et color list = {lightgray, materialcyan, orange, green, materialorange, materialteal, materialamber, materialindigo, materialgreen, materiallime},
	set color list = {skill_1, skill_2, skill_3, skill_4, skill_5, skill_6, skill_7, skill_8, skill_9, skill_10},
	% sets the opacity at which the bubbles are shown
	bubble fill opacity = 0.6,
	% sets the opacity at which the bubble text is shown
	bubble text opacity = 1,
}
