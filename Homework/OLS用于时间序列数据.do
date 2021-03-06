**lecture9 C14
use "D:\STATApractice\econmath.dta"
*1.
count if act==.
  **42
  sum score,detail
/*
                  course score, in percent
-------------------------------------------------------------
      Percentiles      Smallest
 1%        35.16          19.53
 5%        47.66          20.31
10%        54.92          22.13       Obs                 856
25%        64.06          22.66       Sum of Wgt.         856

50%        74.22                      Mean           72.59981
                        Largest       Std. Dev.      13.40068
75%        82.79          96.09
90%        88.52          97.54       Variance       179.5782
95%        92.19          97.66       Skewness       -.697748
99%        95.31          98.44       Kurtosis       3.591153
*/ 

 gen actmiss=1 if act==.   	//	如果缺失，actmiss=1
**(814 missing values generated)

 recode actmiss (.=0)   //填补，剩下的都是没有缺失的。
**(actmiss: 814 changes made)

*2.
 gen act0=act if act!=.
*(42 missing values generated)


 recode act0 (.=0)
*(act0: 42 changes made)

 mean act0 act
/*
Mean estimation                   Number of obs   =        814

--------------------------------------------------------------
             |       Mean   Std. Err.     [95% Conf. Interval]
-------------+------------------------------------------------
        act0 |   23.12162   .1173857      22.89121    23.35204
         act |   23.12162   .1173857      22.89121    23.35204
--------------------------------------------------------------
*/

**3
reg score act if act!=.  ,robust
/*
Linear regression                               Number of obs     =        814
                                                F(1, 812)         =     117.45
                                                Prob > F          =     0.0000
                                                R-squared         =     0.1518
                                                Root MSE          =      12.26

------------------------------------------------------------------------------
             |               Robust
       score |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
         act |   1.548018   .1428396    10.84   0.000      1.26764    1.828397
       _cons |   36.81604   3.404034    10.82   0.000      30.1343    43.49779
------------------------------------------------------------------------------
*/

**4
 reg score act0 ,robust
/*
Linear regression                               Number of obs     =        856
                                                F(1, 854)         =      23.52
                                                Prob > F          =     0.0000
                                                R-squared         =     0.0436
                                                Root MSE          =     13.113

------------------------------------------------------------------------------
             |               Robust
       score |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
        act0 |   .4687832   .0966657     4.85   0.000     .2790531    .6585133
       _cons |   62.29261     2.2858    27.25   0.000     57.80616    66.77905
------------------------------------------------------------------------------
*/

**5.
 reg score act0 actmiss
/*
      Source |       SS           df       MS      Number of obs   =       856
-------------+----------------------------------   F(2, 853)       =     70.78
       Model |  21853.6335         2  10926.8167   Prob > F        =    0.0000
    Residual |  131685.712       853  154.379498   R-squared       =    0.1423
-------------+----------------------------------   Adj R-squared   =    0.1403
       Total |  153539.345       855  179.578182   Root MSE        =    12.425

------------------------------------------------------------------------------
       score |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
        act0 |   1.548018   .1301134    11.90   0.000     1.292638    1.803398
     actmiss |   35.61086   3.593888     9.91   0.000     28.55696    42.66476
       _cons |   36.81604   3.039791    12.11   0.000      30.8497    42.78239
------------------------------------------------------------------------------
*/

*7
reg score act colgpa if act!=.  ,robust
/*
Linear regression                               Number of obs     =        814
                                                F(2, 811)         =     208.65
                                                Prob > F          =     0.0000
                                                R-squared         =     0.3805
                                                Root MSE          =     10.484

------------------------------------------------------------------------------
             |               Robust
       score |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
         act |   .8790676   .1260863     6.97   0.000     .6315735    1.126562
      colgpa |   12.50957   .7467914    16.75   0.000      11.0437    13.97545
       _cons |   17.11886   3.244917     5.28   0.000     10.74943    23.48829
------------------------------------------------------------------------------
*/
 reg score act0 actmiss colgpa
/*
      Source |       SS           df       MS      Number of obs   =       856
-------------+----------------------------------   F(3, 852)       =    166.74
       Model |  56797.7635         3  18932.5878   Prob > F        =    0.0000
    Residual |   96741.582       852  113.546458   R-squared       =    0.3699
-------------+----------------------------------   Adj R-squared   =    0.3677
       Total |  153539.345       855  179.578182   Root MSE        =    10.656

------------------------------------------------------------------------------
       score |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
        act0 |   .8742698   .1180114     7.41   0.000     .6426426    1.105897
     actmiss |   19.08589   3.222901     5.92   0.000     12.76013    25.41165
      colgpa |   12.59929   .7182008    17.54   0.000     11.18964    14.00894
       _cons |   16.97759   2.841675     5.97   0.000     11.40009     22.5551
------------------------------------------------------------------------------
*/
clear all

