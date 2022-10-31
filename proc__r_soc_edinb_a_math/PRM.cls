\newcommand\classname{PRM}
\newcommand\lastmodifieddate{20/02/2020}
\newcommand\versionnumber{1.0}

% Are we printing crop marks?
\newif\if@cropmarkson \@cropmarksontrue

\NeedsTeXFormat{LaTeX2e}[20/02/2020]
\ProvidesClass{\classname}[\lastmodifieddate]

\setlength{\paperheight}{250truemm}
\setlength{\paperwidth}{174truemm}

\newif\if@numberedref \@numberedreftrue
\newif\if@endproofbox \@endproofboxtrue
\newif\iffinal
\newif\ifpreview
\newif\ifrevised
\newif\ifnoquery
\newif\iflink
\newif\ifoldtable
\newif\ifprinter
\newif\iffproof
\newif\ifopenacc
\newif\iferratum
\newif\iflineno
\newif\ifnosecthm
\newif\ifcontthm
\newif\ifmanualthm
\newif\ifnoseceqn
\newif\iftrack
\newif\ifnotrack
\newif\ifunsort

\DeclareOption{track}{\tracktrue}
\DeclareOption{notrack}{\notracktrue}
\DeclareOption{erratum}{\erratumtrue}
\DeclareOption{oldtable}{\oldtabletrue}
\DeclareOption{openacc}{\openacctrue}
\DeclareOption{noquery}{\noquerytrue}
\DeclareOption{printer}{\printertrue}
\DeclareOption{link}{\linktrue}
\DeclareOption{fproof}{\fprooftrue}
\DeclareOption{final}{\finaltrue}
\DeclareOption{preview}{\previewtrue}
\DeclareOption{revised}{\revisedtrue}
\DeclareOption{draft}{\PassOptionsToPackage{draft}{graphicx}}
\DeclareOption{a4paper}{\PassOptionsToPackage{a4}{crop}}
\DeclareOption{centre}{\PassOptionsToPackage{center}{crop}}
\DeclareOption{crop}{\PassOptionsToPackage{cam}{crop}\global\@cropmarksontrue}
\DeclareOption{nocrop}{\PassOptionsToPackage{off}{crop}\global\@cropmarksonfalse}
\DeclareOption{info}{\PassOptionsToPackage{info}{crop}}
\DeclareOption{noinfo}{\PassOptionsToPackage{noinfo}{crop}}
\DeclareOption{numbered}{\global\@numberedreftrue}
\DeclareOption{named}{\global\@numberedreffalse}
\DeclareOption{noproofbox}{\global\@endproofboxfalse}
\DeclareOption{proofbox}{\global\@endproofboxtrue}
\DeclareOption{lineno}{\linenotrue}
\DeclareOption{unsort}{\unsorttrue}
\DeclareOption{cmfonts}{\let\CJ@fonts\relax}

\ExecuteOptions{cmfonts,a3paper,noquery,link,nocrop,centre,info,proofbox}

\ProcessOptions

% Load all necessary packages
\RequirePackage[OT1]{fontenc}
\RequirePackage{crop,graphicx,array,amsmath,amsthm,amssymb,amsfonts}
\RequirePackage{upref,endnotes,rotating}
\RequirePackage{color}
\ifunsort\relax%
\RequirePackage[numbers]{natbib}%
\else%
\RequirePackage[sort&compress,numbers]{natbib}%
\fi%
\bibpunct[, ]{[}{]}{,\,}{n}{}{,}
\let\citenumfont\bfseries

% Not sure if needed.
\newcommand\@ptsize{0}

% Set twoside printing
\@twosidetrue

% Marginal notes are on the outside edge
\@mparswitchtrue

% Default font sizes
\renewcommand\normalsize{%
  \@setfontsize\normalsize{10\p@}{12\p@}%
  \abovedisplayskip 9\p@ \@plus 3\p@ \@minus3\p@
  \abovedisplayshortskip 6\p@ \@plus 3\p@ \@minus1\p@
  \belowdisplayshortskip 6\p@ \@plus 3\p@ \@minus1\p@
  \belowdisplayskip \abovedisplayskip
  \let\@listi\@listI}
\normalsize
\let\@bls\baselineskip

\newcommand\small{%
  \@setfontsize\small{9\p@}{11\p@}%
  \abovedisplayskip 6\p@ \@plus1\p@ \@minus1\p@
  \abovedisplayshortskip 3\p@ \@plus 2\p@ \@minus1\p@
  \belowdisplayshortskip 2\p@ \@plus 1\p@ \@minus1\p@
  \def\@listi{\leftmargin\leftmargini
              \listparindent \parindent
              \topsep 6\p@ \@plus2\p@ \@minus1\p@
              \parsep \z@ \itemsep \z@}%
  \belowdisplayskip \abovedisplayskip}

\newcommand\footnotesize{%
  \@setfontsize\footnotesize{8\p@}{10\p@}%
  \abovedisplayskip 6\p@ \@plus2\p@ \@minus4\p@
  \abovedisplayshortskip \z@ \@plus \p@
  \belowdisplayshortskip 1\p@ \@plus2\p@ \@minus2\p@
  \def\@listi{\leftmargin\leftmargini
              \listparindent 1em
              \topsep 5\p@ \@plus 2\p@ \@minus 1\p@
              \parsep \z@ \itemsep \z@}%
  \belowdisplayskip \abovedisplayskip}

\def\scriptsize{\@setfontsize\scriptsize{7\p@}{9\p@}}
\def\tiny{\@setfontsize\tiny{6\p@}{7\p@}}
\def\little{\@setfontsize\little{5\p@}{6\p@}}
\def\large{\@setfontsize\large{12\p@}{14\p@}}
\def\Large{\@setfontsize\Large{14\p@}{16\p@}}
\def\LARGE{\@setfontsize\LARGE{16\p@}{18\p@}}
\def\huge{\@setfontsize\huge{24\p@}{26\p@}}
\def\Huge{\@setfontsize\Huge{25\p@}{27\p@}}

\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}

% Line spacing
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}

% Paragraph dimensions and inter-para spacing
\setlength\parskip{0\p@}
\setlength\parindent{10pt}

