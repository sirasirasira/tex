% -------------------------------------------------
% jmaster.cls
% -------------------------------------------------
% 1999/02/18 Ver.1.00 : とりあえず完成
% -------------------------------------------------
% 作成者: K.Honda
% -------------------------------------------------
% 使用方法
%
% jmaster.clsをTeXInputsに置いて、
% クラス指定を以下のようにして下さい。
%
%	\documentclass[12pt]{jmaster}
%
%
% -------------------------------------------------
\ProvidesClass{jsotsuron}[2006/02/01]	%% class name: jmaster
\LoadClassWithOptions{jreport}		%% jreportをベースにする。

% -------------------------------------------------
%  double space setting
% -------------------------------------------------
\def\baselinestretch{1.5}

% -------------------------------------------------
%  title page setting
% -------------------------------------------------
\renewcommand\maketitle{\begin{titlepage}%
  \let\footnotesize\small
  \let\footnoterule\relax
  \let \footnote \thanks
  \null\vfil
  \vskip 2cm
  \begin{center}%
    {\Large \bf \@title \par}%
    \vskip 4.5cm%
    {\Large \bf \@author \par}%
    \vskip 6cm%
    {\Large \bf \@date \par}%
    \vskip 1cm%
  {\Large \bf 北海道大学工学部情報エレクトロニクス学科 \\
  コンピュータサイエンスコース \par
     }%
  %  {\Large \bf 九州大学理学部物理学科 \par
  % 		情報理学コース \par}%
  %  {\Large \bf 九州大学大学院システム情報科学研究科 \par
  %		情報理学専攻　修士課程 \par}%
  \end{center}\par
  \end{titlepage}%
  \setcounter{page}{0}
  \setcounter{footnote}{0}%
  \let\thanks\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@title\@empty
  \global\let\maketitle\relax
}

% -------------------------------------------------
%  abstract page setting
% -------------------------------------------------
\def\abstract{\titlepage
  \setcounter{page}{0}
  \null\vfil
  \hfil{\large\bf \abstractname\par} %% added by arim on 01FEB06
  \medskip
  \noindent 
}
\def\endabstract{\par\vfil\null\endtitlepage}

% -------------------------------------------------
%  pagestyle setting
% -------------------------------------------------
\topmargin -0.35in
\textwidth 6.25in
\textheight 9.6in
\oddsidemargin 0.14in
\evensidemargin -0.22in
\pagestyle{myheadings}

% -------------------------------------------------
%  bibliography heading setting
% -------------------------------------------------
\def\thebibliography#1{%
  \chapter*{\refname\@mkboth{\refname}{\refname}}%
  \list{[\arabic{enumi}]}{%
    \settowidth\labelwidth{[#1]}%
    \leftmargin\labelwidth%
    \advance\leftmargin\labelsep%
    \usecounter{enumi}%
  }%
  \addcontentsline{toc}{chapter}{\refname}%
  \def\newblock{\hskip .11em plus .33em minus .07em}%
  \sloppy\clubpenalty4000\widowpenalty4000%
  \sfcode`\.=1000\relax%
}

% -------------------------------------------------
%  no numbers set on section/subsection/subsubsection
% -------------------------------------------------
\renewcommand{\thepart		}{\Roman{part}}
\renewcommand{\thechapter	}{\arabic{chapter}}
\renewcommand{\thesection	}{\thechapter.\arabic{section}}
\renewcommand{\thesubsection	}{\thesection.\arabic{subsection}}
\renewcommand{\thesubsubsection	}{\thesubsection.\arabic{subsubsection}}
\renewcommand{\theparagraph	}{\thesubsubsection.\arabic{paragraph}}
\renewcommand{\thesubparagraph	}{\theparagraph.\arabic{subparagraph}}

\renewcommand{\chapter}{%	章の開始ページのスタイル変更
  \clearpage%
  \thispagestyle{myheadings}%
  \global\@topnum\z@%
  \@afterindentfalse%
  \secdef\@chapter\@schapter%
}
\renewcommand{\@makechapterhead}[1]{%	見出しの変更(\chapter)
  \vspace*{30pt}{%
    \parindent 0pt \raggedright%
    \ifnum%
      \c@secnumdepth >\m@ne \LARGE\bf \@chapapp{\thechapter}章 \par%
      \vskip 20pt%
    \fi%
    \LARGE\bf #1\par%
    \nobreak \vskip 40pt%
  }%
}
\renewcommand{\@makeschapterhead}[1]{%	見出しの変更(\chapter*)
  \vspace*{20pt}{%
    \parindent 0pt \raggedright%
    \LARGE \bf #1\par%
    \nobreak \vskip 40pt%
  }%
}
\renewcommand{\section}{%	見出しの変更
  \@startsection{section}{1}{\z@}%
  {3.5ex plus 1ex minus .2ex}%	前の空き
  {2.3ex plus .2ex}%		後ろの空き
  {\large\bf}%			書式
}
\renewcommand{\subsection}{%
  \@startsection{subsection}{2}{\z@}%
  {3.25ex plus 1ex minus .2ex}%
  {1.5ex plus .2ex}%
  {\normalsize\bf}%
}
\renewcommand{\subsubsection}{%
  \@startsection{subsubsection}{3}{\z@}%
  {3.25ex plus 1ex minus .2ex}%
  {1.5ex plus .2ex}%
  {\normalsize\bf}%
}

% -------------------------------------------------
%  索引ページの指定
% -------------------------------------------------
\renewenvironment{theindex}
  {\if@twocolumn\@restonecolfalse\else\@restonecoltrue\fi
   \columnseprule\z@ \columnsep 35\p@
   \twocolumn[\@makeschapterhead{\indexname}]%
   \@mkboth{\indexname}{\indexname}%
%% \thispagestyle{jpl@in}\parindent\z@	%%	<- jreport.cls
   \thispagestyle{myheadings}\parindent\z@%	<- 変更
   \parskip\z@ \@plus .3\p@\relax
   \let\item\@idxitem}
  {\if@restonecol\onecolumn\else\clearpage\fi}

% -------------------------------------------------
%  
% -------------------------------------------------
\def\abstractname{要 旨}
\def\tablename{表 }
\def\figurename{図 }
\def\indexname{索引}
\def\refname{参考文献} 
\def\listtablename{表一覧}
\def\listfigurename{図一覧}
\def\contentsname{目次}
%\def\@chapapp#1{第 \lower0.1ex\hbox{#1} 章}
%\def\@partapp#1{第 #1 部}

% ----------------------------------------------- end of jmaster.cls

