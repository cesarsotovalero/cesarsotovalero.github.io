\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{yb}[21/4/2021 0.1.0 Template for my CV]
\LoadClass[12pt]{article}
\RequirePackage{xcolor}
  \definecolor{cesar-blue}{RGB}{1,38,56}
  \definecolor{cesar-green}{RGB}{0,0,139} % Define green color for links
\RequirePackage{graphicx}
\RequirePackage{svg}
\RequirePackage{microtype}
\RequirePackage{libertine}
\RequirePackage[absolute]{textpos}
  \TPGrid{16}{16}
\RequirePackage[top=2\TPVertModule, bottom=2\TPVertModule, left=3\TPHorizModule, right=2\TPHorizModule]{geometry}
\RequirePackage{tikz}
\RequirePackage{fancyhdr}
  \pagestyle{fancy}
  \renewcommand{\headrulewidth}{0pt}
  \fancyhf{}
  \fancyfoot[C]{{
    \ifnum\value{page}=1\else
      \color{gray} page \thepage{} of \pageref{LastPage}
    \fi
  }}
  \fancyfoot[C]{
    \begin{textblock}{2}(0,0){
      \tikz[x=\TPHorizModule,y=\TPVertModule] \filldraw[fill=cesar-blue, draw=none] (0,0) rectangle (2,16);
    }\end{textblock}
  }

% Customize hyperlink appearance: green links without underlining
\RequirePackage{hyperref}
\hypersetup{
    colorlinks=true,    % Enable colored links
    linkcolor=cesar-green, % Set link color to green
    urlcolor=cesar-green,  % Set URL link color to green
    citecolor=cesar-green  % Set citation color to green (optional)
}

\newcommand\nospell[1]{#1}
\AtBeginDocument{%
  \setlength{\topskip}{0mm}
  \setlength{\parindent}{0pt}
  \setlength{\parskip}{5pt}
  \tolerance=2000
  \raggedbottom
  \large
}
\newcommand\ybPrintPhoto{
  \begin{textblock}{2.4}[1,0](14,1.5){
    \includegraphics[width=\textwidth, cfbox=cesar-blue 0pt 0pt]{files/CV/cesar-Jfokus-2024-circular-small.jpg}
  }\end{textblock}
}

\renewcommand{\textbf}[1]{\textcolor{cesar-blue}{\bfseries #1}}

\endinput
