* Encoding: UTF-8.
* PART 01: PRELIMINARY *

** Folder: Frequencies **.
DATASET ACTIVATE DataSet1.
FREQUENCIES VARIABLES=sensor vital psycho cognit Zbmi Zphysical Zdrinks Zcigars sex site orthtime orthquad
  /FORMAT=NOTABLE
  /ORDER=ANALYSIS.

** Folder: Frequencies **.
MVA VARIABLES=sensor vital psycho cognit Zbmi Zphysical Zdrinks Zcigars sex site orthtime orthquad
  /MAXCAT=25
  /CATEGORICAL=sex site.

* PART 02: SENSOR *

** Folder: Graph **.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=year MEAN(sensor)[name="MEAN_sensor"] 
    MISSING=LISTWISE REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: year=col(source(s), name("year"), unit.category())
  DATA: MEAN_sensor=col(source(s), name("MEAN_sensor"))
  GUIDE: axis(dim(1), label("Year"))
  GUIDE: axis(dim(2), label("Mean Sensorial"))
  GUIDE: text.title(label("Simple Line Mean of Sensorial by Year"))
  SCALE: linear(dim(2), include(0))
  ELEMENT: line(position(year*MEAN_sensor), missing.wings())
END GPL.

** ¨Folder: Custom Tables **.
CTABLES
  /VLABELS VARIABLES=sensor year DISPLAY=LABEL
  /TABLE sensor [VALIDN F40.0, MISSING F40.0, TOTALN F40.0, MINIMUM F40.0, PTILE 25 F40.0, MEDIAN 
    F40.0, PTILE 75 F40.0, MAXIMUM F40.0, RANGE F40.0, MEAN F40.2, MODE F40.0, VARIANCE F40.2, STDDEV 
    F40.2, SEMEAN F40.2, MEAN.LCL F40.2, MEAN.UCL F40.2] BY year
  /SLABELS POSITION=ROW
  /CATEGORIES VARIABLES=year ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=AFTER
  /CRITERIA CILEVEL=95.

** Folder: Mixed Model Analysis - Model 1: null or no predictors **.
MIXED sensor WITH time quadtime
  /CRITERIA=DFMETHOD(SATTERTHWAITE) CIN(95) MXITER(100) MXSTEP(10) SCORING(1) 
    SINGULAR(0.000000000001) HCONVERGE(0, ABSOLUTE) LCONVERGE(0, ABSOLUTE) PCONVERGE(0.000001, ABSOLUTE)    
  /FIXED=| SSTYPE(3)
  /METHOD=REML
  /PRINT=G  SOLUTION TESTCOV
  /RANDOM=INTERCEPT | SUBJECT(id) COVTYPE(ID)
  /REPEATED=index | SUBJECT(id) COVTYPE(ID).

** Folder: Mixed Model Analysis - Model 2: time and quadtime as fixed effects **.
MIXED sensor WITH time quadtime
  /CRITERIA=DFMETHOD(SATTERTHWAITE) CIN(95) MXITER(100) MXSTEP(10) SCORING(1) 
    SINGULAR(0.000000000001) HCONVERGE(0, ABSOLUTE) LCONVERGE(0, ABSOLUTE) PCONVERGE(0.000001, ABSOLUTE)    
  /FIXED=time quadtime | SSTYPE(3)
  /METHOD=REML
  /PRINT=G  SOLUTION TESTCOV
  /RANDOM=INTERCEPT | SUBJECT(id) COVTYPE(ID)
  /REPEATED=index | SUBJECT(id) COVTYPE(ID).

** Folder: Mixed Model Analysis - Model 3: time as random effect **.
MIXED sensor WITH time quadtime
  /CRITERIA=DFMETHOD(SATTERTHWAITE) CIN(95) MXITER(100) MXSTEP(10) SCORING(1) 
    SINGULAR(0.000000000001) HCONVERGE(0, ABSOLUTE) LCONVERGE(0, ABSOLUTE) PCONVERGE(0.000001, ABSOLUTE)    
  /FIXED=time | SSTYPE(3)
  /METHOD=REML
  /PRINT=G  SOLUTION TESTCOV
  /RANDOM=INTERCEPT time | SUBJECT(id) COVTYPE(UN)
  /REPEATED=index | SUBJECT(id) COVTYPE(ID).

