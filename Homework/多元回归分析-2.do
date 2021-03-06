**第七章 第13题
use "D:\STATApractice\APPLE.DTA"
**1.
 gen ecobuy=ecolbs if ecolbs==0	 //先把0值生成（会有一定的缺失值）

 recode ecobuy(.=1)  //	再把缺失值全都编码为1
 
  tab ecobuy
/*
     ecobuy |      Freq.     Percent        Cum.
------------+-----------------------------------
          0 |        248       37.58       37.58
          1 |        412       62.42      100.00
------------+-----------------------------------
      Total |        660      100.00

有62.42%的家庭声称要买环保苹果。*/

**2
reg ecobuy ecoprc regprc faminc hhsize educ age
/*
      Source |       SS           df       MS      Number of obs   =       660
-------------+----------------------------------   F(6, 653)       =     13.43
       Model |  17.0019785         6  2.83366308   Prob > F        =    0.0000
    Residual |  137.810143       653  .211041566   R-squared       =    0.1098
-------------+----------------------------------   Adj R-squared   =    0.1016
       Total |  154.812121       659  .234919759   Root MSE        =    .45939

------------------------------------------------------------------------------
      ecobuy |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
      ecoprc |  -.8026219   .1094037    -7.34   0.000    -1.017447   -.5877963
      regprc |   .7192675    .131639     5.46   0.000     .4607808    .9777543
      faminc |   .0005518   .0005295     1.04   0.298     -.000488    .0015916
      hhsize |   .0238227   .0125262     1.90   0.058    -.0007739    .0484193
        educ |   .0247849   .0083743     2.96   0.003      .008341    .0412287
         age |  -.0005008   .0012499    -0.40   0.689    -.0029551    .0019536
       _cons |   .4236865   .1649674     2.57   0.010      .099756     .747617
------------------------------------------------------------------------------
*/

**3
test faminc=hhsize=educ=age=0
/*
 ( 1)  faminc - hhsize = 0
 ( 2)  faminc - educ = 0
 ( 3)  faminc - age = 0
 ( 4)  faminc = 0

       F(  4,   653) =    4.43
            Prob > F =    0.0015
*/

**4
 gen lfaminc=log(faminc)

 reg ecobuy ecoprc regprc lfaminc hhsize educ age
/*
      Source |       SS           df       MS      Number of obs   =       660
-------------+----------------------------------   F(6, 653)       =     13.67
       Model |   17.278689         6   2.8797815   Prob > F        =    0.0000
    Residual |  137.533432       653  .210617813   R-squared       =    0.1116
-------------+----------------------------------   Adj R-squared   =    0.1034
       Total |  154.812121       659  .234919759   Root MSE        =    .45893

------------------------------------------------------------------------------
      ecobuy |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
      ecoprc |  -.8006664   .1092981    -7.33   0.000    -1.015285   -.5860482
      regprc |    .721377   .1315196     5.48   0.000     .4631247    .9796294
     lfaminc |   .0445162   .0287239     1.55   0.122    -.0118861    .1009185
      hhsize |   .0227002    .012543     1.81   0.071    -.0019294    .0473297
        educ |    .023093   .0084508     2.73   0.006      .006499     .039687
         age |  -.0003865   .0012517    -0.31   0.758    -.0028444    .0020713
       _cons |   .3037519   .1789605     1.70   0.090    -.0476555    .6551593
------------------------------------------------------------------------------
*/

**5
 predict ecobuyhat

 sum ecobuyhat
/*
    Variable |        Obs        Mean    Std. Dev.       Min        Max
-------------+---------------------------------------------------------
   ecobuyhat |        660    .6242424    .1619245   .1854181   1.050653
*/

**6
 count if ecobuyhat<0.5 & ecobuy==0
 **102
 
  count if ecobuyhat>0.5 & ecobuy==1
  **340
  
**第八章 第十四题
 use "D:\STATApractice\beauty.dta", clear
**1
reg lwage belavg abvavg female educ exper expersq,robust
/*
Linear regression                               Number of obs     =      1,260
                                                F(6, 1253)        =     120.99
                                                Prob > F          =     0.0000
                                                R-squared         =     0.3598
                                                Root MSE          =     .47683

------------------------------------------------------------------------------
             |               Robust
       lwage |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
      belavg |  -.1542032   .0410068    -3.76   0.000    -.2346528   -.0737536
      abvavg |  -.0066465   .0312705    -0.21   0.832    -.0679948    .0547018
      female |  -.4532832   .0292106   -15.52   0.000    -.5105904   -.3959761
        educ |   .0663221   .0055299    11.99   0.000     .0554732     .077171
       exper |   .0408305   .0042387     9.63   0.000     .0325147    .0491463
     expersq |  -.0006301   .0000946    -6.66   0.000    -.0008156   -.0004445
       _cons |    .558981   .0814393     6.86   0.000     .3992086    .7187534
------------------------------------------------------------------------------
*/

