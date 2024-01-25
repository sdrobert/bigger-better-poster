% utposter.cls
% Written by Sean Robertson, 2024
% Apache 2.0
% sdrobert@cs.toronto.edu
% =================================================================

% bookkeeping
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{utposter}[2024/01/31 ver 0.2 uoft styling with tikzposter]
\RequirePackage{kvoptions}
\RequirePackage{ifthen}
\RequirePackage[export]{adjustbox}
\RequirePackage{iftex}
\RequirePackage{epstopdf}
\RequirePackage{tikz}
\usetikzlibrary{decorations.shapes}
% depending on the engine, the font and formatting we use is different
\ifPDFTeX
  \RequirePackage[T1]{fontenc}
  \RequirePackage{avant}
  \newenvironment{uttitlefont}{\fontfamily{pag}\selectfont}{\par}
  \RequirePackage{fbb} % body
\else
  \ClassError{utposter}{Have yet to deal with luatex or xetex}
\fi

\SetupKeyvalOptions{
  family=ut,
  prefix=ut@,
}

% Option handling
\DeclareStringOption[]{logo}  % if set, appears right of the title
\DeclareStringOption[]{logotwo}  % if set, appears right of 'logo'
\DeclareStringOption[]{leftlogo}  % if set, appears left of the title
\DeclareStringOption[]{leftlogotwo}  % if set, appears right of 'leftlogo'
\DeclareStringOption[]{email}
\DeclareStringOption[bow]{style}
\DeclareBoolOption{gradient}

\DeclareDefaultOption{
  \ifx\CurrentOptionValue\relax
    \expandafter\PassOptionsToClass
    \expandafter{\CurrentOption}{tikzposter}%
  \else
    \@unknownoptionerror
  \fi
}
\ProcessKeyvalOptions*

\ifthenelse{\NOT \equal{\ut@logo}{}}{
  \IfFileExists{\ut@logo}{}{
    \ClassError{utposter}{``\ut@logo'' is not a file}{}
  }
}{}
\ifthenelse{\NOT \equal{\ut@logotwo}{}}{
  \IfFileExists{\ut@logotwo}{}{
    \ClassError{utposter}{``\ut@logotwo'' is not a file}{}
  }
}{}
\ifthenelse{\NOT \equal{\ut@leftlogo}{}}{
  \IfFileExists{\ut@leftlogo}{}{
    \ClassError{utposter}{``\ut@leftlogo'' is not a file}{}
  }
}{}
\ifthenelse{\NOT \equal{\ut@leftlogotwo}{}}{
  \IfFileExists{\ut@leftlogotwo}{}{
    \ClassError{utposter}{``\ut@leftlogotwo'' is not a file}{}
  }
}{}


\LoadClass{tikzposter}
% ================================================================