** Folder: Mixed Model Analysis - Model 4: orthtime as random **.
MIXED sensor WITH orthtime
  /CRITERIA=DFMETHOD(SATTERTHWAITE) CIN(95) MXITER(100) MXSTEP(10) SCORING(1) 
    SINGULAR(0.000000000001) HCONVERGE(0, ABSOLUTE) LCONVERGE(0, ABSOLUTE) PCONVERGE(0.000001, ABSOLUTE)    
  /FIXED=orthtime | SSTYPE(3)
  /METHOD=REML
  /PRINT=G  SOLUTION TESTCOV
  /RANDOM=INTERCEPT orthtime | SUBJECT(id) COVTYPE(UN)
  /REPEATED=index | SUBJECT(id) COVTYPE(ID).

** Folder: Mixed Model Analysis - Model 4.1: comparison model for covariance structure **.
MIXED sensor WITH orthtime
  /CRITERIA=DFMETHOD(SATTERTHWAITE) CIN(95) MXITER(100) MXSTEP(10) SCORING(1) 
    SINGULAR(0.000000000001) HCONVERGE(0, ABSOLUTE) LCONVERGE(0, ABSOLUTE) PCONVERGE(0.000001, ABSOLUTE)    
  /FIXED=orthtime | SSTYPE(3)
  /METHOD=REML
  /PRINT=G  SOLUTION TESTCOV
  /RANDOM=INTERCEPT orthtime | SUBJECT(id) COVTYPE(DIAG)
  /REPEATED=index | SUBJECT(id) COVTYPE(DIAG).

** Foler: Mixed Model Analysis - Model 4.2: comparison model for covariance structure **.
MIXED sensor WITH orthtime
  /CRITERIA=DFMETHOD(SATTERTHWAITE) CIN(95) MXITER(100) MXSTEP(10) SCORING(1) 
    SINGULAR(0.000000000001) HCONVERGE(0, ABSOLUTE) LCONVERGE(0, ABSOLUTE) PCONVERGE(0.000001, ABSOLUTE)    
  /FIXED=orthtime | SSTYPE(3)
  /METHOD=REML
  /PRINT=G  SOLUTION TESTCOV
  /RANDOM=INTERCEPT orthtime | SUBJECT(id) COVTYPE(UN)
  /REPEATED=index | SUBJECT(id) COVTYPE(DIAG).

** Folder: Mixed Model Analysis - Model 4.3: comparison model for covariance structure **.
MIXED sensor WITH orthtime
  /CRITERIA=DFMETHOD(SATTERTHWAITE) CIN(95) MXITER(100) MXSTEP(10) SCORING(1) 
    SINGULAR(0.000000000001) HCONVERGE(0, ABSOLUTE) LCONVERGE(0, ABSOLUTE) PCONVERGE(0.000001, ABSOLUTE)    
  /FIXED=orthtime | SSTYPE(3)
  /METHOD=REML
  /PRINT=G  SOLUTION TESTCOV
  /RANDOM=INTERCEPT orthtime | SUBJECT(id) COVTYPE(DIAG)
  /REPEATED=index | SUBJECT(id) COVTYPE(AR1).

** Folder: Mixed Model Analysis - Model 4.4: comparison model for covariance structure (best fit based on AIC) **.
MIXED sensor WITH orthtime
  /CRITERIA=DFMETHOD(SATTERTHWAITE) CIN(95) MXITER(100) MXSTEP(10) SCORING(1) 
    SINGULAR(0.000000000001) HCONVERGE(0, ABSOLUTE) LCONVERGE(0, ABSOLUTE) PCONVERGE(0.000001, ABSOLUTE)    
  /FIXED=orthtime | SSTYPE(3)
  /METHOD=REML
  /PRINT=G  SOLUTION TESTCOV
  /RANDOM=INTERCEPT orthtime | SUBJECT(id) COVTYPE(UN)
  /REPEATED=index | SUBJECT(id) COVTYPE(AR1).