**lecture10 C11
use "D:\STATApractice\TRAFFIC2.DTA"
 *1
 list year if beltlaw==1

tab beltlaw
/*
   =1 after |
   seatbelt |
        law |      Freq.     Percent        Cum.
------------+-----------------------------------
          0 |         60       55.56       55.56
          1 |         48       44.44      100.00
------------+-----------------------------------
      Total |        108      100.00
*/
list in 60/61

tab spdlaw
/*
=1 after 65 |
     mph in |
     effect |      Freq.     Percent        Cum.
------------+-----------------------------------
          0 |         76       70.37       70.37
          1 |         32       29.63      100.00
------------+-----------------------------------
      Total |        108      100.00
*/
list in 76/77

*2
 reg ltotacc t feb mar apr may jun jul aug sep oct nov dec
/*
      Source |       SS           df       MS      Number of obs   =       108
-------------+----------------------------------   F(12, 95)       =     31.06
       Model |  1.00244071        12  .083536726   Prob > F        =    0.0000
    Residual |  .255496765        95   .00268944   R-squared       =    0.7969
-------------+----------------------------------   Adj R-squared   =    0.7712
       Total |  1.25793748       107  .011756425   Root MSE        =    .05186

------------------------------------------------------------------------------
     ltotacc |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
           t |   .0027471   .0001611    17.06   0.000     .0024274    .0030669
         feb |  -.0426865   .0244475    -1.75   0.084    -.0912208    .0058479
         mar |   .0798245   .0244491     3.26   0.002      .031287    .1283621
         apr |   .0184849   .0244517     0.76   0.452     -.030058    .0670277
         may |   .0320981   .0244554     1.31   0.193    -.0164521    .0806483
         jun |   .0201918   .0244602     0.83   0.411    -.0283678    .0687515
         jul |   .0375826    .024466     1.54   0.128    -.0109886    .0861538
         aug |    .053983   .0244729     2.21   0.030     .0053981    .1025679
         sep |    .042361   .0244809     1.73   0.087    -.0062397    .0909617
         oct |   .0821135   .0244899     3.35   0.001     .0334949     .130732
         nov |   .0712785   .0244999     2.91   0.005       .02264    .1199171
         dec |   .0961572   .0245111     3.92   0.000     .0474966    .1448178
       _cons |   10.46857   .0190028   550.89   0.000     10.43084    10.50629
------------------------------------------------------------------------------
*/

*3
reg ltotacc t feb mar apr may jun jul aug sep oct nov dec wkends unem spdlaw beltlaw

 /*     Source |       SS           df       MS      Number of obs   =       108
-------------+----------------------------------   F(16, 91)       =     57.61
       Model |  1.14490901        16  .071556813   Prob > F        =    0.0000
    Residual |  .113028469        91  .001242071   R-squared       =    0.9101
-------------+----------------------------------   Adj R-squared   =    0.8943
       Total |  1.25793748       107  .011756425   Root MSE        =    .03524

------------------------------------------------------------------------------
     ltotacc |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
           t |   .0011011   .0002579     4.27   0.000     .0005889    .0016133
         feb |  -.0338346   .0177683    -1.90   0.060    -.0691292    .0014599
         mar |    .076953   .0167941     4.58   0.000     .0435937    .1103124
         apr |   .0104561   .0170469     0.61   0.541    -.0234054    .0443177
         may |   .0237074   .0169389     1.40   0.165    -.0099397    .0573544
         jun |   .0219334   .0172149     1.27   0.206     -.012262    .0561288
         jul |   .0499293   .0167036     2.99   0.004     .0167496    .0831089
         aug |   .0559526   .0168173     3.33   0.001      .022547    .0893581
         sep |   .0420693   .0172819     2.43   0.017      .007741    .0763977
         oct |   .0817171   .0169554     4.82   0.000     .0480372    .1153969
         nov |   .0768721   .0172455     4.46   0.000     .0426161    .1111282
         dec |   .0990863   .0170705     5.80   0.000     .0651779    .1329948
      wkends |   .0033333   .0037761     0.88   0.380    -.0041675    .0108342
        unem |  -.0212173   .0033974    -6.25   0.000    -.0279659   -.0144688
      spdlaw |  -.0537593   .0126036    -4.27   0.000    -.0787948   -.0287238
     beltlaw |   .0954528   .0142351     6.71   0.000     .0671766     .123729
       _cons |   10.63986    .063086   168.66   0.000     10.51455    10.76518
------------------------------------------------------------------------------
*/

**5
 sum prcfat,detail

  /*                   100*(fatacc/totacc)
-------------------------------------------------------------
      Percentiles      Smallest
 1%     .7171957       .7016841
 5%     .7321052       .7171957
10%     .7632453       .7172716       Obs                 108
25%     .8227969       .7297521       Sum of Wgt.         108

50%     .8780984                      Mean           .8856363
                        Largest       Std. Dev.      .0997777
75%     .9464667       1.070914
90%     1.022489       1.084833       Variance       .0099556
95%     1.045443       1.178583       Skewness       .5519791
99%     1.178583       1.216828       Kurtosis       3.383689
*/