% Set inter-para skips
\setlength\smallskipamount{3\p@ \@plus 1\p@ \@minus 1\p@}
\setlength\medskipamount{6\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\bigskipamount{12\p@ \@plus 4\p@ \@minus 4\p@}

% Page break penalties
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301

% Disallow widows and orphans
\clubpenalty 10000
\widowpenalty 10000

% Disable page breaks before equations, allow pagebreaks after
% equations and discourage widow lines before equations.
\displaywidowpenalty 100
\predisplaypenalty   10000
\postdisplaypenalty  2500

% Allow breaking the page in the middle of a paragraph
\interlinepenalty 0

% Disallow breaking the page after a hyphenated line
\brokenpenalty 10000

% Hyphenation; don't split words into less than three characters
\lefthyphenmin=3
\righthyphenmin=3

\newbox\textlinehtbox%
\setbox\textlinehtbox=\hbox{{\reset@font\normalsize 1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ}}%
\newdimen\textlineheight%
\textlineheight=\ht\textlinehtbox%

%
% Set page layout dimensions
%
\setlength\headheight{\textlineheight} % height of running head
\setlength\topmargin{70pt}              % top margin
\addtolength\topmargin{-\headheight}
\addtolength\topmargin{-1in}           % subtract out the 1 inch driver margin

\setlength\topskip{\textlineheight}    % height of first line of text
\setlength\headsep{17.5\p@}              % space below running head
\addtolength\headsep{-\topskip}        % base to base with first line of text

\setlength\footskip{30\p@}           % space above footer line
\setlength\maxdepth{.5\topskip}        % pages can be short or deep by half a line?

\setlength\textwidth{126.5truemm}           % text measure excluding margins (32pc)

\setlength\textheight{46\@bls}       % text height
\addtolength\textheight{\topskip}    % including first line of text

% Set the margins
\setlength\marginparsep{6\p@}
\setlength\marginparpush{8\p@}
\setlength\marginparwidth{1pc}

\setlength\oddsidemargin{24.75truemm}% 4.5pc
\addtolength\oddsidemargin{-1in}    % subtract out the 1 inch driver margin
\setlength\@tempdima{\paperwidth}
\addtolength\@tempdima{-\textwidth}
\addtolength\@tempdima{-24.75truemm}
\setlength\evensidemargin{\@tempdima}
\addtolength\evensidemargin{-1in}

\setlength\columnsep{6\p@}          % space between columns for double-column text
\setlength\columnseprule{0\p@}      % width of rule between two columns

% Footnotes
\setlength\footnotesep{0\p@}     % space between footnotes
% space between text and footnote
\setlength{\skip\footins}{12\p@ \@plus 6\p@ \@minus 1\p@}

% Float placement parameters

\setcounter{totalnumber}{10}
\setcounter{topnumber}{5}
\setcounter{bottomnumber}{5}
\renewcommand\topfraction{.921}
\renewcommand\bottomfraction{.921}
\renewcommand\textfraction{.079}
\renewcommand\floatpagefraction{.887}

% The same parameters repeated for double column output
\renewcommand\dbltopfraction{.88}
\renewcommand\dblfloatpagefraction{.88}

% Space between floats
\setlength\floatsep    {18\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\textfloatsep{20\p@ \@plus 2\p@ \@minus 4\p@}
\setlength\intextsep   {18\p@ \@plus 2\p@ \@minus 2\p@}

% For double column floats
\setlength\dblfloatsep    {12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\dbltextfloatsep{20\p@ \@plus 2\p@ \@minus 4\p@}

% Space left at top, bottom and inbetween floats on a float page.
\setlength\@fptop{0\p@}         % no space above float page figures
\setlength\@fpsep{12\p@ \@plus 2fil}
\setlength\@fpbot{0\p@ \@plus 1fil}

% The same for double column
\setlength\@dblfptop{0\p@}
\setlength\@dblfpsep{12\p@ \@plus 1fil}
\setlength\@dblfpbot{0\p@ \@plus 2fil}

%%%%%%%%%%%%%%%%%%%%%%%%%%%% Article Identification %%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\@default@journal@title{Journal Title}
\let\@journal@title\@default@journal@title
\def\art-id@info{}
\def\month@info{Month~}
\def\year@info{\the\year}
\def\vol@info{00}
\def\price@info{00}
\def\issue@info{00}
\def\@print@issn{0000-0000}
\def\@price{0000-0000}

\iflink
\newcommand{\page@extent@info}{\thepage--\pageref*{LastPage}}
\newcommand{\totalpage}{\pageref*{LastPage}}
\else
\newcommand{\page@extent@info}{\thepage--\pageref{LastPage}}
\newcommand{\totalpage}{\pageref{LastPage}}
\fi

\newcommand{\issn@line}{\@print@issn}
\newcommand{\copyright@line}{\textcopyright\ \year@info\ The Royal Society of Edinburgh}
\newcommand{\openacc@copyline}{\vbox{\hsize\textwidth\copyright@line.\ \@openacctext}}%

\gdef\doi@string{0000000000}

% Article information user commands
\def\Year#1{\gdef\year@info{#1}}
\def\Vol#1{\gdef\vol@info{#1}}
\def\Price#1{\gdef\price@info{#1}}
\def\Issue#1{\gdef\issue@info{#1}}
\def\art-id#1{\gdef\art-id@info{#1}}
\def\Month#1{\gdef\month@info{#1}}
\newcommand\DOI[2][\@doi@fixed@field]{%
  \gdef\@doi@variable@field{#1}%
  \setDOI{#1}{#2}}
\newcommand{\setDOI}[2]{%
  \gdef\doi@string{#1#2}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Firstpage %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\firstpage}[1]{%
  \setcounter{page}{#1}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%% Page Styles %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\RHfont{\reset@font\fontsize{10pt}{12pt}\selectfont}%

\def\titheadfont{\reset@font\fontsize{8pt}{10.5pt}\selectfont}%
\def\titfootfont{\reset@font\fontsize{8pt}{10pt}\selectfont}%

\newcommand{\titlepageheadline}{\vbox to 17.4pt{\vfill\titheadfont\jourinf\\DOI:\doi@string}}%

\ifopenacc\relax%
\newcommand{\titlepagefootline}{\vbox{\hbox to \textwidth{\titfootfont\openacc@copyline\\[-20pt]}
\hbox to \textwidth{\hspace*{\fill}\fontsize{9}{11}\selectfont {\thepage}\hspace*{\fill}}}}%
\else%
\newcommand{\titlepagefootline}{\vbox{\hspace*{\fill}{\titfootfont\copyright@line}\\[-20pt]\hspace*{\fill}{\fontsize{9}{11}\selectfont \thepage}\hspace*{\fill}}}%
\fi%

\def\ps@titlepage{%
  \def\@evenhead{\titlepageheadline}%
  \def\@oddhead{\titlepageheadline}%
  \def\@oddfoot{\titlepagefootline}%
  \def\@evenfoot{\titlepagefootline}%
  \def\authormark##1{\def\leftmark{##1}}%
  \def\titlemark##1{\markboth{##1}{##1}}}%

\def\ps@headings{%
  \let\@oddfoot\@empty%
  \let\@evenfoot\@empty%
  \def\@evenhead{\RHfont\rlap{\thepage}\hfill{\itshape\leftmark}\hfill}%
  \def\@oddhead{\RHfont\hfill{\itshape\rightmark}\hfill\llap{\thepage}}%
  \def\authormark##1{\def\leftmark{##1}}%
  \def\titlemark##1{\markboth{##1}{##1}}}

\def\today{\number\day/\ifcase\month\or 1\or 2\or 3\or 4\or 5\or 6\or 7\or 8\or 9\or 10\or 11\or 12\fi/\number\year}

%
% Sectional units
%
\newcounter{part}
\newcounter{section}
\newcounter{rsection}
\newcounter{subsection}[section]
\newcounter{rsubsection}[section]
\newcounter{subsubsection}[subsection]
\newcounter{paragraph}[subsubsection]
\newcounter{subparagraph}[paragraph]
\newcounter{asection}[section]
\newcounter{refsection}[section]
\newcounter{appsection}[section]
\newcounter{appsubsection}[section]
\newcounter{figure}
\newcounter{scheme}
\newcounter{table}

% Form of the numbers
\newcommand\thepage{\arabic{page}}
\renewcommand\thesection{\arabic{section}}
\renewcommand\thersection{\arabic{section}}
\renewcommand\thesubsection{{\thesection.\arabic{subsection}}}
\renewcommand\thersubsection{{\thersection.\arabic{subsection}}}
\renewcommand\thersubsection{{\thersection.\arabic{subsection}}}
\renewcommand\thesubsubsection{\upshape{\thesubsection.\arabic{subsubsection}}}
\renewcommand\theparagraph{\thesubsubsection.\arabic{paragraph}}
\renewcommand\thesubparagraph{\theparagraph.\arabic{subparagraph}}
\renewcommand\theequation{\arabic{equation}}
\ifnoseceqn\relax
\else
\numberwithin{equation}{section}
\fi

% Form of the words
\newcommand\contentsname{Contents}
\newcommand\guestname{Guest Editors}
\newcommand\listfigurename{List of Figures}
\newcommand\listtablename{List of Tables}
\newcommand\partname{Part}
\newcommand\appendixname{Appendix}
\newcommand\abstractname{Abstract}
\renewcommand\refname{References}
\renewcommand\bibname{References}
\newcommand\normsname{Norms}
\newcommand\indexname{Index}
\newcommand\figurename{Figure}
\newcommand\schemename{Scheme}
\newcommand\tablename{Table}

% Clearemptydoublepage should really clear the running heads too
\newcommand{\clearemptydoublepage}{\newpage{\pagestyle{empty}\cleardoublepage}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Titling Macros %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Reset default command signatures

\def\title{\@ifnextchar[{\@title@wst@}{\@title@nst@}}
\def\@title@wst@[#1]{\titlemark{#1}\@title@assign@}
\def\@title@nst@#1{\titlemark{#1}\@title@assign@{#1}}
\def\@title@assign@#1{\def\@title{#1}}

\def\author{\@ifnextchar[{\@author@wst@}{\@author@nst@}}
\def\@author@wst@[#1]{\shortauthor{#1}\@author@assign@}
\def\@author@nst@#1{\shortauthor{#1}\@author@assign@{#1}}
\def\@author@assign@#1{\gdef\@author{{#1}}}

\def\shortauthor#1{\gdef\@shortauthor{#1}}\shortauthor{}

% Ifs for titling commands
\newif\if@supertitle@provided \@supertitle@providedfalse
\newif\if@specialissue@provided \@specialissue@providedfalse
\newif\if@guesteditor@provided \@guesteditor@providedfalse
\newif\if@subtitle@provided \@subtitle@providedfalse
\newif\if@date@provided \@date@providedfalse
\newif\if@dedi@provided \@dedi@providedfalse
\newif\if@classification@provided \@classification@providedfalse
\newif\if@abstract@provided \@abstract@providedfalse
\newif\if@keywords@provided \@keywords@providedfalse

\def\keywordsname{Keywords}

\def\corrlink{\protect\hypertarget{corr2}{\protect\hyperlink{corr1}{$^*$}}}
\def\corres#1{\gdef\@corres{\hypertarget{corr1}{\hyperlink{corr2}{$^*$}}\ignorespaces\hskip4pt#1}}\gdef\@corres{}
\def\email#1{\ \texttt{(\href{mailto:#1}{#1})}}%
\def\emails#1#2{\ (\href{mailto:#1}{\tt #1}; \href{mailto:#2}{\tt #2})}%
\def\date#1{\gdef\@date{(#1)}\global\@date@providedtrue}
\def\dedi#1{\def\@dedicate{#1}\global\@dedi@providedtrue}
\def\keywords#1{\gdef\@keywords{\@hangfrom{\textit{\keywordsname:}\ }#1}\global\@keywords@providedtrue}
\def\subtitle#1{\def\@subtitle{{#1}}\global\@subtitle@providedtrue}
\def\supertitle#1{\def\@supertitle{{#1}}\global\@supertitle@providedtrue}
\def\@classification{}
\newcommand\classification[2][{\rm 2010} Mathematics subject classification]{%
     \global\@classification@providedtrue
     \gdef\@classification{{\noindent\@hangfrom{\textit{#1:}\ }#2\par}}}

\newbox\@abstractbox%
\newenvironment{abstract}{\begingroup%
\global\@abstract@providedtrue%
\global\setbox\@abstractbox\vbox\bgroup\authorraggedright\leftskip44.5pt\fontsize{8pt}{9.5pt}\selectfont%
\noindent\ignorespaces}{\rlap{\vphantom{Ay}}\par\egroup\endgroup}%

\def\@fnsymbol#1{\ifcase#1\or *\or \dagger\or \ddagger\or
    \S\or \P\or \|\or **\or \dagger\dagger
    \or \ddagger\ddagger \else\@ctrerr\fi}

\def\raggedcenter{\leftskip0pt plus 1fil\rightskip0pt plus 1fil\parfillskip=0pt}%

%% Reimplement Titling Layout
\newcommand\maketitle{\par
   \begingroup\parindent=0pt\parskip=0pt%
    \thispagestyle{titlepage}%
    \global\@topnum\z@   % Prevents figures from going at top of page.
    \@maketitle
   \endgroup\let\author\relax
   \@afterindentfalse
   \@afterheading
   \global\let\maketitle\relax
   \global\let\@maketitle\relax}

\def\authorraggedright{\leftskip42.5pt\rightskip0pc plus 1fil}%

\def\@maketitle{%
  % Check if necessary information is present:
  \ifx\@journal@title\@default@journal@title
  \ClassError{CUP-PRM}{Journal Code not specified. Processing stopped.}
  {The journal code is a required field. Your LaTeX file must contain\MessageBreak
   \protect\journal{JJJJ}, where JJJJ is the four letter journal code.}%
  \fi
  \begingroup\def\@makefnmark{}%
   \if@supertitle@provided%
   \nointerlineskip\vglue5.1pt\nointerlineskip%
    \vbox{\raggedcenter\MakeUppercase{\@supertitle}\rlap{\vphantom{Ay}}}\par%
    \nointerlineskip\vglue17.1pt\nointerlineskip%
   \else%
    \nointerlineskip\vglue37.1pt\nointerlineskip%
   \fi%
   \vbox{\raggedright\let\\\break\fontsize{14.5pt}{16.5pt}\selectfont\bfseries\mathversion{bold}{\@title}\rlap{\vphantom{Ay}}}\par%
   \if@subtitle@provided\relax\und%
    \nointerlineskip\vskip2pt\nointerlineskip%
    \vbox{\raggedcenter\@subtitle\rlap{\vphantom{Ay}}}\par%
   \else%
    \nointerlineskip\vskip13.5pt\nointerlineskip%
    \fi%
\begingroup
\vbox{\authorraggedright\fontsize{10pt}{12pt}\selectfont\bfseries\@author}
\endgroup
   \if@date@provided\relax%
    \nointerlineskip\vskip13.5pt\nointerlineskip%
    \vbox{\authorraggedright\fontsize{8pt}{10pt}\selectfont\@date\rlap{\vphantom{Ay}}}\par%
   \fi%
   \if@dedi@provided\relax%
    \nointerlineskip\vskip9.5pt\nointerlineskip%
    \vbox{\raggedcenter\fontsize{8pt}{10pt}\selectfont\@dedicate\rlap{\vphantom{Ay}}}\par%
   \fi%
   \if@abstract@provided\relax%
    \nointerlineskip\vskip9.5pt\nointerlineskip%
    {\unvbox\@abstractbox}%
   \fi%
   \if@keywords@provided\relax%
    \nointerlineskip\vskip17pt\nointerlineskip%
    \vbox{\authorraggedright\fontsize{8pt}{10pt}\selectfont\@keywords\rlap{\vphantom{Ay}}}\par%
   \fi%
   \if@classification@provided\relax%
    \nointerlineskip\vskip11pt\nointerlineskip%
    \vbox{\authorraggedright\fontsize{8pt}{10pt}\selectfont\@classification\rlap{\vphantom{Ay}}}\par%
   \fi%
\endgroup
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Lastpage %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Last page number - from lastpage.sty
\def\lastpage@putlabel{\addtocounter{page}{-1}%
   \immediate\write\@auxout{\string
   \newlabel{LastPage}{{}{\thepage}}}%
   \addtocounter{page}{1}}
\AtEndDocument{%
   \message{Setting LastPage}%
   \clearpage\lastpage@putlabel}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%% Sectioning macros %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Lowest level heading that takes a number by default
\setcounter{secnumdepth}{3}

% Reset the default section macros to help with title casing
\def\@sect#1#2#3#4#5#6[#7]#8{%
  \ifnum#2=2\relax\@afterindenttrue\else\ifnum#2=3\relax\@afterindenttrue\else\@afterindentfalse\fi\fi%
  \renewcommand{\@seccntformat}[1]{{\csname the##1\endcsname.\enskip}}
  \ifnum #2>\c@secnumdepth
    \let\@svsec\@empty
  \else
    \refstepcounter{#1}%
    \protected@edef\@svsec{\@seccntformat{#1}\relax}%
  \fi
  \@tempskipa #5\relax
  \ifdim \@tempskipa>\z@
    \begingroup
    \ifnum#2=1\relax%
      #6{%
        \ifappend\relax\else\@hangfrom{\hskip #3\relax\@svsec}\fi%
          \interlinepenalty \@M {#8}\@@par}%
    \else%
      #6{%
        \noindent{\hskip #3\relax\@svsec}%
          \interlinepenalty \@M {#8}\@@par}%
    \fi%
    \endgroup
    \csname #1mark\endcsname{#7}%
    \addcontentsline{toc}{#1}{%
      \ifnum #2>\c@secnumdepth \else
        \protect\numberline{\csname the#1\endcsname}%
      \fi
      #7}%
  \else
    \def\@svsechd{%
      #6{\hskip #3\relax
      \@svsec #8}%
      \csname #1mark\endcsname{#7}%
      \addcontentsline{toc}{#1}{%
        \ifnum #2>\c@secnumdepth \else
          \protect\numberline{\csname the#1\endcsname}%
        \fi
        #7}}%
  \fi
  \@xsect{#5}}

\def\headlevelfont{\reset@font\fontsize{10pt}{12}\bfseries\selectfont\mathversion{bold}\raggedright}%

% H1
\def\section{%
  \@startsection{section}{1}{\z@}
  {-15\p@ plus -3\p@ minus -3\p@}{8\p@}
  {\headlevelfont}}

% H2
\def\subsection{%
  \@startsection{subsection}{2}{\z@}
  {-12\p@ plus -1\p@ minus -2\p@}{6\p@}
  {\headlevelfont}}

% H3
\def\subsubsection{%
  \@startsection{subsubsection}{3}{\z@}
  {-12\p@ plus -1\p@ minus -2\p@}{-5pt}
  {\reset@font\normalsize\itshape\selectfont}}

\def\paragraph{%
  \@startsection{paragraph}{4}{\z@}
  {-1\@bls plus -1\p@}{-1em}
  {\reset@font\normalfont\normalsize\itshape}}

\def\refsection{%
  \@startsection{section}{1}{\z@}
  {-19\p@ plus -2\p@ minus -1\p@}{2\p@}
  {\fontsize{9}{10}\selectfont\sf\itshape\raggedright}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Footnotes %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\@makefnmark{$^{\@thefnmark}$}%
\renewcommand\footnoterule{}
%\@addtoreset{footnote}{page}

\def\@fnsymbol#1{\ensuremath{\ifcase#1\or \text{*}\or \dagger\or \ddagger\or
   \mathsection\or \mathparagraph\or \|\or **\or \dagger\dagger
   \or \ddagger\ddagger \else\@ctrerr\fi}}

%\renewcommand\thefootnote{\@fnsymbol\c@footnote}

\newcommand\@makefntext[1]{%
  \begingroup
    \leftskip=\z@\rightskip=\z@
    \footnotesize
    \setlength\parindent{7pt}%
    \@makefnmark\ignorespaces#1%
  \endgroup}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% From ifmtarg.sty
% Copyright Peter Wilson and Donald Arseneau, 2000
\begingroup
\catcode`\Q=3
\long\gdef\@ifmtarg#1{\@xifmtarg#1QQ\@secondoftwo\@firstoftwo\@nil}
\long\gdef\@xifmtarg#1#2Q#3#4#5\@nil{#4}
\long\gdef\@ifnotmtarg#1{\@xifmtarg#1QQ\@firstofone\@gobble\@nil}
\endgroup
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%% PostScript Rotation Macros %%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newif\if@rotate \@rotatefalse
\newif\if@rotatecenter \@rotatecenterfalse
\def\rotatecenter{\global\@rotatecentertrue}
\def\rotateendcenter{\global\@rotatecenterfalse}
\def\rotate{\global\@rotatetrue}
\def\endrotate{\global\@rotatefalse}
\newdimen\rotdimen
\def\rotstart#1{\special{ps: gsave currentpoint currentpoint translate
    #1 neg exch neg exch translate}}
\def\rotfinish{\special{ps: currentpoint grestore moveto}}
\def\rotl#1{\rotdimen=\ht#1\advance\rotdimen by \dp#1
    \hbox to \rotdimen{\vbox to\wd#1{\vskip \wd#1
    \rotstart{270 rotate}\box #1\vss}\hss}\rotfinish}
\def\rotr#1{\rotdimen=\ht #1\advance\rotdimen by \dp#1
    \hbox to \rotdimen{\vbox to \wd#1{\vskip \wd#1
    \rotstart{90 rotate}\box #1\vss}\hss}\rotfinish}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%% Figures and Tables %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage[hypcap]{caption}

\setlength{\abovecaptionskip}{8.8\p@}
\setlength{\belowcaptionskip}{2\p@}

\def\captionfont{\fontsize{9}{11}\selectfont}%

\newbox\figurecaptionbox
\long\def\@makecaption#1#2{%
  \nointerlineskip\vskip\abovecaptionskip\nointerlineskip%
  \let\query\figquery%
  \setbox\figurecaptionbox=\hbox{\captionfont\@hangfrom{#1~}#2}%
  \ifdim\wd\figurecaptionbox<1.99\hsize%
    \vbox{\raggedcenter\captionfont\@hangfrom{#1~}{#2}}\par%
  \else
    \vbox{\captionfont{#1}~{#2}}\par%
  \fi}

\newbox\schemecaptionbox
\long\def\@schemecaption#1#2{\vspace{\abovecaptionskip}\par%
\let\query\figquery%
  \setbox\schemecaptionbox=\hbox{#1\quad #2}%
  \ifdim\wd\schemecaptionbox<\hsize
{\box\schemecaptionbox}
  \else
\fontsize{8}{9}\selectfont
    \unhbox\schemecaptionbox
    \par
  \fi}

\def\tabcaptionfont{\fontsize{9}{11}\selectfont}%

\newbox\tablecaptionbox
\long\def\@tablecaption#1#2{%
\let\query\tabquery%
\setbox\tablecaptionbox=\hbox{\tabcaptionfont{#1}~{\itshape#2}} %
  \ifdim\wd\tablecaptionbox<1.99\hsize%
    \vbox{\raggedcenter\tabcaptionfont{#1}~{\itshape#2}\rlap{\vphantom{Ay}}}\par%
  \else
    \vbox{\tabcaptionfont{#1}~{\itshape#2}\rlap{\vphantom{Ay}}}\par%
  \fi}


\def\thefigure{\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{{\figurename}~\thefigure.}
\def\figure{\@float{figure}}
\def\endfigure{\end@float}
\@namedef{figure*}{\@dblfloat{figure}}
\@namedef{endfigure*}{\end@dblfloat}

\def\thescheme{\@arabic\c@scheme}
\def\fps@scheme{h}
\def\ftype@scheme{2}
\def\ext@scheme{los}
\def\fnum@scheme{\MakeUppercase{\schemename}~\thescheme.}
\def\scheme{\let\@makecaption\@schemecaption\@float{scheme}}
\def\endscheme{\end@float}
\@namedef{scheme*}{\let\@makecaption\@schemecaption\@dblfloat{scheme}}
\@namedef{endscheme*}{\end@dblfloat}

\def\thetable{\@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{3}
\def\ext@table{lot}
\def\fnum@table{{\tablename}~\thetable.}
\def\table{\let\@makecaption\@tablecaption\@float{table}}
\def\endtable{\end@float}
\@namedef{table*}{\let\@makecaption\@tablecaption\@dblfloat{table}}
\@namedef{endtable*}{\end@dblfloat}

\newdimen\tempdime
\newbox\temptbox

\newlength{\abovefigskip}
\newlength{\belowfigskip}
\setlength{\abovefigskip}{\z@}
\setlength{\belowfigskip}{\z@}

\def\toprule{\noalign{\ifnum0=`}\fi
  \hrule \@height 7\p@ \@width \z@
  \hrule \@height 0.5\p@
  \hrule \@height 4.9\p@ \@width \z@
  \futurelet \@tempa\@xhline}

\def\midrule{\noalign{\ifnum0=`}\fi
  \hrule \@height 4.3\p@ \@width \z@
  \hrule \@height 0.5\p@
  \hrule \@height 4.9\p@ \@width\z@
  \futurelet \@tempa\@xhline}

\def\botrule{\noalign{\ifnum0=`}\fi
  \hrule \@height 4.3\p@ \@width \z@
  \hrule \@height 0.5\p@
  \futurelet \@tempa\@xhline}

% Table and array parameters
\setlength\arraycolsep{.5em}
\setlength\tabcolsep{.5em}
\setlength\arrayrulewidth{.25pt}
\setlength\doublerulesep{2.5pt}
\renewcommand\arraystretch{1}

\def\hrulefill{\leavevmode\leaders\hrule height .25pt\hfill\kern\z@}

\newcolumntype{P}[1]{>{\raggedright\let\\\@arraycr\hangindent1em}p{#1}}

\newenvironment{processtable}[3]{\setbox\temptbox=\hbox{{\fontsize{9}{12}\selectfont#2}}%
\tempdime\wd\temptbox\@processtable{#1}{#2}{#3}{\tempdime}}%
{\relax}

\newenvironment{@processtable}[4]{%
\if!#1!%
\addtocounter{table}{-1}%%ADDED ON 21/12/05
\def\fnum@table{}%
\else%
\def\fnum@table{{\tablename}~\thetable.}%
\fi%
\if@rotate
\setbox4=\vbox to \textwidth{\vss\hbox to \textheight{%
\begin{minipage}{#4}%
\caption{#1}\par%
{\fontsize{9}{11}\selectfont#2}\par%
\@ifmtarg{#3}{}{\und}%
\end{minipage}}\vss}
\else
\setbox4=\hbox to \textwidth{{\hss\begin{minipage}[t]{#4}%
\caption{#1}\par%
{\fontsize{9}{11}\selectfont#2}\par%
\@ifmtarg{#3}{}{\und}%
\end{minipage}\hss}}
\fi
\if@rotate\rotr{4}\else\box4\fi}
{\relax}

\newcommand{\tabhead}[1]{#1}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Lists %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\labelenumi{{\rm(\roman{enumi})}}
\def\theenumi{\roman{enumi}}
\def\labelenumii{{\rm(\alph{enumii})}}
\def\theenumii{\alph{enumii}}
\def\p@enumii{\theenumi}
\def\labelenumiii{{\rm(\arabic{enumiii})}}
\def\theenumiii{\roman{enumiii}}
\def\p@enumiii{\theenumi(\theenumii)}
\def\labelenumiv{{\rm(\arabic{enumiv})}}
\def\theenumiv{\Alph{enumiv}}
\def\p@enumiv{\p@enumiii\theenumiii}
\def\labelitemi{$\bullet$}
\def\labelitemii{$\bullet$}
\def\labelitemiii{$\bullet$}
\def\labelitemiv{$\bullet$}

\setlength{\leftmargini}{8pt}
\setlength{\leftmarginii}{\z@}
\setlength{\leftmarginiii}{\z@}
\setlength{\leftmarginiv}{\z@}

\def\enumargs{%
   \partopsep     \z@
   \itemsep       8pt
   \parsep        \z@
   \leftmargin    \z@
   \rightmargin   \z@
   \labelsep      5pt
   \listparindent \z@
   \itemindent    \z@}

\def\enumerate{%
    \@ifnextchar[{\@numerate}{\@numerate[3]}}

\def\@numerate[#1]{%
     \ifnum \@enumdepth >3 \@toodeep\else
     \advance\@enumdepth \@ne
     \edef\@enumctr{enum\romannumeral\the\@enumdepth}
     \list{\csname label\@enumctr\endcsname}{%
       \enumargs
       \setlength{\leftmargin}{\csname leftmargin\romannumeral\the\@listdepth\endcsname}
       \usecounter{\@enumctr}
       \settowidth\labelwidth{(#1)}
       \addtolength{\leftmargin}{\labelwidth}
       \addtolength{\leftmargin}{\labelsep}
       \def\makelabel##1{\hss \llap{##1}}}%
     \fi
   }
\def\endenumerate{\endlist\advance \@listdepth -1}

% Changes to the list parameters for itemize
\def\itemargs{%
   \partopsep     \z@
   \itemsep       8pt
   \parsep        \z@
   \rightmargin   \z@
   \labelsep      5pt
   \listparindent \parindent
   \itemindent    \z@}

\def\itemize{%
    \@ifnextchar[{\@itemize}{\@itemize[$\bullet$]}}

\def\@itemize[#1]{%
     \ifnum \@itemdepth >3 \@toodeep\else
     \advance\@itemdepth \@ne
     \edef\@itemctr{item\romannumeral\the\@itemdepth}
     \list{\csname label\@itemctr\endcsname}{%
       \itemargs
       \setlength{\leftmargin}{\csname leftmargin\romannumeral\the\@listdepth\endcsname}
       \settowidth\labelwidth{#1}
       \addtolength{\leftmargin}{\labelwidth}
       \addtolength{\leftmargin}{\labelsep}
       \def\makelabel##1{\hss \llap{##1}}}%
     \fi
   }
\let\enditemize\endlist

\setlength{\topsep}{0\p@}% \@plus 1\p@ \@minus 1\p@}
\setlength{\itemsep}{\z@}

\def\@listI{\leftmargin\leftmargini\topsep8\p@ plus 2\p@}
\let\@listi\@listI
\@listi
\def\@listii{\leftmargin\leftmarginii\topsep\z@}
\def\@listiii{\leftmargin\leftmarginiii\topsep\z@}
\def\@listiv{\leftmargin\leftmarginiv\topsep\z@}
\def\@listv{\leftmargin\leftmarginv\topsep\z@}
\def\@listvi{\leftmargin\leftmarginvi\topsep\z@}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% unnumbered list %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newenvironment{description}{%
  \begin{list}{}{%
      \usecounter{enumi}%
      \setlength{\itemsep}{\z@}%
      \setlength{\labelwidth}{\z@}%
      \setlength{\leftmargin}{2em}%
      \setlength{\itemindent}{-2em}}}%
{\end{list}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Extracts %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\quotation{\par\begin{list}{}{\fontsize{9}{10}\selectfont%  Extracts in small type
      \setlength{\topsep}{\medskipamount}%
      \setlength{\itemsep}{\z@}%
      \setlength\labelwidth{\z@}%
      \setlength\labelsep{\z@}%
      \setlength\leftmargin{18pt}%
      \setlength\rightmargin{18pt}%
      \listparindent \parindent}%
  \item[\vrule width\z@ height 9\p@]}
\def\endquotation{\end{list}}
\let\quote\quotation
\let\endquote\endquotation
\newcommand{\source}[1]{\newline\hbox{}\hfill{#1}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% programs %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
{\obeyspaces\global\let =\ }

\newskip\cmskipamount%
\cmskipamount=12pt plus 6pt minus 3pt%

\def\cmskip{\removelastskip\vskip\cmskipamount}

\long\def\bCM{\begingroup\parindent=0pt\cmskip\ttfamily%
\obeylines\obeyspaces}%

\def\eCM{\cmskip\endgroup}%

\long\def\tbCM{\begingroup\parindent=0pt\cmskip%
\obeylines\obeyspaces}%

\def\teCM{\cmskip\endgroup}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Counter for saving the section numbering depth
\newcounter{savesecnumdepth}

%%%%%%%%%%%%%%%%%%%%%%%%%% Acknowledgments %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\providecommand{\ackname}{Acknowledgements}
\newcommand{\ack}[2][\ackname]{\bgroup\removelastskip\vskip10pt%
\noindent\textbf{#1}\par \noindent #2\par%
\egroup}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Notes %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\enoteheading{\refsection*{\fontsize{9}{10}\selectfont\sf\itshape \notesname
  \@mkboth{{\notesname}}{{\notesname}}}\vspace*{7pt}%
     \leavevmode\par}

\def\enoteformat{\rightskip\z@ \leftskip\z@\parindent=0pt
     \leavevmode{\hbox{\hskip14pt${\@theenmark}$}.\enskip}}


\newenvironment{notes}[1][99]{%
  \begingroup%
 }%
{\endgroup}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%% Nomenclature %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\providecommand{\nomenname}{Nomenclature}
\newcommand{\nomen}[1][\nomenname]{%
  \setcounter{savesecnumdepth}{\value{secnumdepth}}%
  \setcounter{secnumdepth}{0}%
  \refsection{#1}%
\vspace*{5pt}
  \setcounter{secnumdepth}{\value{savesecnumdepth}}%
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\bibauthor#1{{#1}}%

\renewenvironment{thebibliography}[1]{%
  \begingroup
  \setcounter{secnumdepth}{0}
  \section{\bibname}\vspace*{-1pt}%
  \fontsize{8pt}{9.5}\selectfont%
  \def\@biblabel##1{##1}%
  \begin{list}{\@biblabel{\arabic{enumi}}}{%
      \usecounter{enumi}%
      \setlength\leftmargin{\z@}%
      \setlength{\labelsep}{15.5pt}%
      \setlength{\itemsep}{1pt}%
      \settowidth{\labelwidth}{#1}%
      \addtolength{\leftmargin}{\labelwidth}%
      \addtolength{\leftmargin}{\labelsep}}}%
{\end{list}\endgroup}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newskip\normskip
\setlength\normskip{6pt}

\newenvironment{normes}{%
  \begingroup
  \footnotesize\parindent=0pt
  \setcounter{secnumdepth}{0}
  \vskip\normskip
  {\fontsize{10}{12}\selectfont\bf\normsname}%
  \begin{list}{}{%
      \usecounter{enumi}%
      \setlength{\itemsep}{\z@}%
      \setlength{\labelwidth}{0pt}%
      \setlength{\leftmargin}{2em}%
      \setlength{\itemindent}{-2em}}}%
{\end{list}\endgroup}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Index %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newif\if@restonecol
\def\theindex{\@mainmatterfalse
  \@restonecoltrue\if@twocolumn\@restonecolfalse\fi
  \begingroup\parindent \z@
  \addcontentsline{toc}{section}{Index}
  \columnseprule \z@
  \columnsep 1pc\section*{\indexname} %Subject or Author here
  \parskip\z@ plus .3\p@\relax\let\item\idxitem\fontsize{8\p@}{10\p@}\selectfont}
\def\idxitem{\par\raggedright\hangindent 3em}
\def\subitem{\par\penalty1000\raggedright\hangindent 3em\hspace*{1em}}
\def\subsubitem{\par\penalty1000\raggedright\hangindent 3em\hspace*{2em}}
\def\endtheindex{\if@restonecol\endgroup\onecolumn\else\clearpage\fi}
\def\indexspace{\par \vskip 18\p@ plus 12\p@ minus 12\p@\relax}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%% Appendix %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newif\ifappend % Are we in the Appendix?

\def\appendix{%
  \setcounter{secnumdepth}{2}
  \renewcommand{\thesection}{\Alph{section}}
  \renewcommand\theequation{\thesection\arabic{equation}}
  \def\thetable{\thesection\@arabic\c@table}
  \def\thefigure{\thesection\@arabic\c@figure}
  \def\theHtable{\thesection\@arabic\c@table}
  \def\theHfigure{\thesection\@arabic\c@figure}
  \setcounter{section}{0}
  \setcounter{table}{0}
  \setcounter{figure}{0}
  \appendtrue}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Override settings in MathTime back to TeX defaults
\DeclareMathSizes{5}     {5}   {5}  {5}
\DeclareMathSizes{6}     {6}   {5}  {5}
\DeclareMathSizes{7}     {7}   {5}  {5}
\DeclareMathSizes{8}     {8}   {6}  {5}
\DeclareMathSizes{9}     {9}   {7}  {5}
\DeclareMathSizes{10}   {10}   {7}  {5}
\DeclareMathSizes{12}   {12}   {9}  {7}

%Math parameters
\setlength{\jot}{5\p@}
\skip\@mpfootins = \skip\footins
\fboxsep=6\p@
\fboxrule=.25\p@

\medmuskip=4mu% plus 2mu minus 4mu
\thickmuskip=5mu% plus 5mu

\vbadness=9999
\tolerance=9999
\doublehyphendemerits=10000
\doublehyphendemerits 640000
\finalhyphendemerits  1000000

\flushbottom
\frenchspacing
\onecolumn
\pagestyle{headings}

% Author queries
\fboxsep=4\p@
\fboxrule=0.5\p@

\ifnoquery
\def\colfig{{\marginnote{}}}
\newcommand{\query}[2][0pt]{%
  \marginpar{%\vspace*{#1}%
    {\parbox{\marginparwidth}{%
     \raggedright\small{}}}}}
\newcommand{\leftquery}[2][0pt]{%
  \marginpar{%\vspace*{#1}%
    {\parbox{\marginparwidth}{%
     \raggedright\small{}}}}}
\newcommand{\rightquery}[2][0pt]{%
  \marginpar{%\vspace*{#1}%
    {\parbox{\marginparwidth}{%
     \raggedright\small{}}}}}
\def\surname#1{#1}
\else
\definecolor{MAG}{cmyk}{0,.36,0,0}
\def\surname#1{{\protect\fboxsep=1pt\protect\colorbox{mag}{#1}}}%
\def\colfig{{\marginnote{\vskip14pt\begin{turn}{90}{\fbox{\fontsize{7}{9}\selectfont\raggedright Colour online, B/W in print}}\end{turn}}}}
\newcommand{\query}[2][0pt]{%
  \marginpar{%\vspace*{#1}%
    {\parbox{\marginparwidth}{%
     \raggedright\small{\bf #2}}}}}%
\newcommand{\leftquery}[2][0pt]{\reversemarginpar%
  \marginpar{%\vspace*{#1}%
    {\parbox{\marginparwidth}{%
     \raggedright\small{\bf #2}}}}}%
\newcommand{\rightquery}[2][0pt]{\normalmarginpar%
  \marginpar{%\vspace*{#1}%
    {\parbox{\marginparwidth}{%
     \raggedright\small{\bf #2}}}}}%
\fi

\newdimen\tabqueryskip\tabqueryskip\textwidth
\newdimen\figqueryskip\figqueryskip\textwidth
\def\figquery#1{\ifnoquery\else\hbox to 0pt{\hskip7.5pc\advance\figqueryskip-\tempdime\hskip-.5\figqueryskip\fontsize{9}{11}\selectfont\textbf{\hsize2pc #1}}\fi}
\def\tabquery#1{\ifnoquery\else\hbox to 0pt{\hskip-7.5pc\advance\tabqueryskip-\tempdime\hskip-.5\tabqueryskip\fontsize{9}{11}\selectfont\textbf{\hsize2pc #1}}\fi}


\newenvironment{queries}[1][9.99]{%
  \begingroup
  \thispagestyle{empty}
  \advance\@enumdepth \@ne
  \edef\@enumctr{enum\romannumeral\the\@enumdepth}
  \def\labelenumi{\arabic{enumi})}
  \def\labelenumii{\alph{enumii})}
  \begin{list}{\csname label\@enumctr\endcsname}{%\small%
      \setlength{\topsep}{12\p@}%
    \setlength{\itemsep}{6\p@}%
      \setlength{\leftmargin}{\z@}%
      \settowidth{\labelwidth}{\bfseries#1}%
      \setlength{\labelsep}{1.5em}%
      \addtolength{\leftmargin}{\labelwidth}%
      \addtolength{\leftmargin}{\labelsep}
      \def\makelabel##1{\hss\llap{{##1}}}
    }}
{\end{list}\endgroup}

% Short-form coding
\newcommand\etal{\textit{et~al.}}
\newcommand\eg{\textit{e.g.}}
\newcommand\ie{\textit{i.e.}}
\let\endash\textendash

\def\dbond{\raise0.18ex\hbox{$=$}}
\def\bond{\raise0.18ex\hbox{$-$}}

\def\endash{--}
\def\emdash{\,--\,}
\def\sdot#1{{\buildrel{\scriptscriptstyle\bullet}\over{\hbox{$#1$}}}}
\def\ssdot#1{{\buildrel{\scriptscriptstyle\bullet\bullet}\over{\hbox{$#1$}}}}

\def\refmsg{\noindent\hangindent=1em}%

\def\z{\phantom}

%%%For New Table

\newcount\mscount
\def\multispan#1{\omit \mscount#1\relax
  \loop\ifnum\mscount>\@ne \sp@n\repeat}
\def\sp@n{\span\omit\advance\mscount\m@ne}

\hyphenation{Table}
\hyphenation{Figure}
\hyphenation{Section}
\hyphenation{equation}
\hyphenation{Theorem}
\hyphenation{Lemma}
\hyphenation{Algorithm}
\hyphenation{Definition}
\hyphenation{Corollary}
\hyphenation{Proof}
\hyphenation{Remark}

\def\bcontinued{({\it continued\/})}
\def\tcontinued{Continued}

\def\dd{{\rm d}}
\def\ee{{\rm e}}
\def\cir#1{{\accent"17 #1}}

\newdimen\p@renwd

\def\spbordermatrix#1{\begingroup \m@th
  \setbox\z@\vbox{\def\cr{\crcr\noalign{\kern2\p@\global\let\cr\endline}}%
    \ialign{$##$\hfil\kern2\p@\kern\p@renwd&\thinspace\hfil$##$\hfil
      &&\quad\hfil$##$\hfil\crcr
      \omit\strut\hfil\crcr\noalign{\kern-\baselineskip}%
      #1\crcr\omit\strut\cr}}%
  \setbox\tw@\vbox{\unvcopy\z@\global\setbox\@ne\lastbox}%
  \setbox\tw@\hbox{\unhbox\@ne\unskip\global\setbox\@ne\lastbox}%
  \setbox\tw@\hbox{$\kern\wd\@ne\kern-\p@renwd\left[\kern-\wd\@ne
    \global\setbox\@ne\vbox{\box\@ne\kern2\p@}%
    \vcenter{\kern-\ht\@ne\unvbox\z@\kern-\baselineskip}\,\hskip-\bmskip\right]$}%
  \null\;\vbox{\kern\ht\@ne\box\tw@}\endgroup}


\def\sqbordermatrix#1{\begingroup \m@th
  \setbox\z@\vbox{\def\cr{\crcr\noalign{\kern2\p@\global\let\cr\endline}}%
    \ialign{$##$\hfil\kern2\p@\kern\p@renwd&\thinspace\hfil$##$\hfil
      &&\quad\hfil$##$\hfil\crcr
      \omit\strut\hfil\crcr\noalign{\kern-\baselineskip}%
      #1\crcr\omit\strut\cr}}%
  \setbox\tw@\vbox{\unvcopy\z@\global\setbox\@ne\lastbox}%
  \setbox\tw@\hbox{\unhbox\@ne\unskip\global\setbox\@ne\lastbox}%
  \setbox\tw@\hbox{$\kern\wd\@ne\kern-\p@renwd\left[\kern-\wd\@ne
    \global\setbox\@ne\vbox{\box\@ne\kern2\p@}%
    \vcenter{\kern-\ht\@ne\unvbox\z@\kern-\baselineskip}\,\right]$}%
  \null\;\vbox{\kern\ht\@ne\box\tw@}\endgroup}

\def\llbordermatrix#1{\begingroup \m@th
  \setbox\z@\vbox{\def\cr{\crcr\noalign{\kern2\p@\global\let\cr\endline}}%
    \ialign{$##$\hfil\kern2\p@\kern\p@renwd&\thinspace\hfil$##$\hfil
      &&\quad\hfil$##$\hfil\crcr
      \omit\strut\hfil\crcr\noalign{\kern-\baselineskip}%
      #1\crcr\omit\strut\cr}}%
  \setbox\tw@\vbox{\unvcopy\z@\global\setbox\@ne\lastbox}%
  \setbox\tw@\hbox{\unhbox\@ne\unskip\global\setbox\@ne\lastbox}%
  \setbox\tw@\hbox{$\kern\wd\@ne\kern-\p@renwd\left[\kern-\wd\@ne
    \global\setbox\@ne\vbox{\box\@ne\kern2\p@}%
    \vcenter{\kern-\ht\@ne\unvbox\z@\kern-\baselineskip}\,\right.$}%
  \null\;\vbox{\kern\ht\@ne\box\tw@}\endgroup}

\def\lbordermatrix#1{\begingroup \m@th
  \setbox\z@\vbox{\def\cr{\crcr\noalign{\kern2\p@\global\let\cr\endline}}%
    \ialign{$##$\hfil\kern2\p@\kern\p@renwd&\thinspace\hfil$##$\hfil
      &&\quad\hfil$##$\hfil\crcr
      \omit\strut\hfil\crcr\noalign{\kern-\baselineskip}%
      #1\crcr\omit\strut\cr}}%
  \setbox\tw@\vbox{\unvcopy\z@\global\setbox\@ne\lastbox}%
  \setbox\tw@\hbox{\unhbox\@ne\unskip\global\setbox\@ne\lastbox}%
  \setbox\tw@\hbox{$\left[\kern\wd\@ne\kern-\p@renwd\kern-\wd\@ne
    \global\setbox\@ne\vbox{\box\@ne\kern2\p@}%
    \vcenter{\kern-\ht\@ne\unvbox\z@\kern-\baselineskip}\,\right.$}%
  \null\;\vbox{\kern\ht\@ne\box\tw@}\endgroup}

\newdimen\bmskip
\bmskip=0pt

\def\rbordermatrix#1{\begingroup \m@th
  \setbox\z@\vbox{\def\cr{\crcr\noalign{\kern2\p@\global\let\cr\endline}}%
    \ialign{\hfil$##$\hfil\kern6\p@\kern\p@renwd&\thinspace\hfil$##$\hfil
      &&\quad\hfil$##$\hfil\crcr
      \omit\strut\hfil\crcr\noalign{\kern-\baselineskip}%
      #1\crcr\omit\strut\cr}}%
  \setbox\tw@\vbox{\unvcopy\z@\global\setbox\@ne\lastbox}%
  \setbox\tw@\hbox{\unhbox\@ne\unskip\global\setbox\@ne\lastbox}%
  \setbox\tw@\hbox{$\left.\kern\wd\@ne\kern-\p@renwd\kern-\wd\@ne
    \global\setbox\@ne\vbox{\box\@ne\kern2\p@}
    \vcenter{\kern-\ht\@ne\unvbox\z@\kern-\baselineskip}\hskip-\bmskip\right]$}%
  \null\;\vbox{\kern\ht\@ne\box\tw@}\endgroup}

\chardef\permil="89%

\def\tagform@#1{\maketag@@@{{(\ignorespaces#1\unskip\@@italiccorr)}}}

\renewcommand{\eqref}[1]{\textup{({\ref{#1}})}}

\ifoldtable
\ActivateBarAndQuote
\fi

\newtheorem{mythm}{mythm}[section]

\definecolor{mag}{cmyk}{0,.36,0,0}

\ifprinter
\def\scref#1#2{\def\schemeautorefname{#1}\autoref{#2}\def\schemeautorefname{Scheme}}
\def\fref#1#2{\def\figureautorefname{#1}\autoref{#2}\def\figureautorefname{Figure}}
\def\tref#1#2{\def\tableautorefname{#1}\autoref{#2}\def\tableautorefname{Table}}
\def\sref#1#2{\def\sectionautorefname{#1\hskip-3.3pt}\autoref{#2}\def\sectionautorefname{Section}}
\def\ssref#1#2{\def\subsectionautorefname{#1\hskip-3.3pt}\autoref{#2}\def\subsectionautorefname{Subsection}}

\setcounter{tocdepth}{0}
\usepackage[bookmarksnumbered,raiselinks,breaklinks]{hyperref}
\hypersetup{
    colorlinks,%
    citecolor=black,%
    filecolor=black,%
    linkcolor=black,%
    urlcolor=black
}
\else
\iflink
\setcounter{tocdepth}{3}
\def\scref#1#2{\def\schemeautorefname{#1}\autoref{#2}\def\schemeautorefname{Scheme}}
\def\fref#1#2{\def\figureautorefname{#1}\autoref{#2}\def\figureautorefname{Figure}}
\def\tref#1#2{\def\tableautorefname{#1}\autoref{#2}\def\tableautorefname{Table}}
\def\sref#1#2{\def\sectionautorefname{#1\hskip-3.3pt}\autoref{#2}\def\sectionautorefname{Section}}
\def\ssref#1#2{\def\subsectionautorefname{#1\hskip-3.3pt}\autoref{#2}\def\subsectionautorefname{Subsection}}

\usepackage[bookmarksnumbered,raiselinks,breaklinks]{hyperref}
\hypersetup{
    colorlinks,%
    citecolor=blue,%
    filecolor=blue,%
    linkcolor=blue,%
    urlcolor=blue
}
\fi
\fi

\usepackage{breakurl}
\urlstyle{same}

\usepackage{marginnote}
\ifpreview\relax%
\def\bwfig#1{\marginnote{\vskip10pt\begin{turn}{90}{}\end{turn}}}
\def\colfig#1{\marginnote{\vskip10pt\begin{turn}{90}{}\end{turn}}}
\else
\ifprinter\relax%
\def\bwfig#1{\marginnote{\vskip10pt\begin{turn}{90}{}\end{turn}}}
\def\colfig#1{\marginnote{\vskip10pt\begin{turn}{90}{}\end{turn}}}
\else%
\def\bwfig#1{\marginnote{\vskip10pt\begin{turn}{90}{\fbox{\fontsize{6}{8}\selectfont Fig.~#1 - B/W online, B/W in print}}\end{turn}}}
\def\colfig#1{\marginnote{\vskip10pt\begin{turn}{90}{\fbox{\fontsize{6}{8}\selectfont Fig.~#1 - Colour online, B/W in print}}\end{turn}}}
\fi\fi%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%To improve spacing in eqnarray

\def\eqnarray{\stepcounter{equation}\let\@currentlabel=\theequation
\global\@eqnswtrue
\global\@eqcnt\z@\tabskip\@centering\let\\=\@eqncr
$$\halign to \displaywidth\bgroup\@eqnsel\hskip\@centering
  $\displaystyle\tabskip\z@{##{}}$&\global\@eqcnt\@ne
  \hfil$\displaystyle{{}##{}}$\hfil
  &\global\@eqcnt\tw@ $\displaystyle\tabskip\z@{{}##}$\hfil
   \tabskip\@centering&\llap{##}\tabskip\z@\cr}

%%%%%%%%%%%%%%%%%%%%%%%

\ifprinter
\graphicspath{{../Pagination/Art/}}
\else
\graphicspath{{../Pagination/Art/Webfiles/}{../Pagination/Art/}}
\fi


\let\leq\leqslant% included as per the request on 20/11/18
\let\le\leqslant
\let\geq\geqslant
\let\ge\geqslant

\usepackage{authblk-modified}

%%%%%%%%%%%%%%%%%%%%% .cfg %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{bibpattern-prm}
\usepackage{CUP-FM-Group}

\def\@journal@title{Proceedings of the Royal Society of Edinburgh}%
\def\jourinf{\textit{\@journal@title}, \page@extent@info, \textit{\year@info}}

\def\@print@issn{xxxx-xxxx/xx}%
\def\@doi@fixed@field{10.1017/prm.}%%% Changed as per mail dated 24-12-18
\def\@doi@variable@field{00000000000000000000}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\endinput

%%%%%%%%%%%%%%%%%%%%%%%%%%% End of LaTeX Document Class %%%%%%%%%%%%%%%%%%%%%%%%