** Folder:Mixed Model Analysis - Model 5: full model including standardized predictors **.
MIXED sensor BY sex site WITH orthtime Zbmi Zphysical Zdrinks Zcigars
  /CRITERIA=DFMETHOD(SATTERTHWAITE) CIN(95) MXITER(100) MXSTEP(10) SCORING(1) 
    SINGULAR(0.000000000001) HCONVERGE(0, ABSOLUTE) LCONVERGE(0, ABSOLUTE) PCONVERGE(0.000001, ABSOLUTE)    
  /FIXED=sex site orthtime Zbmi Zphysical Zdrinks Zcigars sex*orthtime site*orthtime | SSTYPE(3)
  /METHOD=REML
  /PRINT=G  SOLUTION TESTCOV
  /RANDOM=INTERCEPT orthtime | SUBJECT(id) COVTYPE(UN)
  /REPEATED=index | SUBJECT(id) COVTYPE(AR1)
  /SAVE=FIXPRED PRED SEPRED RESID
  /EMMEANS=TABLES(sex) COMPARE ADJ(BONFERRONI)
  /EMMEANS=TABLES(site) COMPARE ADJ(BONFERRONI).

** Folder: Graph **.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=year MEAN(sensor)[name="MEAN_sensor"] sex 
    MISSING=LISTWISE REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE
  /FRAME OUTER=NO INNER=NO
  /GRIDLINES XAXIS=NO YAXIS=YES
  /STYLE GRADIENT=NO.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: year=col(source(s), name("year"), unit.category())
  DATA: MEAN_sensor=col(source(s), name("MEAN_sensor"))
  DATA: sex=col(source(s), name("sex"), unit.category())
  GUIDE: axis(dim(1), label("Year"))
  GUIDE: axis(dim(2), label("Mean Sensorial"))
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("Sex"))
  GUIDE: text.title(label("Multiple Line Mean of Sensorial by Year by Sex"))
  SCALE: linear(dim(2), include(0))
  SCALE: cat(aesthetic(aesthetic.color.interior), include(
"1", "2"))
  ELEMENT: line(position(year*MEAN_sensor), color.interior(sex), missing.wings())
END GPL.

** Folder: Graph **.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=year MEAN(sensor)[name="MEAN_sensor"] site 
    MISSING=LISTWISE REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE
  /FRAME OUTER=NO INNER=NO
  /GRIDLINES XAXIS=NO YAXIS=YES
  /STYLE GRADIENT=NO.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: year=col(source(s), name("year"), unit.category())
  DATA: MEAN_sensor=col(source(s), name("MEAN_sensor"))
  DATA: site=col(source(s), name("site"), unit.category())
  GUIDE: axis(dim(1), label("Year"))
  GUIDE: axis(dim(2), label("Mean Sensorial"))
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("Site"))
  GUIDE: text.title(label("Multiple Line Mean of Sensorial by Year by Site"))
  SCALE: linear(dim(2), include(0))
  SCALE: cat(aesthetic(aesthetic.color.interior), include(
"1", "5"))
  ELEMENT: line(position(year*MEAN_sensor), color.interior(site), missing.wings())
END GPL.

** Folder: Explore **.
EXAMINE VARIABLES=RESID_1
  /PLOT BOXPLOT HISTOGRAM NPPLOT
  /COMPARE GROUPS
  /STATISTICS DESCRIPTIVES
  /CINTERVAL 95
  /MISSING LISTWISE
  /NOTOTAL.

** Folder: Graph **.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=FXPRED_5 RESID_5 MISSING=LISTWISE REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE
  /FITLINE TOTAL=NO SUBGROUP=NO
  /FRAME OUTER=NO INNER=NO
  /GRIDLINES XAXIS=NO YAXIS=YES
  /STYLE GRADIENT=NO.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: FXPRED_5=col(source(s), name("FXPRED_5"))
  DATA: RESID_5=col(source(s), name("RESID_5"))
  GUIDE: axis(dim(1), label("Fixed Predicted Values"))
  GUIDE: axis(dim(2), label("Residuals"))
  GUIDE: text.title(label("Scatter Plot of Residuals by Fixed Predicted Values"))
  ELEMENT: point(position(FXPRED_5*RESID_5))
END GPL.
