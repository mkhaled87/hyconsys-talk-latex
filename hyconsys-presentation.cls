\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hyconsys-presentation}[2020/05/31 HyconSys Lab Design Slides v0.1]

% use widescreen?
\newif\ifwidescreen
\widescreentrue

% show navigation symbols?
\newif\ifnavsym
\navsymfalse

% show threeliner?
\newif\ifthreeliner
\threelinertrue

% four pages on one?
\newif\iffourpp
\fourppfalse

% two pages on one?
\newif\iftwopp
\twoppfalse

% process options
\DeclareOption{4to3}{\widescreenfalse}
\DeclareOption{16to9}{\widescreentrue}
\DeclareOption{2on1}{%
  \twopptrue
  \PassOptionsToClass{handout}{beamer}
}
\DeclareOption{4on1}{%
  \fourpptrue
  \PassOptionsToClass{handout}{beamer}
}
\DeclareOption{handout}{\PassOptionsToClass{handout}{beamer}}
\DeclareOption{navsym}{\navsymtrue}
\DeclareOption{nothreeliner}{\threelinerfalse}
\DeclareOption{german}{\PassOptionsToPackage{german}{hyconsys-base}}
\DeclareOption{english}{\PassOptionsToPackage{english}{hyconsys-base}}
\ProcessOptions\relax

