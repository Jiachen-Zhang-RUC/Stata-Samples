********************************************************************************
**C3 p87
use "D:\STATApractice\CEOSAL2.DTA"

reg lsalary lsales lmktval
/*
      Source |       SS           df       MS      Number of obs   =       177
-------------+----------------------------------   F(2, 174)       =     37.13
       Model |  19.3365617         2  9.66828083   Prob > F        =    0.0000
    Residual |  45.3096514       174  .260400295   R-squared       =    0.2991
-------------+----------------------------------   Adj R-squared   =    0.2911
       Total |  64.6462131       176  .367308029   Root MSE        =    .51029

------------------------------------------------------------------------------
     lsalary |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
      lsales |   .1621283   .0396703     4.09   0.000     .0838315    .2404252
     lmktval |    .106708    .050124     2.13   0.035     .0077787    .2056372
       _cons |   4.620917   .2544083    18.16   0.000     4.118794    5.123041
------------------------------------------------------------------------------
*/

reg lsalary lsales lmktval profits
/*
      Source |       SS           df       MS      Number of obs   =       177
-------------+----------------------------------   F(3, 173)       =     24.64
       Model |  19.3509799         3  6.45032663   Prob > F        =    0.0000
    Residual |  45.2952332       173  .261822157   R-squared       =    0.2993
-------------+----------------------------------   Adj R-squared   =    0.2872
       Total |  64.6462131       176  .367308029   Root MSE        =    .51169

------------------------------------------------------------------------------
     lsalary |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
      lsales |   .1613683   .0399101     4.04   0.000     .0825949    .2401416
     lmktval |   .0975286   .0636886     1.53   0.128    -.0281782    .2232354
     profits |   .0000357    .000152     0.23   0.815    -.0002643    .0003356
       _cons |   4.686924   .3797294    12.34   0.000     3.937425    5.436423
------------------------------------------------------------------------------
*/

 reg lsalary lsales lmktval profits ceoten

 /*    Source |       SS           df       MS      Number of obs   =       177
-------------+----------------------------------   F(4, 172)       =     20.08
       Model |  20.5768102         4  5.14420254   Prob > F        =    0.0000
    Residual |  44.0694029       172  .256217459   R-squared       =    0.3183
-------------+----------------------------------   Adj R-squared   =    0.3024
       Total |  64.6462131       176  .367308029   Root MSE        =    .50618

------------------------------------------------------------------------------
     lsalary |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
      lsales |   .1622339   .0394826     4.11   0.000     .0843012    .2401667
     lmktval |   .1017598    .063033     1.61   0.108     -.022658    .2261775
     profits |   .0000291   .0001504     0.19   0.847    -.0002677    .0003258
      ceoten |   .0116847    .005342     2.19   0.030     .0011403     .022229
       _cons |    4.55778   .3802548    11.99   0.000     3.807213    5.308347
------------------------------------------------------------------------------
*/

 cor lmktval profits
/*
             |  lmktval  profits
-------------+------------------
     lmktval |   1.0000
     profits |   0.7769   1.0000
*/

********************************************************************************
**c1
use "D:\STATApractice\VOTE1.DTA"
reg voteA lexpendA lexpendB prtystrA
/*
      Source |       SS           df       MS      Number of obs   =       173
-------------+----------------------------------   F(3, 169)       =    215.23
       Model |  38405.1096         3  12801.7032   Prob > F        =    0.0000
    Residual |  10052.1389       169   59.480112   R-squared       =    0.7926
-------------+----------------------------------   Adj R-squared   =    0.7889
       Total |  48457.2486       172  281.728189   Root MSE        =    7.7123

------------------------------------------------------------------------------
       voteA |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
    lexpendA |   6.083316     .38215    15.92   0.000     5.328914    6.837719
    lexpendB |  -6.615417   .3788203   -17.46   0.000    -7.363246   -5.867588
    prtystrA |   .1519574   .0620181     2.45   0.015     .0295274    .2743873
       _cons |   45.07893   3.926305    11.48   0.000     37.32801    52.82985
------------------------------------------------------------------------------
*/

 gen new= lexpendB -lexpendA

 reg voteA lexpendA new prtystrA
/*
      Source |       SS           df       MS      Number of obs   =       173
-------------+----------------------------------   F(3, 169)       =    215.23
       Model |  38405.1097         3  12801.7032   Prob > F        =    0.0000
    Residual |  10052.1388       169  59.4801115   R-squared       =    0.7926
-------------+----------------------------------   Adj R-squared   =    0.7889
       Total |  48457.2486       172  281.728189   Root MSE        =    7.7123

------------------------------------------------------------------------------
       voteA |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
    lexpendA |   -.532101   .5330858    -1.00   0.320    -1.584466    .5202638
         new |  -6.615417   .3788203   -17.46   0.000    -7.363246   -5.867588
    prtystrA |   .1519574   .0620181     2.45   0.015     .0295274    .2743873
       _cons |   45.07893   3.926305    11.48   0.000     37.32801    52.82985
------------------------------------------------------------------------------
*/



**c6
 use "D:\STATApractice\WAGE2.DTA", clear
 gen new= tenure+exper

 reg lwage exper educ new
/*
      Source |       SS           df       MS      Number of obs   =       935
-------------+----------------------------------   F(3, 931)       =     56.97
       Model |  25.6953242         3  8.56510806   Prob > F        =    0.0000
    Residual |  139.960959       931  .150334005   R-squared       =    0.1551
-------------+----------------------------------   Adj R-squared   =    0.1524
       Total |  165.656283       934  .177362188   Root MSE        =    .38773

------------------------------------------------------------------------------
       lwage |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
       exper |   .0019537   .0047434     0.41   0.681    -.0073554    .0112627
        educ |   .0748638   .0065124    11.50   0.000      .062083    .0876446
         new |   .0133748   .0025872     5.17   0.000     .0082974    .0184522
       _cons |   5.496696   .1105282    49.73   0.000     5.279782    5.713609
------------------------------------------------------------------------------
*/