**6
 reg prcfat t feb mar apr may jun jul aug sep oct nov dec wkends unem spdlaw beltlaw

 /*     Source |       SS           df       MS      Number of obs   =       108
-------------+----------------------------------   F(16, 91)       =     14.44
       Model |  .764228387        16  .047764274   Prob > F        =    0.0000
    Residual |  .301019769        91   .00330791   R-squared       =    0.7174
-------------+----------------------------------   Adj R-squared   =    0.6677
       Total |  1.06524816       107   .00995559   Root MSE        =    .05751

------------------------------------------------------------------------------
      prcfat |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
           t |  -.0022352   .0004208    -5.31   0.000    -.0030711   -.0013993
         feb |   .0008607   .0289967     0.03   0.976    -.0567377    .0584592
         mar |   .0000923   .0274069     0.00   0.997    -.0543481    .0545327
         apr |   .0582201   .0278195     2.09   0.039     .0029601      .11348
         may |   .0716392   .0276432     2.59   0.011     .0167293    .1265492
         jun |   .1012618   .0280937     3.60   0.001     .0454571    .1570665
         jul |   .1766121   .0272592     6.48   0.000      .122465    .2307592
         aug |   .1926117   .0274448     7.02   0.000     .1380959    .2471274
         sep |   .1600164    .028203     5.67   0.000     .1039947    .2160381
         oct |   .1010357   .0276702     3.65   0.000     .0460722    .1559991
         nov |    .013949   .0281436     0.50   0.621    -.0419548    .0698528
         dec |   .0092005    .027858     0.33   0.742     -.046136     .064537
      wkends |   .0006259   .0061624     0.10   0.919     -.011615    .0128668
        unem |  -.0154259   .0055444    -2.78   0.007    -.0264392   -.0044127
      spdlaw |   .0670877   .0205683     3.26   0.002     .0262312    .1079441
     beltlaw |  -.0295053   .0232307    -1.27   0.207    -.0756503    .0166397
       _cons |   1.029799   .1029523    10.00   0.000     .8252964    1.234301
------------------------------------------------------------------------------
*/
clear all


***lecture11 C8
 use "D:\STATApractice\phillips.dta"
 *1
 reg unem unem_1
/*
      Source |       SS           df       MS      Number of obs   =        55
-------------+----------------------------------   F(1, 53)        =     69.12
       Model |  68.9295284         1  68.9295284   Prob > F        =    0.0000
    Residual |  52.8515619        53   .99719928   R-squared       =    0.5660
-------------+----------------------------------   Adj R-squared   =    0.5578
       Total |   121.78109        54  2.25520538   Root MSE        =     .9986

------------------------------------------------------------------------------
        unem |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
      unem_1 |   .7423824   .0892927     8.31   0.000     .5632839    .9214809
       _cons |   1.489685   .5202033     2.86   0.006      .446289     2.53308
------------------------------------------------------------------------------
*/
 *2
  reg unem unem_1 inf_1

/*      Source |       SS           df       MS      Number of obs   =        55
-------------+----------------------------------   F(2, 52)        =     59.60
       Model |  84.7924146         2  42.3962073   Prob > F        =    0.0000
    Residual |  36.9886756        52  .711320685   R-squared       =    0.6963
-------------+----------------------------------   Adj R-squared   =    0.6846
       Total |   121.78109        54  2.25520538   Root MSE        =     .8434

------------------------------------------------------------------------------
        unem |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
      unem_1 |   .6494787   .0779388     8.33   0.000     .4930831    .8058743
       inf_1 |   .1830086   .0387537     4.72   0.000     .1052436    .2607735
       _cons |   1.296416   .4412563     2.94   0.005     .4109709    2.181862
------------------------------------------------------------------------------
*/

*4
 gen unem_1_0= unem_1-6

 gen inf_1_0= inf_1-2.3

reg unem unem_1_0 inf_1_0
/*
      Source |       SS           df       MS      Number of obs   =        55
-------------+----------------------------------   F(2, 52)        =     59.60
       Model |  84.7924148         2  42.3962074   Prob > F        =    0.0000
    Residual |  36.9886755        52  .711320683   R-squared       =    0.6963
-------------+----------------------------------   Adj R-squared   =    0.6846
       Total |   121.78109        54  2.25520538   Root MSE        =     .8434

------------------------------------------------------------------------------
        unem |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
    unem_1_0 |   .6494787   .0779388     8.33   0.000     .4930831    .8058743
     inf_1_0 |   .1830086   .0387537     4.72   0.000     .1052436    .2607735
       _cons |   5.614208   .1363808    41.17   0.000      5.34054    5.887876
------------------------------------------------------------------------------
*/

