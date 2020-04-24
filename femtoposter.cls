\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{femtoposter}[2020/04/23 Femto-ST poster template]

\LoadClass{article}

\newcommand{\postermargin}{1.45cm}

\RequirePackage[a0paper,margin=\postermargin]{geometry}
\RequirePackage{tikz}
\RequirePackage{fontspec}
\RequirePackage{xcolor}
\RequirePackage{ragged2e}
\RequirePackage{enumitem}
\RequirePackage{float}
\RequirePackage{caption}
\RequirePackage{lmodern} % avoids annoying font shapes warnings

% Define fonts
\setmainfont[Ligatures=TeX]{arial}[
	Path=fonts/,
	Extension=.ttf,
	BoldFont=arialbd,
	ItalicFont=ariali
]

\newfontfamily\arialfont[Ligatures=TeX]{arial}[
	Path=fonts/,
	Extension=.ttf,
	BoldFont=arialbd,
	ItalicFont=ariali
]

\newfontfamily\calibrifont[Ligatures=TeX]{calibri}[
	Path=fonts/,
	Extension=.ttf,
	BoldFont=calibrib,
	ItalicFont=calibrii
]
% Overrides default font sizes to more realistic ones (approximative)
\renewcommand{\tiny}{\fontsize{18pt}{20pt}\selectfont}
\renewcommand{\scriptsize}{\fontsize{22pt}{24pt}\selectfont}
\renewcommand{\footnotesize}{\fontsize{26pt}{28pt}\selectfont}
\renewcommand{\small}{\fontsize{30pt}{32pt}\selectfont}
\renewcommand{\normalsize}{\fontsize{36pt}{40pt}\selectfont}
\renewcommand{\large}{\fontsize{46pt}{50pt}\selectfont}
\renewcommand{\Large}{\fontsize{56pt}{60pt}\selectfont}
\renewcommand{\LARGE}{\fontsize{64pt}{70pt}\selectfont}
\renewcommand{\huge}{\fontsize{78pt}{84pt}\selectfont}
\renewcommand{\Huge}{\fontsize{88pt}{95pt}\selectfont}

% Fixes lists indents
\setlist[2]{itemindent=1.5cm}
\setlist[3]{itemindent=3cm}
\setlist[4]{itemindent=4.5cm}

% Figures set up (caption package)
\DeclareCaptionFormat{femto}{\arialfont \normalsize \color{darkGrey} #1 #2 #3}
\captionsetup{format=femto}

% Float placement (float package)
\floatplacement{figure}{H}


% define colors
\definecolor{lightGrey}{RGB}{112,127,135}
\definecolor{darkGrey}{RGB}{89,89,89}
\definecolor{femtoBlue}{RGB}{0,82,147}
\definecolor{contactsColor}{RGB}{147,205,221}

% Defines background images and other static things
\newcommand{\background}{
	\begin{tikzpicture}[remember picture,overlay]
		% Top-left logo
		\node[anchor=north west,xshift=\postermargin,yshift=-\postermargin] at (current page.north west)
		{\includegraphics[width=18.33cm,height=7.14cm]{img/femto_logo.jpg}};

		% Top-right background
		\node[anchor=north east] at ([xshift=.5cm,yshift=.5cm] current page.north east)
		{\includegraphics[width=44.67cm]{img/femto_background.jpg}};

		% Bottom right logos
		\node[anchor=south east,xshift=-\postermargin,yshift=\postermargin] at (current page.south east)
		{
			\includegraphics[width=22cm,height=7.18cm]{img/logos.jpg}
		};

		% FEMTO address
		\node[anchor=south west,xshift=43.06cm,yshift=\postermargin] at (current
				page.south west) {\parbox[b][5.32cm][b]{21.20cm}{
			\arialfont
				\fontsize{28}{32}\selectfont
				\textcolor{darkGrey}{
					\textbf{INSTITUT FEMTO-ST}\\
						15 B AVENUE DES MONTBOUCONS\\
						25030 BESANÇON CEDEX - www.femto-st.fr
				}
		}};

		% Contact box
		\node[fill=contactsColor,anchor=south west] at
		([xshift=\postermargin,yshift=\postermargin] current page.south west) {
			\hspace{.5cm}
			\parbox[t][9.35cm][c]{37.76cm}{
				\arialfont
					\fontsize{48pt}{52pt}\selectfont
					\textcolor{white}{
						\textbf{Contacts}
					}\\
				\fontsize{40pt}{52pt}\selectfont
					\textcolor{white}{
						\@name\\
							\@mail
					}
			}
		};
	\end{tikzpicture}
}

% name variable
\newcommand{\@name}{Name}
% mail variable
\newcommand{\@mail}{mail@femto-st.fr}
% contacts command (defines \@name and \@mail)
\newcommand{\contacts}[2]{\renewcommand{\@name}{#1}\renewcommand{\@mail}{#2}}

% title variable
\renewcommand{\@title}{Here is the title\\ of the study or project\\ to
present}
% override title command (defines \@title)
\renewcommand{\title}[1]{\renewcommand{\@title}{#1}}

% internal make title command
\newcommand{\makepostertitle}{
\begin{tikzpicture}[remember picture,overlay]
	% Wraps the title in a positioned tikznode
	\node[anchor=north west] at ([xshift=25.05cm,yshift=-3.45cm] current page.north west) {
		\parbox[t][11.42cm][l]{42.60cm}{
			\begin{flushleft}
			\arialfont
				\Huge % Previously redefined
				\textcolor{lightGrey}{
					\textbf{\@title}
				}
			\end{flushleft}
		}
	};
\end{tikzpicture}
}

% Block environment
\newenvironment{block}[1]{
	% Block title
	\begin{minipage}{37.5cm}
		\calibrifont
		\fontsize{60pt}{64pt}\selectfont
		\textcolor{femtoBlue}{
#1
		}
	\vspace{.7cm}
	\end{minipage}\\
	% Block body
	\begin{minipage}{37.5cm}
		\arialfont
		\fontsize{36pt}{40pt}\selectfont
	\color{lightGrey}
}{
\vspace{2cm}
\end{minipage}
}

\AtBeginDocument{
\pagestyle{empty}
% Draw background
\background
% Draw title
\makepostertitle
% Defines font
\arialfont
% space from top to first columns
%(title is inserted as an independent tikz node)
\parbox[b][21.45cm][b]{\textwidth}{}\\
\centering
% Begins first column
\begin{minipage}[c][90cm][t]{37.50cm}
\centering
}

% column break
\newcommand{\secondcolumn}{
% end first column
\end{minipage}
\hfill
% begins second column
\begin{minipage}[c][90cm][t]{37.50cm}
\centering
}

% ends second column
\AtEndDocument{\end{minipage}}

\endinput