% footline text
\newcommand{\insertfootline}{~}
\newcommand{\footline}[1]{\renewcommand{\insertfootline}{#1}}

\ifwidescreen

\newcommand{\hyconsyspaperwidth}{25.4cm}
\newcommand{\hyconsyspaperheight}{14.2875cm}
\newcommand{\hyconsysauthorblockwidth}{15cm}

% load base class and packages for 16to9
\LoadClass[t,hyperref={hidelinks,breaklinks},aspectratio=169]{beamer}
\RequirePackage[
  orientation=landscape,
  size=custom,
  width=25.4,
  height=14.2875,
  scale=0.5 % erzeugt 16pt Schriftgröße
]{beamerposter}
\newcommand{\PraesentationSchriftgroesseSehrGross}{\fontsize{25}{30}}
\newcommand{\PraesentationSchriftgroesseGross}{\fontsize{18}{27}}
\newcommand{\PraesentationSchriftgroesseNormal}{\fontsize{14}{21}}
\newcommand{\PraesentationSchriftgroesseKlein}{\fontsize{11}{17}}
\newcommand{\PraesentationSchriftgroesseDreizeiler}{\fontsize{7}{10}}
\newcommand{\PraesentationSchriftgroesseAufzaehlungszeichen}{\fontsize{10}{8}}

\else

\newcommand{\hyconsyspaperwidth}{25.4cm}
\newcommand{\hyconsyspaperheight}{19.05cm}

%% TODO: adjust
\newcommand{\hyconsysauthorblockwidth}{15cm}

% load base class and packages for 4to3
\LoadClass[t,hyperref={hidelinks,breaklinks},aspectratio=43]{beamer}
\RequirePackage[
  orientation=landscape,
  size=custom,
  width=25.4,
  height=19.05,
  scale=0.63 % erzeugt 16pt Schriftgröße
]{beamerposter}

\newcommand{\PraesentationSchriftgroesseSehrGross}{\fontsize{30}{36}}
\newcommand{\PraesentationSchriftgroesseGross}{\fontsize{22}{33}}
\newcommand{\PraesentationSchriftgroesseNormal}{\fontsize{16}{29}}
\newcommand{\PraesentationSchriftgroesseKlein}{\fontsize{12}{18}}
\newcommand{\PraesentationSchriftgroesseDreizeiler}{\fontsize{8}{10}}
\newcommand{\PraesentationSchriftgroesseAufzaehlungszeichen}{\fontsize{10}{8}}

\fi

% load HYCONSYS base packages
\RequirePackage{hyconsys-base}

% handle options 4on1 and 2on1
\RequirePackage{pgfpages}
% 2on1
\iftwopp
\pgfpagesuselayout{2 on 1}[a4paper, border shrink=5mm]
\fi
% 4on1
\iffourpp
\pgfpagesuselayout{4 on 1}[a4paper, border shrink=5mm, landscape]
\fi

% load biblatex
\usepackage[style=authoryear,firstinits=true,doi=false,isbn=false,
  url=false,backend=biber]{biblatex}

% set dimensions
\newcommand{\PraesentationSeitenrand}{8.9mm}
\newcommand{\hyconsysframemargin}{8.9mm}
\newcommand{\hyconsystopmargin}{21pt}
\newcommand{\hyconsysheadline}{25pt}
\newcommand{\hyconsysheadsep}{16pt}
\newcommand{\hyconsysfootline}{30pt}

% set beamer fonts
\setbeamerfont{frametitle}{size=\PraesentationSchriftgroesseSehrGross}
\setbeamerfont{framesubtitle}{size=\PraesentationSchriftgroesseNormal}
\setbeamerfont{author}{size=\PraesentationSchriftgroesseNormal}
\setbeamerfont{institute}{size=\PraesentationSchriftgroesseKlein}
\setbeamerfont{date}{size=\PraesentationSchriftgroesseNormal}
\setbeamerfont{footline}{size=\PraesentationSchriftgroesseKlein}
\setbeamerfont{headline}{size=\PraesentationSchriftgroesseDreizeiler}
\setbeamerfont{footnote}{size=\PraesentationSchriftgroesseKlein}
\setbeamerfont{itemize/enumerate subbody}{size=\normalsize}

% custom color themes
\newcommand{\hyconsyslogo}{hyconsys-resources/images/HyConSys_Logo_RGB.jpg}


% set colors
\newcommand{\PraesentationSchemaStandard}{
  \setbeamercolor*{background canvas}{}
  \setbeamercolor*{alerted text}{fg=HYCONSYSOrange}
  \setbeamercolor*{bibliography entry author}{fg=HYCONSYSBlau}
  \setbeamercolor*{bibliography entry note}{fg=HYCONSYSBlau}
  \setbeamercolor*{caption name}{fg=HYCONSYSBlau}
  \setbeamercolor*{headline}{fg=HYCONSYSBlau}
  \setbeamercolor*{footline}{fg=black}
  \setbeamercolor*{frametitle}{fg=black}
  \setbeamercolor*{author}{fg=HYCONSYSBlau}
  \setbeamercolor*{navigation symbols}{fg=black}
  \setbeamercolor*{normal text}{fg=black}
  \setbeamercolor*{itemize/enumerate body}{fg=black}
  \setbeamercolor*{itemize item}{fg=black}
  \setbeamercolor*{itemize subitem}{fg=black}
  \setbeamercolor*{enumerate item}{fg=HYCONSYSBlau}
  \setbeamercolor*{enumerate subitem}{fg=HYCONSYSBlau}
  \setbeamercolor*{section in toc}{fg=HYCONSYSBlau}

  \setbeamercolor*{block title}{fg=white,bg=HYCONSYSBlau}
  \setbeamercolor*{block body}{fg=HYCONSYSBlau,bg=white}
  \setbeamercolor*{block title alerted}{fg=white,bg=HYCONSYSOrange}
  \setbeamercolor*{block body alerted}{fg=HYCONSYSOrange,bg=white}
  \setbeamercolor*{block title example}{fg=white,bg=HYCONSYSGruen}
  \setbeamercolor*{block body example}{fg=HYCONSYSGruen,bg=white}
  \renewcommand{\hyconsyslogo}{hyconsys-resources/images/HyConSys_Logo_RGB.jpg}
}

\PraesentationSchemaStandard

% clear navigation symbols, use custom version later
\setbeamertemplate{navigation symbols}{}

% custom frame title
\defbeamertemplate*{frametitle}{hyconsys-default}{
  \raggedright
  \usebeamerfont{frametitle}
  \usebeamercolor[fg]{frametitle}
  \insertframetitle\par
  \ifx\insertframesubtitle\@empty
  \else{
    \usebeamerfont{framesubtitle}
    \usebeamercolor[fg]{framesubtitle}
    \insertframesubtitle\par
  }
  \fi
}

% custom headline
\defbeamertemplate*{headline}{hyconsys-dreizeiler}{
  % navigation symbols (if enabled)
  \begin{beamercolorbox}[wd=\paperwidth, right]{}
    \vbox to\hyconsystopmargin{
      \ifnavsym
      \hbox{
        \usebeamercolor[fg]{navigation symbols}
        \insertframenavigationsymbol
        \insertsubsectionnavigationsymbol
        \insertsectionnavigationsymbol
      }
      \fi
    }
  \end{beamercolorbox}
  \leavevmode
  % threeliner (if enabled) + logo
  \begin{beamercolorbox}[wd=\hyconsysframemargin, left]{}
    ~
  \end{beamercolorbox}
  \begin{beamercolorbox}[wd=0.65\textwidth, ht=\hyconsysheadline, left, dp=0pt]{}
    \ifthreeliner
    \vbox to\hyconsysheadline{
      \thegroup\par\vfill
      \thedepartment\par\vfill
      \theuniversity\par
    }
    \fi
  \end{beamercolorbox}
  \hfill
  \begin{beamercolorbox}[wd=0.25\textwidth, right]{}
    \includegraphics[width=0.05\textwidth]{\hyconsyslogo}
  \end{beamercolorbox}
  \begin{beamercolorbox}[wd=\hyconsysframemargin, left]{}
    ~
  \end{beamercolorbox}
  \vskip\hyconsysheadsep
}

% custom footline
\defbeamertemplate*{footline}{hyconsys-default}{%
  \leavevmode
  \begin{beamercolorbox}[wd=0.8\paperwidth]{}
    \hspace*{\PraesentationSeitenrand}
    \ifnum\insertpagenumber=1\strut\else\insertfootline\fi
  \end{beamercolorbox}
  \hfill
  \begin{beamercolorbox}[wd=.1\paperwidth, right]{}
    \ifnum\insertpagenumber=1\strut\else\insertframenumber{}\fi
    \hspace*{\PraesentationSeitenrand}
  \end{beamercolorbox}
  \vskip3.25mm
}

% common title page content
\newcommand{\PraesentationTitelseiteInhalt}{%
  \frametitle{\inserttitle}
  \framesubtitle{\insertsubtitle}
  \bigskip
  \begin{beamercolorbox}[wd=\hyconsysauthorblockwidth]{}
    \usebeamerfont{author}\usebeamercolor[fg]{author}
    \insertauthor\par
  \end{beamercolorbox}
  \bigskip
  \begin{beamercolorbox}[wd=\hyconsysauthorblockwidth]{}
    \usebeamerfont{institute}\usebeamercolor[fg]{institute}
    \insertinstitute\par
  \end{beamercolorbox}
  \bigskip
  \begin{beamercolorbox}[wd=\hyconsysauthorblockwidth]{}
    \usebeamerfont{date}\usebeamercolor[fg]{date}\insertdate\par
  \end{beamercolorbox}
}

% custom title page bg
\defbeamertemplate*{title page}{hyconsys-bg}{
  \PraesentationTitelseiteInhalt
  \begin{textblock*}{10.82cm}[1, 1](\paperwidth, \paperheight)
    \includegraphics{hyconsys-resources/images/HyConSys_Background.jpg}
  \end{textblock*}
}

% custom itemize
\setbeamertemplate{itemize items}[circle]
\setbeamertemplate{itemize subitem}{$-$}
\setbeamertemplate{enumerate items}{\arabic{enumi}}

\setlength{\itemsep}{0pt}
\addtolength{\itemindent}{-1ex}

% compatibility to old template versions
\newenvironment{PraesentationAufzaehlung}{\begin{itemize}}{\end{itemize}}