**2.
gen fbelavg=female* belavg
gen fabvavg=female*abvavg
gen feduc=female*educ
gen fexper=female*exper
gen fexpersq=female*expersq
**通常的F检验
 reg lwage belavg abvavg female educ exper expersq fbelavg fabvavg feduc fexper fexpersq
/*
      Source |       SS           df       MS      Number of obs   =     1,260
-------------+----------------------------------   F(11, 1248)     =     66.19
       Model |  163.957194        11  14.9051994   Prob > F        =    0.0000
    Residual |  281.022779     1,248  .225178508   R-squared       =    0.3685
-------------+----------------------------------   Adj R-squared   =    0.3629
       Total |  444.979972     1,259  .353439215   Root MSE        =    .47453

------------------------------------------------------------------------------
       lwage |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
      belavg |  -.1693568   .0531369    -3.19   0.001    -.2736043   -.0651094
      abvavg |  -.0390703   .0380466    -1.03   0.305    -.1137126    .0355721
      female |    -.49681   .1610739    -3.08   0.002    -.8128156   -.1808044
        educ |   .0609789   .0064705     9.42   0.000     .0482846    .0736731
       exper |   .0504833   .0055818     9.04   0.000     .0395325     .061434
     expersq |  -.0008023    .000121    -6.63   0.000    -.0010395    -.000565
     fbelavg |   .0436467   .0875103     0.50   0.618    -.1280369    .2153302
     fabvavg |   .0824055   .0637923     1.29   0.197    -.0427466    .2075575
       feduc |   .0176664   .0112268     1.57   0.116    -.0043591    .0396919
      fexper |   -.020652   .0092816    -2.23   0.026    -.0388613   -.0024427
    fexpersq |    .000318   .0002185     1.45   0.146    -.0001108    .0007467
       _cons |   .5375405   .0985018     5.46   0.000     .3442931    .7307878
------------------------------------------------------------------------------
*/
test fbelavg = fabvavg = feduc = fexper = fexpersq =0
/*
 ( 1)  fbelavg - fabvavg = 0
 ( 2)  fbelavg - feduc = 0
 ( 3)  fbelavg - fexper = 0
 ( 4)  fbelavg - fexpersq = 0
 ( 5)  fbelavg = 0

       F(  5,  1248) =    3.43
            Prob > F =    0.0044
*/

**稳健-异方差的F检验
 reg lwage belavg abvavg female educ exper expersq fbelavg fabvavg feduc fexper fexpersq ,robust
/*
Linear regression                               Number of obs     =      1,260
                                                F(11, 1248)       =      69.05
                                                Prob > F          =     0.0000
                                                R-squared         =     0.3685
                                                Root MSE          =     .47453

------------------------------------------------------------------------------
             |               Robust
       lwage |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
      belavg |  -.1693568   .0529687    -3.20   0.001    -.2732744   -.0654392
      abvavg |  -.0390703   .0391032    -1.00   0.318    -.1157855    .0376449
      female |    -.49681   .1586357    -3.13   0.002    -.8080321   -.1855879
        educ |   .0609789   .0070913     8.60   0.000     .0470666    .0748911
       exper |   .0504833   .0054175     9.32   0.000     .0398548    .0611117
     expersq |  -.0008023   .0001148    -6.99   0.000    -.0010274   -.0005771
     fbelavg |   .0436467   .0831824     0.52   0.600     -.119546    .2068394
     fabvavg |   .0824055   .0647921     1.27   0.204    -.0447079    .2095189
       feduc |   .0176664   .0111196     1.59   0.112    -.0041488    .0394816
      fexper |   -.020652   .0090353    -2.29   0.022    -.0383781   -.0029258
    fexpersq |    .000318   .0002261     1.41   0.160    -.0001256    .0007616
       _cons |   .5375405   .1042491     5.16   0.000     .3330176    .7420633
------------------------------------------------------------------------------
*/
 test fbelavg = fabvavg = feduc = fexper = fexpersq =0
/*
 ( 1)  fbelavg - fabvavg = 0
 ( 2)  fbelavg - feduc = 0
 ( 3)  fbelavg - fexper = 0
 ( 4)  fbelavg - fexpersq = 0
 ( 5)  fbelavg = 0

       F(  5,  1248) =    3.83
            Prob > F =    0.0019
*/

**3.
 test fbelavg = fabvavg=0
/*
 ( 1)  fbelavg - fabvavg = 0
 ( 2)  fbelavg = 0

       F(  2,  1248) =    0.83
            Prob > F =    0.4362
*/



