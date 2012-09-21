

%%
%% UiO LaTeX Thesis Class
%%

\ProvidesClass{uiothesis}
\NeedsTeXFormat{LaTeX2e}

% Based on the memoir class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions
\LoadClass{memoir}


%%
%% Fixes
%%

\RequirePackage{memhfixc}
\RequirePackage{etex} % increase register size


%%
%% Variables
%%

% Internal variables
\newcommand{\@subtitle}{}
\newcommand{\@scm}{}

% Outside variables
\newcommand{\subtitle}[1]{\renewcommand{\@subtitle}{#1}}
\newcommand{\scm}[1]{\renewcommand{\@scm}{#1}}


%%
%% Fonts
%%

\RequirePackage[T1]{fontenc}
\RequirePackage[utf8x]{inputenc}
\RequirePackage{lmodern}
\RequirePackage[opticals,fullfamily,swash,frenchmath]{MinionPro}
%\RequirePackage{chaparral}
%\RequirePackage{gotham}
\RequirePackage{pifont}
%\renewcommand{\scdefault}{ssc}
\newfont{\chapnum}{MinionPro-Disp-lf-ly1 scaled 1200}% scaled 2000
\newcommand{\lowercaps}[1]{\textsc{\MakeLowercase{#1}}}
\newcommand{\uppercaps}[1]{\textsc{\MakeUppercase{#1}}}
\renewcommand{\thefootnote}{\fnsymbol{footnote}}

% Creates an fourier ornament. Args: fontsize, lineheight, char
\RequirePackage{fourier-orns}
\newcommand*{\fourierOrnament}[3]{{%
  \fontencoding{U}\fontfamily{futs}\fontsize{#1}{#2}\selectfont\char#3}}

\newcommand*{\minionOrnament}[3]{{%
	\fontsize{#1}{#2}\selectfont\Pisymbol{MinionPro-Extra}{#3}}}
%%
%% Page layout
%%

\settypeblocksize{*}{34pc}{1.5}
\setlrmargins{*}{*}{1}
\setulmargins{*}{*}{2}
%\setlrmarginsandblock{2in}{1.5in}{*}
%\setulmarginsandblock{1in}{1.5in}{*}
\setmarginnotes{2pc}{12pc}{\baselineskip}
\setlength{\footskip}{.5in}
\setlength{\skip\footins}{2\baselineskip}
\checkandfixthelayout

% No orphans
\clubpenalty = 500
\widowpenalty = 1000

% Add or remove lines from facing pages
\RequirePackage{addlines}

%%
%% Line breaking
%%

\RequirePackage[final=true,step=1]{microtype}
\RequirePackage{ragged2e}


%%
%% Colors
%%

\RequirePackage{xcolor}

\definecolor{red}{HTML}{AD1737}
\definecolor{brown}{HTML}{990000}
\definecolor{bar}{HTML}{8D9965}
\newcommand{\red}[1]{\textcolor{red}{#1}}

\definecolor{chapnum}{gray}{0.8}
\definecolor{largeornament}{gray}{0.85}
\definecolor{smallornament}{gray}{0.65}

\colorlet{title}{red}
\colorlet{partnum}{red}
\colorlet{urlcolor}{brown}
\colorlet{tocchapnum}{brown}


%%
%% Graphics
%%

\RequirePackage{graphicx}

\RequirePackage{tikz}

\RequirePackage{sparklines}
\colorlet{sparkspikecolor}{bar}
\setlength{\sparkspikewidth}{5pt}

%%
%% Science
%%

\RequirePackage{mhchem}
\RequirePackage{siunitx}
\sisetup{obeyall,alsoload=synchem}		
\DeclareSIUnit \pulse {pulse}	
\RequirePackage{textgreek}
\newcommand{\sto}{\ce{SrTiO3}{}}
\newcommand{\bto}{\ce{BaTiO3}{}}
\newcommand{\bfo}{\ce{BiFeO3}{}}
\newcommand{\feo}{\ce{Fe2O3}{}}


%%
%% Math
%%

\RequirePackage{amsmath}



%%
%% Division styles
%%

% Part style
\renewcommand{\partnamefont}{\raggedright\LARGE\scshape\MakeUppercase}
\renewcommand{\partnumfont}{\color{partnum}\LARGE\scshape\MakeUppercase}
\renewcommand{\parttitlefont}{\color{black}\raggedright\LARGE\scshape}
\renewcommand{\printparttitle}[1]{\SingleSpacing \parttitlefont \MakeUppercase{#1}}

% Chapter style
\makechapterstyle{uio}{%
  \renewcommand{\printchaptername}{}
  \renewcommand{\chapternamenum}{}
  \renewcommand{\printchapternum}{%
    \marginpar{%
      \vspace{0pt}
      \hspace{-6pt}\color{chapnum}\chapnum \thechapter
      \vspace{20pt}
    }%
  }%
  \renewcommand{\afterchapternum}{}
  \renewcommand{\printchaptertitle}[1]{%
    \SingleSpacing\raggedright\LARGE\uppercaps{##1} %
  }%
}

% Section style
\setsecheadstyle{\SingleSpacing\raggedright\Large\scshape\MakeLowercase} %
\setsubsecheadstyle{\SingleSpacing\raggedright\large\itshape}
\setsubsubsecheadstyle{\SingleSpacing\raggedright\itshape}



% Paragraph break
\newcommand{\parabreak}{%
  \fancybreak{%
    \vspace{\baselineskip}
    \color{smallornament}\Large\decofourleft
    \vspace{\baselineskip}
  }
}

% Intro section for chapters
\newcommand{\chintro}[1]{%
	\begin{SingleSpace}\small{\emph{#1}}\end{SingleSpace}
	}


%%
%% Tops and tails
%%

% Page style
\makepagestyle{uio}
\makeevenfoot{uio}{\thepage}{}{}
\makeoddfoot{uio}{}{}{\thepage}

\makepagestyle{uiodraft}
\makeevenfoot{uiodraft}{\thepage}{}{\red{DRAFT: \today}}
\makeoddfoot{uiodraft}{\red{DRAFT: \today}}{}{\thepage}


% Plain headers and footers
\makeevenfoot{plain}{\thepage}{}{}
\makeoddfoot{plain}{}{}{\thepage}

% Empty part page style
\aliaspagestyle{part}{empty}


%%
%% Lists
%%

% Table of Contents
\maxtocdepth{section}

\renewcommand{\cftpartfont}{\large}
\renewcommand{\cftpartleader}{}
\renewcommand{\cftpartafterpnum}{\cftparfillskip}
\cftsetindents{part}{1.5em}{0em}
\renewcommand{\partnumberline}[1]{}
\cftpagenumbersoff{part}

\renewcommand{\cftchapterfont}{\normalsize}
\renewcommand{\cftchapterpagefont}{\normalsize}
\renewcommand{\cftchapterpresnum}{\hspace*{-1.5em}\color{tocchapnum}}
\cftsetindents{chapter}{1.5em}{0em}
\renewcommand{\cftchapterleader}{}
\renewcommand{\cftchapterafterpnum}{\cftparfillskip}

\renewcommand{\cftsectionfont}{\small}
\renewcommand{\cftsectionpagefont}{\small}
\cftsetindents{section}{1.5em}{2.3em}
\renewcommand{\cftsectionleader}{}
\renewcommand{\cftsectionafterpnum}{\cftparfillskip}

\renewcommand{\cftsubsectionfont}{\small\em}
\renewcommand{\cftsubsectionpagefont}{\small}
\cftsetindents{subsection}{4em}{2.3em}
\renewcommand{\cftsubsectionleader}{}
\renewcommand{\cftsubsectionafterpnum}{\cftparfillskip}

% List of Figures/Tables
\renewcommand{\cftfigureleader}{ }
\renewcommand{\cftfigureafterpnum}{\cftparfillskip}

\renewcommand{\cfttableleader}{ }
\renewcommand{\cfttableafterpnum}{\cftparfillskip}

% Enumeratable list
\newenvironment{enum}{%
  \begin{list}{\arabic{enumi}}{%
    \setlength{\topsep}{\onelineskip}
    \setlength{\partopsep}{0pt}
    \setlength{\parsep}{\parskip}
    \setlength{\itemsep}{\parskip}
    \setlength{\leftmargin}{0pt}
    \setlength{\itemindent}{0pt}
    \usecounter{enumi}
  }
}{\end{list}}

% Itemized list
\newenvironment{items}{%
  \begin{list}{\textbullet}{%
    \setlength{\topsep}{\onelineskip}
    \setlength{\partopsep}{0pt}
    \setlength{\parsep}{\parskip}
    \setlength{\itemsep}{\parskip}
    \setlength{\leftmargin}{0pt}
    \setlength{\itemindent}{0pt}
  }
}{\end{list}}

% Definitions in lists
\newcommand{\iterm}[1]{\item \term{#1}}

% In-paragraph lists
\usepackage{paralist}

%%
%% Captions
%%

\RequirePackage{caption}
\captionsetup[figure]{labelfont=sc,font={footnotesize,rm},%
                      justification=RaggedRight,%
                      singlelinecheck=false}
\captionsetup[table]{labelfont=sc,font={footnotesize,rm},%
                     justification=RaggedRight,%
                     singlelinecheck=false,%
                     position=bottom}
\captionsetup[sourcecode]{font={footnotesize,rm},%
                          justification=RaggedRight,%
                          singlelinecheck=false,%
                          position=bottom}

\newcommand{\reducecaption}[1]{%
  \strictpagechecktrue
  \checkoddpage
  \ifoddpage%
    \captionsetup{margin={0pc,#1pc}}
  \else%
    \captionsetup{margin={#1pc,0pc}}
  \fi%
}


%%
%% Tables
%%

\RequirePackage{longtable}
\RequirePackage{pdflscape}
\RequirePackage{multirow}

\newcommand{\twoguides}{%
  \begin{tikzpicture}
    \draw (-1,1) -- (-1,1);
    \begin{scope}[color=red]
      \draw (-1,0.75) -- (-0.25,0.5);
      \draw (-1,0.2) -- (-0.25,0.5);
    \end{scope}
  \end{tikzpicture}}

\newcommand{\threeguides}{%
  \begin{tikzpicture}
    \draw (-1,1) -- (-1,1);
      \draw (-1,0.75) -- (-0.25,0.75);
      \draw (-1,0.225) -- (-0.25,0.75);
      \draw (-1,0.175) -- (-0.25,-0.35);
      \draw (-1,-0.35) -- (-0.25,-0.35);
    \begin{scope}[color=red]
      \draw (-1,0.70) -- (-0.25,0.2);
      \draw (-1,-0.30) -- (-0.25,0.2);
    \end{scope}
  \end{tikzpicture}}

\newcommand{\fourguides}{%
  \begin{tikzpicture}
    \draw (-1,0.7) -- (-1,0.7);
    \begin{scope}[color=red]
      \draw (-1,0.5) -- (-0.25,0);
      \draw (-1,-0.5) -- (-0.25,-0);
    \end{scope}
  \end{tikzpicture}}


%%
%% Side notes/tables/figures
%%

\RequirePackage{marginnote}

% The mark on the sidenote
\newcommand{\sidemark}[1]{#1.{\:}}

\newcommand{\marginelement}[2][0]{%
  \marginnote{%
    \strictpagechecktrue
    \checkoddpage
    \ifoddpage%
      \RaggedRight\footnotesize%
    \else%
      \RaggedLeft\footnotesize%
    \fi%
    #2%
  }[#1\onelineskip]%
}%

\newcommand{\sidenote}[2][0]{%
  \footnotemark%
  \ignorespaces%
  \marginelement[#1]{%
  	\SingleSpacing
    \sidemark{\thefootnote}%
    \ignorespaces#2%
  }%
  \unskip%
}%

\RequirePackage{mparhack}
% Sidetable (have to use marginpar since tabular doesn't work with marginnote)
\newcommand{\sidetable}[3][]{%
  \marginpar{%
  	\SingleSpacing
    \strictpagechecktrue
    \checkoddpage
    \ifoddpage%
      \captionsetup[table]{font={footnotesize,rm},%
                           justification=RaggedRight,%
                           singlelinecheck=false}
      \RaggedRight\footnotesize%
    \else
      \captionsetup[table]{font={footnotesize,rm},%
                           justification=RaggedLeft,%
                           singlelinecheck=false}
      \RaggedLeft\footnotesize%
    \fi
    #3
    \captionof{table}[#1]{#2}
  }
}

% Sidefigure
\newcommand{\sidefigure}[4][3]{%
  \marginelement[#4]{%
  	\SingleSpacing
    \strictpagechecktrue
    \checkoddpage
    \ifoddpage%
      \captionsetup[figure]{font={footnotesize,rm},%
                            justification=RaggedRight,%
                            singlelinecheck=false}
    \else
      \captionsetup[figure]{font={footnotesize,rm},%
                            justification=RaggedLeft,%
                            singlelinecheck=false}
    \fi
    #3
    \captionof{figure}[#1]{#2}
  }
}


%%
%% Environments
%%

% Full width quote environment
\renewenvironment{quote}{%
  \list{}{%
    \setlength{\topsep}{\baselineskip}
    \setlength{\partopsep}{0pt}
    \setlength{\itemindent}{0pt}
    \setlength{\listparindent}{0pt}
    \setlength{\leftmargin}{0pt}
  }%
  \itshape\item[]
}{\endlist}

\newlength{\wholemargin}\setlength{\wholemargin}{\marginparwidth}
\addtolength{\wholemargin}{\marginparpush}
\newlength{\wholewidth}\setlength{\wholewidth}{\textwidth}
\addtolength{\wholewidth}{\wholemargin}

% Whole environment
\newenvironment{whole}{%
  \centering
  \strictpagechecktrue
  \begin{adjustwidth*}{0em}{-\wholemargin}
  \strictpagechecktrue
  \checkoddpage
  \ifoddpage%
    \raggedright
  \else%
    \raggedleft
  \fi%
}{%
  \end{adjustwidth*}
}

\newlength{\foreminusspine}\setlength{\foreminusspine}{\foremargin}
\addtolength{\foreminusspine}{-\spinemargin}

% Centered environment
\newenvironment{centered}{%
  \begin{adjustwidth*}{0em}{-\foreminusspine}
    \centering
}{%
  \end{adjustwidth*}
}

% Code environment
\newcommand{\@codelabel}{undefined}
\newcommand{\@codeshortcaption}{undefined}
\newcommand{\@codeverbosecaption}{undefined}

\newenvironment{scode}[4]{%
  \renewcommand{\@codelabel}{#2}
  \renewcommand{\@codeshortcaption}{#3}
  \renewcommand{\@codeverbosecaption}{#4}
  \begin{sourcecode}
    \lstset{language=#1,
    		stepnumber=1,
    		breaklines=true}
    \ttfamily
}{%
    \caption[\@codeshortcaption]{\@codeverbosecaption}
    \label{sourcecode:\@codelabel}
  \end{sourcecode}
}


%%
%% Hyperlinks
%%

\RequirePackage[pdftex,plainpages=false]{hyperref}

% break also on hyphens inside the \url command
\def\UrlBreaks{\do\.\do\@\do\\\do\/\do\!\do\_\do\|\do\;\do\>\do\]%
  \do\)\do\,\do\?\do\'\do+\do\=\do\#\do-} % \do- is new!

\urlstyle{sf}

\hypersetup{%
  colorlinks=true,
  linkcolor=black,
  anchorcolor=black,
  citecolor=black,
  urlcolor=urlcolor,
  breaklinks,
  pdfborder=0 0 0}


%%
%% Code listings
%%

\RequirePackage{listings}

\lstset{%
  basicstyle=\footnotesize,
  numbers=left,
  numberstyle=\footnotesize\texttt,
  showstringspaces=false,
  frame=l,
  captionpos=b,
}

% New float for source code
\newcommand{\sourcecodename}{Source Code Listing}
\newcommand{\listsourcecodename}{List of Source Code}
\newlistof{listofsourcecode}{sc}{\listsourcecodename}
\newfloat[chapter]{sourcecode}{sc}{\sourcecodename}
\newfixedcaption{\fdiagcaption}{sourcecode}
\newlistentry{sourcecode}{sc}{0}

% List of Source Code Style
\renewcommand{\cftsourcecodeleader}{ }
\renewcommand{\cftsourcecodeafterpnum}{\cftparfillskip}


%%
%% Reference shorthands.
%%

\newcommand\figureref[1]{%
  Figure~\ref{fig:#1}%
}
\newcommand\figurepageref[1]{%
  \figureref{#1}
  (p.~\pageref{fig:#1})%
}
\newcommand\tableref[1]{%
  Table~\ref{tab:#1}%
}
\newcommand\tablepageref[1]{%
  \tableref{#1}
  (p.~\pageref{tab:#1})%
}
\newcommand\sourcecoderef[1]{%
  Source Code Listing~\ref{sourcecode:#1}%
}
\newcommand\sourcecodepageref[1]{%
  \sourcecoderef{#1}
  (p.~\pageref{sourcecode:#1})%
}
\newcommand\chapterref[1]{%
  Chapter~\ref{ch:#1}%
}
\newcommand\chapterpageref[1]{%
  \chapterref{#1}
  (p.~\pageref{ch:#1})%
}

\newcommand\sectionref[1]{%
  \S~\ref{#1}%
}

\newcommand\sectionpageref[1]{%
  \S~\ref{#1}
  (p.~\pageref{#1})%
}
\newcommand\appendixref[1]{%
  Appendix~\ref{appendix:#1}
  (p.~\pageref{appendix:#1})%
}
\newcommand\flickrref[1]{%
  (\identifier{} #1, p.~\pageref{table:flickr.content.inventory.#1})%
}
\newcommand\flickropenref[1]{%
  \identifier{} #1, p.~\pageref{table:flickr.content.inventory.#1}%
}
\newcommand\facebookref[1]{%
  (\identifier{} #1, p.~\pageref{table:facebook.content.inventory.#1})%
}


%%
%% Declerative formatting
%%

% Items to attend to 
\newcommand{\todo}[1]{\textcolor{red}{$\bigotimes$ #1 $\bigotimes$}}

% Phrase marker
\newcommand{\dash}{ -- }

% Code snippet
\newcommand{\code}[1]{\texttt{{#1}}}

% UNIX-style variable name.
\newcommand{\var}[1]{\code{\${#1}}}

% Executable name
\let\executable\code

% Term (first usage)
\newcommand{\term}[1]{\textit{{#1}}}

% Title of artistic or academic work
\newcommand{\work}[1]{\textit{{#1}}}

% Latin expressions
\let\latin\term

% Abbreviations (mostly acronyms, but all full caps abbreviations)
\let\abbr\lowercaps

% Project name (first usage?)
\newcommand{\project}[1]{\textsf{{#1}}}

% Quotation
\newcommand{\q}[1]{``#1''}

% A value
\let\val\q

% old style &
\newcommand{\oldand}{\textsw{\& }}

% ID
\newcommand{\identifier}{\abbr{ID}}

% Reseaerch problem
\newcommand{\rp}[2][]{%
  \toks@{#1}%
  \edef\reserved@a{\the\toks@}%
  \ifx\reserved@a\@empty%
    #2
  \else%
    \abbr{RP#1}: #2
  \fi%
}


%%
%% Quotations and citations
%%

\RequirePackage[square, comma, numbers, super, sort&compress]{natbib}
	\newcommand{\referenceschapter}{%
	\phantomsection
%	\addcontentsline{toc}{chapter}{References}
	\bibliographystyle{cmuthesis.bst}
	\renewcommand{\bibname}{References}
	\bibliography{thesis-cited}}


% Paragraph/page reference
\newcommand{\para}[1]{paragraph~#1}
\newcommand{\paras}[2]{paragraphs~#1--#2}
\newcommand{\p}[1]{p.~#1}
\newcommand{\pp}[2]{pp.~#1--#2}
\newcommand{\chap}[1]{chapter~#1}
\newcommand{\chaps}[2]{chapters~#1--#2}
\newcommand{\vol}[1]{vol.~#1}

% Inline quotations
\newcommand{\prequote}[4][]{\citet[#1]{#2} #3 \q{#4}.}
\newcommand{\openprequote}[4][]{\citet[#1]{#2} #3 \q{#4}}

\newcommand{\postquote}[3][]{\q{#3} \citep[#1]{#2}.}
\newcommand{\postquoteyear}[3][]{\q{#3} \citeyearpar[#1]{#2}.}
\newcommand{\openpostquote}[3][]{\q{#3} \citep[#1]{#2}}
\newcommand{\openpostquoteyear}[3][]{\q{#3} \citeyearpar[#1]{#2}}

% Full quote environment
\newenvironment{fullquote}[3][]{%
  \citet[#1]{#2} #3:
  \begin{quote}
}{%
  \end{quote}
}

% Full quotation environment
\newenvironment{fullquotation}[3][]{%
  \citet[#1]{#2} #3:
  \vspace{\baselineskip}

  \itshape
}{%
  \vspace{\baselineskip}
}
% Double page citation
\newcommand{\citedouble}[4]{%
  (\citealp[#1]{#2}; \citealp[#3]{#4})%
}


%%
%% Constants
%%

\newcommand{\urort}{Ur\o{}rt}
\newcommand{\siste}{\q{Siste fra dine Favoritter}}
\newcommand{\latest}{\q{Latest from your Favorites}}


%%
%% Front matter
%%

% Colophon
\newcommand{\makecolophon}{%
  \pagestyle{empty}
  

  
  \small %\raggedright

  \null\vfil
 

  \strictpagecheck
  \begin{adjustwidth*}{12pc}{4.5pc}
  \raggedright
    \section*{Colophon}
    \addcontentsline{toc}{chapter}{Colophon}
    
    \bigskip
    
    This thesis was typeset using the \LaTeX{} typesetting system originally developed by Leslie Lamport, based on \TeX{} created by Donald Knuth. The style and source code of this document was adapted from the master's thesis of Eivind Uggedal\cite{Uggedal:2008fk} at the University of Oslo.\\

    \bigskip

%    The body text is set 12/14.5pt on a 28pc measure with Minion Pro designed by Robert Slimbach. This neohumanistic font was first issued by Adobe Systems in 1989 and have since been revised. Text in figures is set with Scala Sans Pro, designed by Martin Majoor and released by FontShop International in 1993.\\
	The body text is set in 12/14.5 pt on a 34 pc measure with Minion Pro designed by Robert Slimbach. This neohumanistic font was first issued by Adobe Systems in 1989 and have since been revised. Text in figures is set with Scala Sans Pro, designed by Martin Majoor and released by FontShop International in 1993.\\

    \bigskip

    Typographical decisions were inspired by and based on the recommendations given in \work{\textsw{The} Elements \textsw{of Typographic Style}} by Robert Bringhurst.\cite{bringhurst2004elements}\\

    \bigskip

%    The use of figures in the margin and figures spanning both the textblock and fore-edge margin was inspired by \work{\textsw{Beautiful} Evidence} by Edward R. Tufte.\cite{Tufte:2006wc}\\

    \bigskip

    The guidelines found in \work{\textsw{The Visual Display of Quantitative Information}} by Edward R. Tufte \cite{tufte1983visual} were followed when creating diagrams and tables.~\red{\adforn{36}}\\
  \end{adjustwidth*}


  \vfil

%  \begin{adjustwidth*}{\unitlength}{-\unitlength}
%    \color{largeornament}\fourierOrnament{100}{120}{88}
%  \end{adjustwidth*}

  \vfil

  
}

\newcommand{\metainfo}{%
  \normalsize
  \newlength{\alphlen}
  \settowidth{\alphlen}{abcdefghijklmnopqrstuvwxyz}
  The length of the alphabet is: \the\alphlen \\
  The beselineskip is: \the\baselineskip{} 
}

% Titlepage
\RequirePackage{pdfpages}
\renewcommand{\maketitle}{%
  \includepdf[pages={1}]{titlepage}
  \cleardoublepage
% \pagestyle{empty}
%  \begin{titlingpage}
%
%  
% 
%    \begin{centered}
%        \null\vspace{2pc}
%
%        {\HUGE\color{title}\lowercaps{Growth and}} \\
%        \vspace{0.5pc}
%        {\HUGE\color{title}\lowercaps{Photochemical Activity}} \\
%        \vspace{1pc}
%        {\Large\textit{{of}}} \\
%        \vspace{1pc}
%        {\HUGE\color{title}\lowercaps{Hematite Films on}} \\
%        \vspace{0.5pc}
%        {\HUGE\color{title}\lowercaps{Perovskite Substrates}} \\
%
%        \vspace{4pc}
%        {\LARGE\adfdoubleflourishleft} \\
%        \vspace{4pc}
%
%        
%        \textit{Submitted in partial fulfillment of the \\ 
%        requirements for the degree of} \\
%        \vspace{2pc}
%        \textsc{Doctor of Philosophy} \\
%        \vspace{0.25pc}
%        \textit{in} \\
%        \vspace{0.25pc}
%       \textsc{Materials Science and Engineering} \\
%
%        
%        
%                \vspace{4pc}
%
%        \textsc{\Large\@author} \\
%        
%        \vspace{4pc}
%        
%        \textsc{BA}, Chemistry, New York University \\
%        \textsc{MS}, Materials Science and Engineering, Carnegie Mellon University\\
%
%        \vspace{2pc}
%        
%        Carnegie Institute of Technology \\
%        Carnegie Mellon University \\
%        Pittsburgh, PA \\
%        
%        \vspace{2pc}
%
%        September 2012 \\
%        
%        \vfill
%        \@scm
%    \end{centered}
%    \clearpage
%    
%  \end{titlingpage}
%   \pagestyle{uio}
}