% email is more naturally set by command
\newcommand{\email}[1]{\setkeys{ut}{email=\texttt{#1}}}

% UofT header command. I don't force this because I think Bembo-like fonts
% look pretty good as titles. However, if you want to use this to conform with
% the UofT visual identity, go ahead.
\newcommand{\uoftheader}[1]{
  \vbox to .9em{
    \begin{uttitlefont}
    \scalebox{0.95}[1.0]{\parbox[t]{\linewidth}{\centering #1}}
    \end{uttitlefont}
  }
}

% Colour Palette! Only one of these
% see http://universityrelations.utoronto.ca/sc/u-of-t-branding/
% Last checked Aug 31 2016
\definecolorpalette{UofTColors} {
  \definecolor{Primary}{RGB}{0,42,92}
  \definecolor{SecondaryOne}{RGB}{255,228,152}
  \definecolor{SecondaryTwo}{RGB}{227,24,55}
  \definecolor{SecondaryThree}{RGB}{0,139,176}
  \definecolor{SecondaryFour}{RGB}{39,17,0}
  \definecolor{AccentOne}{RGB}{123,164,217}
  \definecolor{AccentTwo}{RGB}{206,207,203}
  \definecolor{AccentThree}{RGB}{234,202,205}
  \definecolor{AccentFour}{RGB}{218,229,205}
  % DCS uses slightly different header colors.
  \definecolor{DCSHeaders}{HTML}{0099CF}
  % the U of T website uses slightly off black text. I like it
  \definecolor{UofTText}{HTML}{485667}
}

\definecolorstyle{UofTBlueOnWhite} {
  % default palette. Literally copied from above. FIXME?
  \definecolor{Primary}{RGB}{0,42,92}
  \definecolor{SecondaryOne}{RGB}{255,228,152}
  \definecolor{SecondaryTwo}{RGB}{227,24,55}
  \definecolor{SecondaryThree}{RGB}{0,139,176}
  \definecolor{SecondaryFour}{RGB}{39,17,0}
  \definecolor{AccentOne}{RGB}{123,164,217}
  \definecolor{AccentTwo}{RGB}{206,207,203}
  \definecolor{AccentThree}{RGB}{234,202,205}
  \definecolor{AccentFour}{RGB}{218,229,205}
  \definecolor{DCSHeaders}{HTML}{0099CF}
  \definecolor{UofTText}{HTML}{485667}
} {
  % Background
  \colorlet{backgroundcolor}{white}
  \colorlet{framecolor}{Primary}
  % Title
  \colorlet{titlefgcolor}{Primary}
  \colorlet{titlebgcolor}{white}
  % Block
  \colorlet{blocktitlefgcolor}{white}
  \colorlet{blocktitlebgcolor}{SecondaryThree}
  \colorlet{blockbodyfgcolor}{black}
  \colorlet{blockbodybgcolor}{white}
  % Inner Block... dunno if this should be used
  \colorlet{innerblocktitlefgcolor}{black}
  \colorlet{innerblocktitlebgcolor}{AccentOne}
  \colorlet{innerblockfgcolor}{UofTText}
  \colorlet{innerblockbgcolor}{white}
  % Notes. Again, kinda ugly.
  \colorlet{notefgcolor}{black}
  \colorlet{notebgcolor}{white}
  \colorlet{noteframecolor}{Primary}
  % My special use color for gradients
  \colorlet{gradcolor}{AccentThree}
}

\definecolorstyle{UofTWhiteOnBlue} {
  % default palette. Literally copied from above. FIXME?
  \definecolor{Primary}{RGB}{0,42,92}
  \definecolor{SecondaryOne}{RGB}{255,228,152}
  \definecolor{SecondaryTwo}{RGB}{227,24,55}
  \definecolor{SecondaryThree}{RGB}{0,139,176}
  \definecolor{SecondaryFour}{RGB}{39,17,0}
  \definecolor{AccentOne}{RGB}{123,164,217}
  \definecolor{AccentTwo}{RGB}{206,207,203}
  \definecolor{AccentThree}{RGB}{234,202,205}
  \definecolor{AccentFour}{RGB}{218,229,205}
  \definecolor{DCSHeaders}{HTML}{0099CF}
  \definecolor{UofTText}{HTML}{485667}
} {
  % Background
  \colorlet{backgroundcolor}{white}
  \colorlet{framecolor}{white}
  % Title
  \colorlet{titlefgcolor}{white}
  \colorlet{titlebgcolor}{Primary}
  % Block
  \colorlet{blocktitlefgcolor}{white}
  \colorlet{blocktitlebgcolor}{Primary}
  \colorlet{blockbodyfgcolor}{UofTText}
  \colorlet{blockbodybgcolor}{white}
  % Inner Block
  \colorlet{innerblocktitlefgcolor}{black}
  \colorlet{innerblocktitlebgcolor}{AccentOne}
  \colorlet{innerblockfgcolor}{UofTText}
  \colorlet{innerblockbgcolor}{Primary}
  % Notes. Again, kinda ugly.
  \colorlet{notefgcolor}{UofTText}
  \colorlet{notebgcolor}{white}
  \colorlet{noteframecolor}{Primary}
  % My special use color for gradients
  \colorlet{gradcolor}{white}
}

\settitle{
  \centering
  \vbox{
    \centering
    \vspace{1em}
    \color{titlefgcolor}{
      {\huge \centering \sc \@title \par}
      \vspace*{1em} {\Large \@author \par}
      \ifthenelse{\NOT \equal{\@institute}{}}{
        \vspace*{.5em} {\normalsize \@institute \par}
      }{}
      \ifthenelse{\NOT \equal{\ut@email}{}}{
        \vspace*{.5em} {\normalsize \ut@email \par}
      }{}
    }
    \vspace*{1em}
  }
}

\tikzset{decorate sep/.style 2 args=
{decorate,decoration={shape backgrounds,shape=circle,shape size=#1,shape sep=#2}}}

\definetitlestyle{UofTSolidGradient}{
  width=400mm, roundedcorners=0, linewidth=2pt, innersep=5pt,
  titletotopverticalspace=0mm, titletoblockverticalspace=15mm
}{
  \begin{scope}[shift={(-.5\textwidth, 0)}, line width=\titlelinewidth, rounded corners=\titleroundedcorners]
    \shade[draw=none, bottom color=titlebgcolor, top color=titlebgcolor!80!gradcolor]
      (0,\titleposbottom) rectangle (\textwidth,\titlepostop+\titletotopverticalspace);
    \node[inner sep=0pt, anchor=east] at (\textwidth-.25\titleheight,\titleposbottom+.5\titleheight) {
      \ifthenelse{\NOT \equal{\ut@logo}{}}{
        \includegraphics[width=.43\textwidth-\titleposright, max height=.5\titleheight]{\ut@logo}
        \ifthenelse{\NOT \equal{\ut@logotwo}{}}{
          \hspace*{.5em}
          \vrule
          \hspace*{.5em}
          \includegraphics[width=.43\textwidth-\titleposright, max height=.5\titleheight]{\ut@logotwo}
        }{}
      }{}
    };
    \node[inner sep=0pt, anchor=west] at (.25\titleheight,\titleposbottom+.5\titleheight) {
      \ifthenelse{\NOT \equal{\ut@leftlogo}{}}{
        \includegraphics[width=.43\textwidth-\titleposright, max height=.5\titleheight]{\ut@leftlogo}
        \ifthenelse{\NOT \equal{\ut@leftlogotwo}{}}{
          \hspace*{.5em}
          \vrule
          \hspace*{.5em}
          \includegraphics[width=.43\textwidth-\titleposright, max height=.5\titleheight]{\ut@leftlogotwo}
        }{}
      }{}
    };
  \end{scope}
}

\definetitlestyle{UofTSolid}{
  width=400mm, roundedcorners=0, linewidth=2pt, innersep=5pt,
  titletotopverticalspace=0mm, titletoblockverticalspace=15mm
}{
  \begin{scope}[shift={(-.5\textwidth, 0)}, line width=\titlelinewidth, rounded corners=\titleroundedcorners]
    \draw[draw=none, fill=titlebgcolor]
      (0,\titleposbottom) rectangle (\textwidth,\titlepostop+\titletotopverticalspace);
    \node[inner sep=0pt, anchor=east] at (\textwidth-.25\titleheight,\titleposbottom+.5\titleheight) {
      \ifthenelse{\NOT \equal{\ut@logo}{}}{
        \includegraphics[width=.43\textwidth-\titleposright, max height=.5\titleheight]{\ut@logo}
        \ifthenelse{\NOT \equal{\ut@logotwo}{}}{
          \hspace*{.5em}
          \vrule
          \hspace*{.5em}
          \includegraphics[width=.43\textwidth-\titleposright, max height=.5\titleheight]{\ut@logotwo}
        }{}
      }{}
    };
    \node[inner sep=0pt, anchor=west] at (.25\titleheight,\titleposbottom+.5\titleheight) {
      \ifthenelse{\NOT \equal{\ut@leftlogo}{}}{
        \includegraphics[width=.43\textwidth-\titleposright, max height=.5\titleheight]{\ut@leftlogo}
        \ifthenelse{\NOT \equal{\ut@leftlogotwo}{}}{
          \hspace*{.5em}
          \vrule
          \hspace*{.5em}
          \includegraphics[width=.43\textwidth-\titleposright, max height=.5\titleheight]{\ut@leftlogotwo}
        }{}
      }{}
    };
  \end{scope}
}


\definetitlestyle{UofTDotted}{
  width=400mm, roundedcorners=0, linewidth=5pt, innersep=5pt,
  titletotopverticalspace=0mm, titletoblockverticalspace=15mm
}{
  \begin{scope}[shift={(-.5\textwidth, 0)}, line width=\titlelinewidth, rounded corners=\titleroundedcorners]
    \draw[decorate sep={\titlelinewidth}{4\titlelinewidth},color=titlefgcolor,fill=titlefgcolor]
      (0,\titleposbottom) -- (\textwidth,\titleposbottom);
    \node[inner sep=0pt, anchor=east] at (\textwidth-.25\titleheight,\titleposbottom+.5\titleheight) {
      \ifthenelse{\NOT \equal{\ut@logo}{}}{
        \includegraphics[width=.43\textwidth-\titleposright, max height=.5\titleheight]{\ut@logo}
        \ifthenelse{\NOT \equal{\ut@logotwo}{}}{
          \hspace*{.5em}
          \vrule
          \hspace*{.5em}
          \includegraphics[width=.43\textwidth-\titleposright, max height=.5\titleheight]{\ut@logotwo}
        }{}
      }{}
    };
    \node[inner sep=0pt, anchor=west] at (.25\titleheight,\titleposbottom+.5\titleheight) {
      \ifthenelse{\NOT \equal{\ut@leftlogo}{}}{
        \includegraphics[width=.43\textwidth-\titleposright, max height=.5\titleheight]{\ut@leftlogo}
        \ifthenelse{\NOT \equal{\ut@leftlogotwo}{}}{
          \hspace*{.5em}
          \vrule
          \hspace*{.5em}
          \includegraphics[width=.43\textwidth-\titleposright, max height=.5\titleheight]{\ut@leftlogotwo}
        }{}
      }{}
    };
  \end{scope}
}

\defineblockstyle{UofTBlockStyle}{
  titlewidthscale=1, bodywidthscale=1, titlecenter,
  titleoffsetx=0pt, titleoffsety=0pt, bodyoffsetx=0mm, bodyoffsety=0mm,
  bodyverticalshift=0mm, roundedcorners=0, linewidth=5pt,
  titleinnersep=6mm, bodyinnersep=1cm
}{
  \draw[draw=none, fill=blockbodybgcolor, rounded corners=\blockroundedcorners]
    (blockbody.south west) rectangle (blockbody.north east);
  \ifBlockHasTitle
    \draw[draw=none, fill=blocktitlebgcolor, rounded corners=\blockroundedcorners]
      (blocktitle.south west) rectangle (blocktitle.north east);
  \else
    % simple dotted line delineating the start
    \draw[decorate sep={\blocklinewidth}{4\blocklinewidth},color=blocktitlebgcolor,fill=blocktitlebgcolor]
      ($(blockbody.north west) - (.25\blocklinewidth,.5\blocklinewidth)$) -- ($(blockbody.north east) - (-.25\blocklinewidth,.5\blocklinewidth)$);
  \fi
  \draw[decorate sep={\blocklinewidth}{4\blocklinewidth},color=blocktitlebgcolor,fill=blocktitlebgcolor]
      ($(blockbody.south west) + (-.25\blocklinewidth,.5\blocklinewidth)$) -- ($(blockbody.south east) + (.25\blocklinewidth,.5\blocklinewidth)$);
}

\defineblockstyle{UofTBlockStyleGradient}{
  titlewidthscale=1, bodywidthscale=1, titlecenter,
  titleoffsetx=0pt, titleoffsety=0pt, bodyoffsetx=0mm, bodyoffsety=0mm,
  bodyverticalshift=0mm, roundedcorners=0, linewidth=5pt,
  titleinnersep=6mm, bodyinnersep=1cm
}{
  \draw[draw=none, fill=blockbodybgcolor, rounded corners=\blockroundedcorners]
    (blockbody.south west) rectangle (blockbody.north east);
  \ifBlockHasTitle
    \shade[draw=none, bottom color=blocktitlebgcolor, top color=blocktitlebgcolor!70!gradcolor, rounded corners=\blockroundedcorners]
      (blocktitle.south west) rectangle (blocktitle.north east);
  \else
    % simple dotted line delineating the start. I think this is superfluous, however, since it's unlikely a column will
    % begin without a header unless there's a row above it.
    % \draw[decorate sep={\blocklinewidth}{4\blocklinewidth},color=blocktitlebgcolor,fill=blocktitlebgcolor]
    %   ($(blockbody.north west) - (.25\blocklinewidth,.5\blocklinewidth)$) -- ($(blockbody.north east) - (-.25\blocklinewidth,.5\blocklinewidth)$);
  \fi
  \draw[decorate sep={\blocklinewidth}{4\blocklinewidth},color=blocktitlebgcolor,fill=blocktitlebgcolor]
      ($(blockbody.south west) + (-.25\blocklinewidth,.5\blocklinewidth)$) -- ($(blockbody.south east) + (.25\blocklinewidth,.5\blocklinewidth)$);
}

\definenotestyle{Empty}{
  targetoffsetx=0pt, targetoffsety=0pt, angle=45, radius=8cm,
  width=6cm, connection=true, rotate=0, roundedcorners=0, linewidth=1pt,
  innersep=0pt%
}{}
\defineblockstyle{Empty}{
  titlewidthscale=1, bodywidthscale=1, titlecenter,
  titleoffsetx=0pt, titleoffsety=0pt, bodyoffsetx=0mm, bodyoffsety=0mm,
  bodyverticalshift=0mm, roundedcorners=0, linewidth=5pt,
  titleinnersep=0mm, bodyinnersep=0mm
}{}


\ifthenelse{\equal{\ut@style}{bow}}{
  \usecolorstyle{UofTBlueOnWhite}
  \usetitlestyle{UofTDotted}
}{
  \usecolorstyle{UofTWhiteOnBlue}
  \ifut@gradient
    \usetitlestyle{UofTSolidGradient}
  \else
    \usetitlestyle{UofTSolid}
  \fi
}
\ifut@gradient
  \useblockstyle{UofTBlockStyleGradient}
\else
  \useblockstyle{UofTBlockStyle}
\fi
\useinnerblockstyle{Minimal}

% =========================================================================
\endinput