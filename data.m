FF=[ 0.05,  2,  1;
     0.54,  4,  1;
     0.99,  5,  1;
     2.82,  7,  1;
     5.86,  9,  1;
     10.13, 10, 1;
     16.1,  12, 1;
     27.78, 14, 1;
     76.47, 16, 1;
     68.4,  18, 1;
     100.56,20, 1;
     191.77,25, 1;
     
     0.05,  2,  1;
     0.08,  2,  2;
     0.11,  2,  3;
     0.15,  2,  4;
     0.2,   2,  5;
     0.63,  2, 10;
     1.46,  2, 15;
     2.81,  2, 20;
     4.81,  2, 25;
     7.61,  2, 30;
     
     0.17,	3,	1;
     0.27,	3,	2;
     0.39,	3,	3;
     0.55,	3,	4;
     0.75,	3,	5;
     2.45,	3,	10;
     5.76,	3,	15;
     11.08,	3,	20;
     19.08,	3,	25;
     30.35,	3,	30;
     
     0.54,	4,	1;
     0.76,	4,	2;
     1.12,	4,	3;
     1.54,	4,	4;
     2.07,	4,	5;
     6.47,	4,	10;
     14.72,	4,	15;
     28.82,	4,	20;
     52.38,	4,	25;
     75.51,	4,	30;
     
     
     0.99,	5,	1;
     1.51,	5,	2;
     2.2,	5,	3;
     3.05,	5,	4;
     4.05,	5,	5;
     12.7,	5,	10;
     29.00,	5,	15;
     55.36,	5,	20;
     93.44,	5,	25;
		
     2.82,	7,	1;
     4.24,	7,	2;
     6.05,	7,	3;
     8.44,	7,	4;
     11.33,	7,	5;
     34.97,	7,	10;
     80.36,	7,	15;
		
     10.13,	10,	1;
     15.06,	10,	2;
     2.16 ,	10,	3;
     28.87,	10,	4;
	
     27.78,	14,	1;
     57.44,	14,	2;
     ];
 
  IPP=[ 
0.02,	2,	1;
0.16,	4,	1;
0.4, 	5,	1;
2.15,	7,	1;
11.38,	9,	1;
44.8,	10,	1;
116.55,	12,	1;
374.79,	14,	1;
893.08,	16,	1;
		
0.02,	2,	1;
0.03,	2,	2;
0.04,	2,	3;
0.05,	2,	4;
0.08,	2,	5;
0.21,	2,	10;
0.63,	2,	15;
1.9,    2,	20;
4.99,	2,	25;
12.71,	2,	30;
		
0.06,	3,	1;
0.09,	3,	2;
0.12,	3,	3;
0.17,	3,	4;
0.25,	3,	5;
0.98,	3,	10;
3.62,	3,	15;
13.81,	3,	20;
30.03,	3,	25;
55.05,	3,	30;

0.16,	4,	1;
0.24,	4,	2;
0.41,	4,	3;
0.61,	4,	4;
0.81,	4,	5;
3.61,	4,	10;
14.82,	4,	15;
44.13,	4,	20;
104.59,	4,	25;
219.07,	4,	30;

0.4,	5,	1;
0.58,	5,	2;
1,  	5,	3;
1.55,	5,	4;
1.99,	5,	5;
12.26,	5,	10;
40.53,	5,	15;
114.07,	5,	20;
259,	5,	25;


2.15,	7,	1;
3.67,	7,	2;
5.66,	7,	3;
9.86,	7,	4;
15.05,	7,	5;
61.2,	7,	10;
199.58,	7,	15;
		
44.8,	10,	1;
82.71,	10,	2;
106.36,	10,	3;
111.42,	10,	4;

374.79,	14,	1;
592.46,	14,	2;

];
%-------all-data---------------
 FF_i_i=FF(:,1);
 IPP_i_i=IPP(:,1);

 CFF=FF(:,2);
 OFF=FF(:,3);
 
 CIPP=IPP(:,2);
 OIPP=IPP(:,3);
%---------1 office, i cities------------- 
 FF_i_1=FF(1:12,1);
 IPP_i_1=IPP(1:9,1);

 CFF_i_1=FF(1:12,2);
 OFF_i_1=FF(1:12,3);
 
 CIPP_i_1=IPP(1:9,2);
 OIPP_i_1=IPP(1:9,3);
 %----------i offices, 2 citites -----------
 
 FF_2_i=FF(13:22,1);
 IPP_2_i=IPP(10:19,1);
 
 CFF_2_i=FF(13:22,2);
 OFF_2_i=FF(13:22,3);
 
 CIPP_2_i=IPP(10:19,2);
 OIPP_2_i=IPP(10:19,3);
 %---------------------
 
 FF_3_i=FF(23:32,1);
 IPP_3_i=IPP(20:29,1);
 
 CFF_3_i=FF(23:32,2);
 OFF_3_i=FF(23:32,3);
 
 CIPP_3_i=IPP(20:29,2);
 OIPP_3_i=IPP(20:29,3);
 %---------------------
 
 FF_4_i=FF(33:42,1);
 IPP_4_i=IPP(30:39,1);
 
 CFF_4_i=FF(33:42,2);
 OFF_4_i=FF(33:42,3);
 
 CIPP_4_i=IPP(30:39,2);
 OIPP_4_i=IPP(30:39,3);
 %---------------------
 
 FF_5_i=FF(43:51,1);
 IPP_5_i=IPP(40:48,1);
 
 CFF_5_i=FF(43:51,2);
 OFF_5_i=FF(43:51,3);
 
 CIPP_5_i=IPP(40:48,2);
 OIPP_5_i=IPP(40:48,3);
 %---------------------
 
 FF_7_i=FF(52:58,1);
 IPP_7_i=IPP(49:55,1);
 
 CFF_7_i=FF(52:58,2);
 OFF_7_i=FF(52:58,3);
 
 CIPP_7_i=IPP(49:55,2);
 OIPP_7_i=IPP(49:55,3);
 %---------------------
 
 FF_10_i=FF(59:62,1);
 IPP_10_i=IPP(56:59,1); 
 
 CFF_10_i=FF(59:62,2);
 OFF_10_i=FF(59:62,3);
 
 CIPP_10_i=IPP(56:59,2);
 OIPP_10_i=IPP(56:59,3);
 %---------------------

 FF2 = @(x) 0.00215*x.^2.4;
 IPP2= @(x) 0.0000007413*x.^4.896;
 
 FF5 =@(x) 0.06959*x.^2.235;
 IPP5=@(x) 0.002198*x.^3.627;  
 
 FF7 =@(x) 0.5688*x.^1.823;
 IPP7=@(x) 0.1168*x.^2.747;
 
 FFC = @(x) 0.0175*x.^2.891;
 IPPC = @(x) 0.000007421*x.^6.711
 
 FC = @(x) (0.5*x.^2+7.2*x);
 
 figure(1)
 fplot(FF2,[0,30])
 
 hold on
 fplot(IPP2,[0,30],'red')
 
 hold off
 
 figure(2)
 fplot(FF5,[0,30])
 
 hold on
 fplot(IPP5,[0,30],'red')
 
 hold off

  figure(3)
 fplot(FF7,[0,30])
 
 hold on
 fplot(IPP7,[0,30],'red')
 
 hold off
 
 figure(4)
 fplot(FC,[0,20],'green')
 
  
 
 hold on
 fplot(IPPC,[0,20],'red')
 
 fplot(FFC,[0,20])

 hold off
 
 
 