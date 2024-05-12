libname tisza "/home/u57916769/tisza" ;

/** --------------------------GYERMEK--------------------------------------------------------**/
/**GYERMEK kategória importálása**/

/** 2016-os év GYERMEK kategória importálása **/
PROC IMPORT DATAFILE="/home/u57916769/tisza/tiszagyermek2016.xlsx"
		    OUT=tisza.tiszagyermek16
		    DBMS=XLSX
		    REPLACE;
RUN;
PROC PRINT DATA=tisza.tiszagyermek16; RUN;

/** 2017-es év GYERMEK kategória importálása **/
PROC IMPORT DATAFILE="/home/u57916769/tisza/tiszagyermek2017.xlsx"
		    OUT=tisza.tiszagyermek17
		    DBMS=XLSX
		    REPLACE;
RUN;
PROC PRINT DATA=tisza.tiszagyermek17; RUN;

/** 2018-as év GYERMEK kategória importálása **/

PROC IMPORT DATAFILE="/home/u57916769/tisza/tiszagyermek2018.xlsx"
		    OUT=tisza.tiszagyermek18
		    DBMS=XLSX
		    REPLACE;
RUN;
PROC PRINT DATA=tisza.tiszagyermek18; RUN;

/** Nagybetűvé alakítás minden nevet GYERMEK **/

/** 2016 év GYERMEK kategória Nagybetűvé alakítás**/

data tisza.tiszagyermek16;                                                                                                                               
   set tisza.tiszagyermek16;                                                                                                                               
   Név=upcase(Név);                                                                                                                    
   put Név=;                                                                                                                             
run; 

/** 2017 év GYERMEK kategória Nagybetűvé alakítás**/

data tisza.tiszagyermek17;                                                                                                                               
   set tisza.tiszagyermek17;                                                                                                                               
   Név=upcase(Név);                                                                                                                    
   put Név=;                                                                                                                             
run; 

/** 2018 év GYERMEK kategória Nagybetűvé alakítás**/

data tisza.tiszagyermek18;                                                                                                                               
   set tisza.tiszagyermek18;                                                                                                                               
   Név=upcase(Név);                                                                                                                    
   put Név=;                                                                                                                             
run; 


/** GYERMEK TISZTITAS**/

/** gyermek 2016 üres sorok kivétele (nem fontos) **/

data tisza.tiszagyermek16;
set tisza.tiszagyermek16;
if (Úszás ne "-") or (Kerékpár ne "-") or  (Futás ne "-") or (Célidő ne "-") or (Hely ne ".")
then output ;
run;

/** gyermek 2017 üres sorok kivétele (nem fontos) **/

data tisza.tiszagyermek17;
set tisza.tiszagyermek17;
if (Úszás ne "-") or (Kerékpár ne "-") or  (Futás ne "-") or (Célidő ne "-") or (Hely ne ".")
then output ;
run;

/** gyermek 2018 üres sorok kivétele (nem fontos) **/

data tisza.tiszagyermek18;
set tisza.tiszagyermek18;
if (Úszás ne "-") or (Kerékpár ne "-") or  (Futás ne "-") or (Célidő ne "-") or (Hely ne ".")
then output ;
run;

/**idokorrigalas GYERMEK kat.**/


/**időkorrigalas 2016**/

data tisza.tiszagyermek16korrig (keep= Hely Helygyermek16 Név Szülév Úszás Kerékpár Futás Célidő uszasidogyermek16 kerekparidogyermek16 futasidogyermek16 celidogyermek16);
set tisza.tiszagyermek16;

Helygyermek16 = Kath;
Hely = Kath;

tizenfelul = substr(Futás,1,1);

		uperc=substr(Úszás,1,1) ; 
		ump=substr(Úszás,3,2) ; 
        uszasidogyermek16= 60*uperc+ump ; 

if tizenfelul=1 then
	do;
		fperc=substr(Futás,1,2) ; 
		fmp=substr(Futás,4,2) ; 
        futasidogyermek16= 60*fperc+fmp ;
    end;
        
    else do;
        uperc=substr(Futás,1,1) ; 
		ump=substr(Futás,3,2) ; 
        futasidogyermek16= 60*uperc+ump ;
    end;
            
		kperc=substr(Kerékpár,1,2) ; 
		kmp=substr(Kerékpár,4,2) ; 
        kerekparidogyermek16= 60*kperc+kmp ;
        
        cperc=substr(Célidő,1,2) ; 
		cmp=substr(Célidő,4,2) ; 
        celidogyermek16= 60*cperc+cmp ;
          
run ;

/**időkorrigalas 2017**/

data tisza.tiszagyermek17korrig (keep= Hely Helygyermek17 Név Szülév Úszás Kerékpár Futás Célidő uszasidogyermek17 kerekparidogyermek17 futasidogyermek17 celidogyermek17);
set tisza.tiszagyermek17;

Helygyermek17 = Hely;
tizenfelul = substr(Futás,1,1);

		uperc=substr(Úszás,1,1) ; 
		ump=substr(Úszás,3,2) ; 
        uszasidogyermek17= 60*uperc+ump ; 

if tizenfelul=1 then
	do;
		fperc=substr(Futás,1,2) ; 
		fmp=substr(Futás,4,2) ; 
        futasidogyermek17= 60*fperc+fmp ;
    end;
        
    else do;
        uperc=substr(Futás,1,1) ; 
		ump=substr(Futás,3,2) ; 
        futasidogyermek17= 60*uperc+ump ;
    end;
            
		kperc=substr(Kerékpár,1,2) ; 
		kmp=substr(Kerékpár,4,2) ; 
        kerekparidogyermek17= 60*kperc+kmp ;
        
        cperc=substr(Célidő,1,2) ; 
		cmp=substr(Célidő,4,2) ; 
        celidogyermek17= 60*cperc+cmp ;
          
run ;

/**időkorrigalas 2018**/

data tisza.tiszagyermek18korrig (keep=Hely Helygyermek18 Név Szülév Úszás Kerékpár Futás Célidő uszasidogyermek18 kerekparidogyermek18 futasidogyermek18 celidogyermek18);
set tisza.tiszagyermek18;

Helygyermek18 = Hely;
tizenfelul18 = substr(Futás,1,1);

		uperc=substr(Úszás,1,1) ; 
		ump=substr(Úszás,3,2) ; 
        uszasidogyermek18= 60*uperc+ump ; 

if tizenfelul18=1 then
	do;
		fperc=substr(Futás,1,2) ; 
		fmp=substr(Futás,4,2) ; 
        futasidogyermek18= 60*fperc+fmp ;
    end;
        
    else do;
        uperc=substr(Futás,1,1) ; 
		ump=substr(Futás,3,2) ; 
        futasidogyermek18= 60*uperc+ump ;
    end;
            
		kperc=substr(Kerékpár,1,2) ; 
		kmp=substr(Kerékpár,4,2) ; 
        kerekparidogyermek18= 60*kperc+kmp ;
        
        cperc=substr(Célidő,1,2) ; 
		cmp=substr(Célidő,4,2) ; 
        celidogyermek18= 60*cperc+cmp ;
          
run ;

/** K-means gyermek korcsoportra **/
/**2016 gyermek klaszter**/

ods noproctitle;

proc stdize data=TISZA.TISZAGYERMEK16KORRIG out=Work._std_ method=range;
	var uszasidogyermek16 futasidogyermek16 kerekparidogyermek16;
run;

proc fastclus data=Work._std_ maxclusters=5 out=work.Fastclus_scores0001;
	var uszasidogyermek16 futasidogyermek16 kerekparidogyermek16;
run;

proc delete data=Work._std_;
run;

/**2017 gyermek klaszter**/

ods noproctitle;

proc stdize data=TISZA.TISZAGYERMEK17KORRIG out=Work._std_ method=range;
	var uszasidogyermek17 futasidogyermek17 kerekparidogyermek17;
run;

proc fastclus data=Work._std_ maxclusters=5 out=work.Fastclus_scores0001;
	var uszasidogyermek17 futasidogyermek17 kerekparidogyermek17;
run;

proc delete data=Work._std_;
run;

/**2018 gyermek klaszter**/

ods noproctitle;

proc stdize data=TISZA.TISZAGYERMEK18KORRIG out=Work._std_ method=range;
	var uszasidogyermek18 futasidogyermek18 kerekparidogyermek18;
run;

proc fastclus data=Work._std_ maxclusters=5 out=work.Fastclus_scores0001;
	var uszasidogyermek18 futasidogyermek18 kerekparidogyermek18;
run;

proc delete data=Work._std_;
run;

/** Klaszter observation gyermek kp-ra **/

/** Klaszter analizis 2016 gyermekre **/
ods noproctitle;

/*** Standardize variables ***/
proc distance data=TISZA.TISZAGYERMEK16KORRIG stdonly outsdz=Work._Temp_sdz;
	var ratio(uszasidogyermek16 futasidogyermek16 kerekparidogyermek16 / 
		std=maxabs);
run;

proc cluster data=Work._Temp_sdz method=ward plots outtree=work.Cluster_tree;
	var uszasidogyermek16 futasidogyermek16 kerekparidogyermek16;
	id 'Név'n;
run;

proc delete data=Work._Temp_sdz;
run;

/** Klaszter analizis 2017 gyermekre **/
ods noproctitle;

proc distance data=TISZA.TISZAGYERMEK17KORRIG stdonly outsdz=Work._Temp_sdz;
	var ratio(uszasidogyermek17 futasidogyermek17 kerekparidogyermek17 / 
		std=maxabs);
run;

proc cluster data=Work._Temp_sdz method=ward plots outtree=work.Cluster_tree;
	var uszasidogyermek17 futasidogyermek17 kerekparidogyermek17;
	id 'Név'n;
run;

proc delete data=Work._Temp_sdz;
run;


/** Lineáris regresszió gyermekekre**/

/** 2016 gyermek  lin.r. számonként**/
ods noproctitle;
ods graphics / imagemap=on;

proc reg data=TISZA.TISZAGYERMEK16KORRIG alpha=0.05 plots(only)=(diagnostics 
		residuals fitplot observedbypredicted);
	model Helygyermek16=uszasidogyermek16 /;
	model Helygyermek16=futasidogyermek16 /;
	model Helygyermek16=kerekparidogyermek16 /;
	run;
quit;

/** 2016 gyermek lin.r. egyben **/

ods noproctitle;
ods graphics / imagemap=on;

proc glmselect data=TISZA.TISZAGYERMEK16KORRIG 
		outdesign(addinputvars)=Work.reg_design;
	model Helygyermek16=uszasidogyermek16*futasidogyermek16*kerekparidogyermek16 / 
		showpvalues selection=none;
run;

proc reg data=Work.reg_design alpha=0.05 plots(only)=(diagnostics residuals 
		observedbypredicted);
	ods select DiagnosticsPanel ResidualPlot ObservedByPredicted;
	model Helygyermek16=&_GLSMOD /;
	run;
quit;

proc delete data=Work.reg_design;
run;

/** 2017 gyermek  lin.r. számonként**/
ods noproctitle;
ods graphics / imagemap=on;

proc reg data=TISZA.TISZAGYERMEK17KORRIG alpha=0.05 plots(only)=(diagnostics 
		residuals fitplot observedbypredicted);
	model Helygyermek17=uszasidogyermek17 /;
	model Helygyermek17=futasidogyermek17 /;
	model Helygyermek17=kerekparidogyermek17 /;
	run;
quit;

/** 2017 gyermek lin.r. egyben **/

ods noproctitle;
ods graphics / imagemap=on;

proc glmselect data=TISZA.TISZAGYERMEK17KORRIG 
		outdesign(addinputvars)=Work.reg_design;
	model Helygyermek17=uszasidogyermek17*futasidogyermek17*kerekparidogyermek17 / 
		showpvalues selection=none;
run;

proc reg data=Work.reg_design alpha=0.05 plots(only)=(diagnostics residuals 
		observedbypredicted);
	ods select DiagnosticsPanel ResidualPlot ObservedByPredicted;
	model Helygyermek17=&_GLSMOD /;
	run;
quit;

proc delete data=Work.reg_design;
run;


/** elsők eredményei minden évre hogyan valtozott **/

data tisza.gyermek16elsok tisza.gyermek16nemelsok;
set tisza.tiszagyermek16korrig ;
select ;
 when  (Hely = 1) output tisza.gyermek16elsok ;
  otherwise output tisza.gyermek16nemelsok ;
end ;

data tisza.gyermek17elsok tisza.gyermek17nemelsok;
set tisza.tiszagyermek17korrig ;
select ;
 when  (Hely <= 1) output tisza.gyermek17elsok ;
  otherwise output tisza.gyermek17nemelsok ;
end ;

data tisza.gyermek18elsok tisza.gyermek18nemelsok;
set tisza.tiszagyermek18korrig ;
select ;
 when  (Hely <= 1) output tisza.gyermek18elsok ;
  otherwise output tisza.gyermek18nemelsok ;
end ;


/** --------------------------GYERMEK--------------------------------------------------------**/





/**százalékok gyermek teljesítmény**/
/**hogyan tudom a versenyzők értékét az átlaggal elosztani?**/

proc means data=tisza.tiszagyermek16jo (keep=Helygyermek16 Név uszasidogyermek16) mean;
    var uszasidogyermek16;
    output out=tisza.avg_uszasgy16 
        mean=Avg_uszasgy16;
run;

proc means data=tisza.tiszagyermek16jo;
run;

data tisza.tiszagyermek17jo tisza.avg_uszasgy16 (Keep= Helygyermek16 Név uszasszazalek16);
set tisza.avg_uszasgyermek16;

	uszasszazalek16 = (uszasidogyermek16 / Avg_uszasgy16);
	
run;

/**---------------------------------------------------------------------------**/
/**-----------------------------SERDÜLŐ------------------------------------------------------**/

/** 2016-es év SERDULO kategória importálása **/

PROC IMPORT DATAFILE="/home/u57916769/tisza/tiszaserdulo2016.xlsx"
		    OUT=tisza.tiszaserdulo16
		    DBMS=XLSX
		    REPLACE;
RUN;
PROC PRINT DATA=tisza.tiszaserdulo16; RUN;


/** 2017-es év SERDULO kategória importálása **/

PROC IMPORT DATAFILE="/home/u57916769/tisza/tiszaserdulo2017.xlsx"
		    OUT=tisza.tiszaserdulo17
		    DBMS=XLSX
		    REPLACE;
RUN;
PROC PRINT DATA=tisza.tiszaserdulo17; RUN;


/** 2018-es év SERDULO kategória importálása **/


PROC IMPORT DATAFILE="/home/u57916769/tisza/tiszaserdulo2018.xlsx"
		    OUT=tisza.tiszaserdulo18
		    DBMS=XLSX
		    REPLACE;
RUN;
PROC PRINT DATA=tisza.tiszaserdulo18; RUN;


/** 2019-es év SERDULO kategória importálása **/


PROC IMPORT DATAFILE="/home/u57916769/tisza/tiszaserdulo2019.xlsx"
		    OUT=tisza.tiszaserdulo19
		    DBMS=XLSX
		    REPLACE;
RUN;
PROC PRINT DATA=tisza.tiszaserdulo19; RUN;


/** 2020-es év SERDULO kategória importálása **/


PROC IMPORT DATAFILE="/home/u57916769/tisza/tiszaserdulo2020.xlsx"
		    OUT=tisza.tiszaserdulo20
		    DBMS=XLSX
		    REPLACE;
RUN;
PROC PRINT DATA=tisza.tiszaserdulo20; RUN;


/** SERDULO SORTISZTITAS**/

/** serdulo 2016 üres sorok kivétele (nem fontos) **/

data tisza.tiszaserdulo16;
set tisza.tiszaserdulo16;
if (Úszás ne "-") or (Kerékpár ne "-") or  (Futás ne "-") or (Célidő ne "-") or (Hely ne ".")
then output ;
run;

/** serdulo 2017 üres sorok kivétele (nem fontos) **/

data tisza.tiszaserdulo17;
set tisza.tiszaserdulo17;
if (Úszás ne "-") or (Kerékpár ne "-") or  (Futás ne "-") or (Célidő ne "-") or (Hely ne ".")
then output ;
run;

/** serdulo 2018 üres sorok kivétele (nem fontos) **/

data tisza.tiszaserdulo18;
set tisza.tiszaserdulo18;
if (Úszás ne "-") or (Kerékpár ne "-") or  (Futás ne "-") or (Célidő ne "-") or (Hely ne ".")
then output ;
run;

/** serdulo 2019 üres sorok kivétele (nem fontos) **/

data tisza.tiszaserdulo19;
set tisza.tiszaserdulo19;
if (Úszás ne "-") or (Kerékpár ne "-") or  (Futás ne "-") or (Célidő ne "-") or (Hely ne ".")
then output ;
run;

/** serdulo 2020 üres sorok kivétele (nem fontos) **/

data tisza.tiszaserdulo20;
set tisza.tiszaserdulo20;
if (Úszás ne "-") or (Kerékpár ne "-") or  (Futás ne "-") or (Célidő ne "-") or (Hely ne ".")
then output ;
run;


/**SERDULO nagybetuve alakitas **/

/** 2016 SERDULO nagybetuve alakitas **/

data tisza.tiszaserdulo16;                                                                                                                               
   set tisza.tiszaserdulo16;                                                                                                                               
   Név=upcase(Név);                                                                                                                    
   put Név=;                                                                                                                             
run; 

/** 2017 SERDULO nagybetuve alakitas **/

data tisza.tiszaserdulo17;                                                                                                                               
   set tisza.tiszaserdulo17;                                                                                                                               
   Név=upcase(Név);                                                                                                                    
   put Név=;                                                                                                                             
run; 

/** 2018 SERDULO nagybetuve alakitas **/

data tisza.tiszaserdulo18;                                                                                                                               
   set tisza.tiszaserdulo18;                                                                                                                               
   Név=upcase(Név);                                                                                                                    
   put Név=;                                                                                                                             
run; 

/** 2019 SERDULO nagybetuve alakitas **/

data tisza.tiszaserdulo19;                                                                                                                               
   set tisza.tiszaserdulo19;                                                                                                                               
   Név=upcase(Név);                                                                                                                    
   put Név=;                                                                                                                             
run; 

/** 2020 SERDULO nagybetuve alakitas **/

data tisza.tiszaserdulo20;                                                                                                                               
   set tisza.tiszaserdulo20;                                                                                                                               
   Név=upcase(Név);                                                                                                                    
   put Név=;                                                                                                                             
run; 

/** idokorrigalas serdulo ** 18-20**/

/** 2018-es idokorrigalas serdulo **/

data tisza.tiszaserdulo18korrig (keep= Helyserdulo18 Név Szülév Úszás Kerékpár Futás Célidő uszasidoserdulo18 kerekparidoserdulo18 futasidoserdulo18 celidoserdulo18);
set tisza.tiszaserdulo18;

	Helyserdulo18 = Hely;

	uperc=substr(Úszás,1,1) ; 
	ump=substr(Úszás,3,2) ; 
    uszasidoserdulo18= 60*uperc+ump ; 

	fperc=substr(Futás,1,2) ; 
	fmp=substr(Futás,4,2) ; 
    futasidoserdulo18= 60*fperc+fmp ;
        
	kperc=substr(Kerékpár,1,2) ; 
	kmp=substr(Kerékpár,4,2) ; 
    kerekparidoserdulo18= 60*kperc+kmp ;
    
    cperc=substr(Célidő,1,2) ; 
	cmp=substr(Célidő,4,2) ; 
    celidoserdulo18= 60*cperc+cmp ;
          
run ;

/** 2019-es idokorrigalas serdulo **/

data tisza.tiszaserdulo19korrig (keep= Helyserdulo19 Név Szülév Úszás Kerékpár Run Célidő uszasidoserdulo19 kerekparidoserdulo19 futasidoserdulo19 celidoserdulo19);
set tisza.tiszaserdulo19;

	Helyserdulo19 = Hely;

	uperc=substr(Úszás,1,1) ; 
	ump=substr(Úszás,3,2) ; 
    uszasidoserdulo19= 60*uperc+ump ; 

	fperc=substr(Run,1,2) ; 
	fmp=substr(Run,4,2) ; 
    futasidoserdulo19= 60*fperc+fmp ;
        
	kperc=substr(Kerékpár,1,2) ; 
	kmp=substr(Kerékpár,4,2) ; 
    kerekparidoserdulo19= 60*kperc+kmp ;
    
    cperc=substr(Célidő,1,2) ; 
	cmp=substr(Célidő,4,2) ; 
    celidoserdulo19= 60*cperc+cmp ;
          
run ;

/** 2020-as idokorrigalas serdulo **/

data tisza.tiszaserdulo20korrig (keep= Helyserdulo20 Név Szülév Úszás Kerékpár Run Célidő uszasidoserdulo20 kerekparidoserdulo20 futasidoserdulo20 celidoserdulo20);
set tisza.tiszaserdulo20;

	Helyserdulo19 = Hely;

	uperc=substr(Úszás,1,1) ; 
	ump=substr(Úszás,3,2) ; 
    uszasidoserdulo20= 60*uperc+ump ; 

	fperc=substr(Run,1,2) ; 
	fmp=substr(Run,4,2) ; 
    futasidoserdulo20= 60*fperc+fmp ;
        
	kperc=substr(Kerékpár,1,2) ; 
	kmp=substr(Kerékpár,4,2) ; 
    kerekparidoserdulo20= 60*kperc+kmp ;
    
    cperc=substr(Célidő,1,2) ; 
	cmp=substr(Célidő,4,2) ; 
    celidoserdulo20= 60*cperc+cmp ;
          
run ;


/** K-means serdulo korcsoportra **/                                                                                   
/**2018 serdulo klaszter**/

ods noproctitle;

proc stdize data=TISZA.TISZASERDULO18KORRIG out=Work._std_ method=range;
	var uszasidoserdulo18 futasidoserdulo18 kerekparidoserdulo18;
run;

proc fastclus data=Work._std_ maxclusters=5 out=work.Fastclus_scores0001;
	var uszasidoserdulo18 futasidoserdulo18 kerekparidoserdulo18;
run;

proc delete data=Work._std_;
run;


/**2019 serdulo klaszter**/

ods noproctitle;

proc stdize data=TISZA.TISZASERDULO19KORRIG out=Work._std_ method=range;
	var uszasidoserdulo19 futasidoserdulo19 kerekparidoserdulo19;
run;

proc fastclus data=Work._std_ maxclusters=5 out=work.Fastclus_scores0001;
	var uszasidoserdulo19 futasidoserdulo19 kerekparidoserdulo19;
run;

proc delete data=Work._std_;
run;

/**2020 serdulo klaszter**/

ods noproctitle;

proc stdize data=TISZA.TISZASERDULO20KORRIG out=Work._std_ method=range;
	var uszasidoserdulo20 futasidoserdulo20 kerekparidoserdulo20;
run;

proc fastclus data=Work._std_ maxclusters=5 out=work.Fastclus_scores0001;
	var uszasidoserdulo20 futasidoserdulo20 kerekparidoserdulo20;
run;

proc delete data=Work._std_;
run;


/** Klaszter observation serdulo kp-ra **/

/** Klaszter analizis 2018 serdulore **/
ods noproctitle;

/*** Standardize variables ***/
proc distance data=TISZA.TISZASERDULO18KORRIG stdonly outsdz=Work._Temp_sdz;
	var ratio(uszasidoserdulo18 futasidoserdulo18 kerekparidoserdulo18 / 
		std=maxabs);
run;

proc cluster data=Work._Temp_sdz method=ward plots outtree=work.Cluster_tree;
	var uszasidoserdulo18 futasidoserdulo18 kerekparidoserdulo18;
	id 'Név'n;
run;

proc delete data=Work._Temp_sdz;
run;

/** Klaszter analizis 2019 serdulore **/
ods noproctitle;

/*** Standardize variables ***/
proc distance data=TISZA.TISZASERDULO19KORRIG stdonly outsdz=Work._Temp_sdz;
	var ratio(uszasidoserdulo19 futasidoserdulo19 kerekparidoserdulo19 / 
		std=maxabs);
run;

proc cluster data=Work._Temp_sdz method=ward plots outtree=work.Cluster_tree;
	var uszasidoserdulo19 futasidoserdulo19 kerekparidoserdulo19;
	id 'Név'n;
run;

proc delete data=Work._Temp_sdz;
run;

/** Klaszter analizis 2020 serdulore **/
ods noproctitle;

/*** Standardize variables ***/
proc distance data=TISZA.TISZASERDULO20KORRIG stdonly outsdz=Work._Temp_sdz;
	var ratio(uszasidoserdulo20 futasidoserdulo20 kerekparidoserdulo20 / 
		std=maxabs);
run;

proc cluster data=Work._Temp_sdz method=ward plots outtree=work.Cluster_tree;
	var uszasidoserdulo20 futasidoserdulo20 kerekparidoserdulo20;
	id 'Név'n;
run;

proc delete data=Work._Temp_sdz;
run;


/** Lineáris regresszió serdulorke**/

/** 2018 serdulo  lin.r. számonként**/
ods noproctitle;
ods graphics / imagemap=on;

proc reg data=TISZA.TISZASERDULO18KORRIG alpha=0.05 plots(only)=(diagnostics 
		residuals fitplot observedbypredicted);
	model Helyserdulo18=uszasidoserdulo18 /;
	model Helyserdulo18=futasidoserdulo18 /;
	model Helyserdulo18=kerekparidoserdulo18 /;
	run;
quit;

/** 2018 serdulo lin.r. egyben **/

ods noproctitle;
ods graphics / imagemap=on;

proc glmselect data=TISZA.TISZASERDULO18KORRIG 
		outdesign(addinputvars)=Work.reg_design;
	model Helyserdulo18=uszasidoserdulo18*futasidoserdulo18*kerekparidoserdulo18 / 
		showpvalues selection=none;
run;

proc reg data=Work.reg_design alpha=0.05 plots(only)=(diagnostics residuals 
		observedbypredicted);
	ods select DiagnosticsPanel ResidualPlot ObservedByPredicted;
	model Helyserdulo18=&_GLSMOD /;
	run;
quit;

proc delete data=Work.reg_design;
run;


/** 2019 serdulo  lin.r. számonként**/
ods noproctitle;
ods graphics / imagemap=on;

proc reg data=TISZA.TISZASERDULO19KORRIG alpha=0.05 plots(only)=(diagnostics 
		residuals fitplot observedbypredicted);
	model Helyserdulo19=uszasidoserdulo19 /;
	model Helyserdulo19=futasidoserdulo19 /;
	model Helyserdulo19=kerekparidoserdulo19 /;
	run;
quit;

/** 2019 serdulo lin.r. egyben **/

ods noproctitle;
ods graphics / imagemap=on;

proc glmselect data=TISZA.TISZASERDULO19KORRIG 
		outdesign(addinputvars)=Work.reg_design;
	model Helyserdulo19=uszasidoserdulo19*futasidoserdulo19*kerekparidoserdulo19 / 
		showpvalues selection=none;
run;

proc reg data=Work.reg_design alpha=0.05 plots(only)=(diagnostics residuals 
		observedbypredicted);
	ods select DiagnosticsPanel ResidualPlot ObservedByPredicted;
	model Helyserdulo19=&_GLSMOD /;
	run;
quit;

proc delete data=Work.reg_design;
run;

/** 2020 serdulo  lin.r. számonként**/
ods noproctitle;
ods graphics / imagemap=on;

proc reg data=TISZA.TISZASERDULO20KORRIG alpha=0.05 plots(only)=(diagnostics 
		residuals fitplot observedbypredicted);
	model celidoserdulo20=uszasidoserdulo20 /;
	model celidoserdulo20=futasidoserdulo20 /;
	model celidoserdulo20=kerekparidoserdulo20 /;
	run;
quit;

/** 2020 serdulo lin.r. egyben **/

ods noproctitle;
ods graphics / imagemap=on;

proc glmselect data=TISZA.TISZASERDULO20KORRIG 
		outdesign(addinputvars)=Work.reg_design;
	model celidoserdulo20=uszasidoserdulo20*futasidoserdulo20*kerekparidoserdulo20 / 
		showpvalues selection=none;
run;

proc reg data=Work.reg_design alpha=0.05 plots(only)=(diagnostics residuals 
		observedbypredicted);
	ods select DiagnosticsPanel ResidualPlot ObservedByPredicted;
	model celidoserdulo20=&_GLSMOD /;
	run;
quit;

proc delete data=Work.reg_design;
run;


/** -----------------------------------SERDULO---------------------------------------**/

/** -----------------------------------SPRINT---------------------------------------**/


/** Import files. 2017-es adatok beolvasása**/


PROC IMPORT DATAFILE="/home/u57916769/tisza/2017no.xlsx"
		    OUT=tisza.tisza17
		    DBMS=XLSX
		    REPLACE;
RUN;
PROC PRINT DATA=tisza.tisza17; RUN;

/** Sorok tisztítása törléssel 2017**/

data tisza.tisza17;
set tisza.tisza17;
if (Úszás ne "-") or (Kerékpár ne "-") or  (Futás ne "-") or (Célidő ne "-") or (Hely ne ".")
then
output ;
run;


/** Nagybetűvé alakítás minden nevet 2017 **/

data tisza.tisza17;                                                                                                                               
   set tisza.tisza17;                                                                                                                               
   Név=upcase(Név);                                                                                                                    
   put Név=;                                                                                                                             
run; 

/** Ido korrigalas. 2017 **/

data tisza.tisza17korrig (keep= Hely17 Név Szülév Úszás Kerékpár Futás Célidő uszasido17 kerekparido17 futasido17 celido17);
set tisza.tisza17;

Hely17 = Hely;
kilences = substr(Úszás,1,1);

if kilences=9 then
	do;
		uperc=substr(Úszás,1,1) ; 
		ump=substr(Úszás,3,2) ; 
        uszasido17= 60*uperc+ump ;
    end;
        
    else do;
        uperc=substr(Úszás,1,2) ; 
		ump=substr(Úszás,4,2) ; 
        uszasido17= 60*uperc+ump ;
    end;
            
		kperc=substr(Kerékpár,1,2) ; 
		kmp=substr(Kerékpár,4,2) ; 
        kerekparido17= 60*kperc+kmp ;
            
		fperc=substr(Futás,1,2) ; 
		fmp=substr(Futás,4,2) ; 
        futasido17= 60*fperc+fmp ; 
        
        cperc=substr(Célidő,3,2) ; 
		cmp=substr(Célidő,6,2) ; 
        celido17= 3600+60*cperc+cmp ;
          
run ;

/** K-means sprint korcsoportra **/
/**2017 sprint klaszter**/

ods noproctitle;

proc stdize data=TISZA.TISZA17KORRIG out=Work._std_ method=range;
	var uszasido17 futasido17 kerekparido17;
run;

proc fastclus data=Work._std_ maxclusters=5 out=work.Fastclus_scores0001;
	var uszasido17 futasido17 kerekparido17;
run;

proc delete data=Work._std_;
run;

/** Klaszter observation sprint kp-ra **/

/** Klaszter analizis 2017 sprint **/
ods noproctitle;

proc distance data=TISZA.TISZA17KORRIG stdonly outsdz=Work._Temp_sdz;
	var ratio(uszasido17 futasido17 kerekparido17 / 
		std=maxabs);
run;

proc cluster data=Work._Temp_sdz method=ward plots outtree=work.Cluster_tree;
	var uszasido17 futasido17 kerekparido17;
	id 'Név'n;
run;

proc delete data=Work._Temp_sdz;
run;

/** Lineáris regresszió sprintre**/

/** 2017 sprint  lin.r. számonként**/
ods noproctitle;
ods graphics / imagemap=on;

proc reg data=TISZA.TISZA17KORRIG alpha=0.05 plots(only)=(diagnostics 
		residuals fitplot observedbypredicted);
	model celido17=uszasido17 /;
	model celido17=futasido17 /;
	model celido17=kerekparido17 /;
	run;
quit;

/** 2017 sprint lin.r. egyben **/

ods noproctitle;
ods graphics / imagemap=on;

proc glmselect data=TISZA.TISZA17KORRIG 
		outdesign(addinputvars)=Work.reg_design;
	model celido17=uszasido17*futasido17*kerekparido17 / 
		showpvalues selection=none;
run;

proc reg data=Work.reg_design alpha=0.05 plots(only)=(diagnostics residuals 
		observedbypredicted);
	ods select DiagnosticsPanel ResidualPlot ObservedByPredicted;
	model celido17=&_GLSMOD /;
	run;
quit;

proc delete data=Work.reg_design;
run;



/** -------------------------2017--------------------**/






/** Import files.  2018-es adatok beolvasása **/

PROC IMPORT DATAFILE="/home/u57916769/tisza/2018no.xlsx"
		    OUT=tisza.tisza18
		    DBMS=XLSX
		    REPLACE;
RUN;
PROC PRINT DATA=tisza.tisza18; RUN;

/** Sorok tisztítása törléssel 2018**/

data tisza.tisza18;
set tisza.tisza18jo;
if (Úszás ne "-") or (Kerékpár ne "-") or (Futás ne "-") or (Célidő ne "-") or (Hely ne ".")
then output ;
run;

/** Nagybetűvé alakítás minden nevet 2018 **/

data tisza.tisza18;                                                                                                                               
   set tisza.tisza18;                                                                                                                               
   Név=upcase(Név);                                                                                                                    
   put Név=;                                                                                                                             
run; 

/** Időkorrigálás 2018 **/
 
 data tisza.tisza18korrig (keep= Hely18 Név Szülév Úszás Kerékpár Futás Célidő uszasido18 kerekparido18 futasido18 celido18);
set tisza.tisza18;

Hely18 = Hely;
kilences2 = substr(Úszás,1,1);

if kilences2=9 then
	do;
		uperc=substr(Úszás,1,1) ; 
		ump=substr(Úszás,3,2) ; 
        uszasido18= 60*uperc+ump ;
    end;
        
    else do;
        uperc=substr(Úszás,1,2) ; 
		ump=substr(Úszás,4,2) ; 
        uszasido18= 60*uperc+ump ;
    end;
            
		kperc=substr(Kerékpár,1,2) ; 
		kmp=substr(Kerékpár,4,2) ; 
        kerekparido18= 60*kperc+kmp ;
            
		fperc=substr(Futás,1,2) ; 
		fmp=substr(Futás,4,2) ; 
        futasido18= 60*fperc+fmp ; 
        
        cperc=substr(Célidő,3,2) ; 
		cmp=substr(Célidő,6,2) ; 
        celido18= 3600+60*cperc+cmp ;
          
run ;

/** K-means sprint korcsoportra **/
/**2018 sprint klaszter**/

ods noproctitle;

proc stdize data=TISZA.TISZA18KORRIG out=Work._std_ method=range;
	var uszasido18 futasido18 kerekparido18;
run;

proc fastclus data=Work._std_ maxclusters=5 out=work.Fastclus_scores0001;
	var uszasido18 futasido18 kerekparido18;
run;

proc delete data=Work._std_;
run;

/** Klaszter observation sprint kp-ra **/

/** Klaszter analizis 2018 sprint **/
ods noproctitle;

/*** Standardize variables ***/
proc distance data=TISZA.TISZA18KORRIG stdonly outsdz=Work._Temp_sdz;
	var ratio(uszasido18 futasido18 kerekparido18 / 
		std=maxabs);
run;

proc cluster data=Work._Temp_sdz method=ward plots outtree=work.Cluster_tree;
	var uszasido18 futasido18 kerekparido18;
	id 'Név'n;
run;

proc delete data=Work._Temp_sdz;
run;

/** Lineáris regresszió sprintre**/

/** 2018 sprint  lin.r. számonként**/
ods noproctitle;
ods graphics / imagemap=on;

proc reg data=TISZA.TISZA18KORRIG alpha=0.05 plots(only)=(diagnostics 
		residuals fitplot observedbypredicted);
	model celido18=uszasido18 /;
	model celido18=futasido18 /;
	model celido18=kerekparido18 /;
	run;
quit;

/** 2018 sprint lin.r. egyben **/

ods noproctitle;
ods graphics / imagemap=on;

proc glmselect data=TISZA.TISZA18KORRIG 
		outdesign(addinputvars)=Work.reg_design;
	model celido18=uszasido18*futasido18*kerekparido18 / 
		showpvalues selection=none;
run;

proc reg data=Work.reg_design alpha=0.05 plots(only)=(diagnostics residuals 
		observedbypredicted);
	ods select DiagnosticsPanel ResidualPlot ObservedByPredicted;
	model celido18=&_GLSMOD /;
	run;
quit;

proc delete data=Work.reg_design;
run;



/** -------------------------2018--------------------**/






/** Import files. 2019-es adatok beolvasása **/

PROC IMPORT DATAFILE="/home/u57916769/tisza/2019no.xlsx"
		    OUT=tisza.tisza19
		    DBMS=XLSX
		    REPLACE;
RUN;
PROC PRINT DATA=tisza.tisza19; RUN;

/**  Sorok tisztítása törléssel  2019 **/

data tisza.tisza19;
set tisza.tisza19;
if (Úszás ne "-") or (Kerékpár ne "-") or (Futás ne "-") or (Célidő ne "-") or (Hely ne ".")
then output ;
run;


/** Nagybetűvé alakítás minden nevet 2019 **/

data tisza.tisza19;                                                                                                                               
   set tisza.tisza19;                                                                                                                               
   Név=upcase(Név);                                                                                                                    
   put Név=;                                                                                                                             
run; 


/** Időkorrigálás 2019 **/

data tisza.tisza19korrig (keep= Hely19 Név Szülév Úszás Kerékpár Futás Célidő uszasido19 kerekparido19 futasido19 celido19);
set tisza.tisza19;

Hely19 = Hely;

kilences3 = substr(Úszás,1,1);

if kilences3=9 then
	do;
		uperc=substr(Úszás,1,1) ; 
		ump=substr(Úszás,3,2) ; 
        uszasido19= 60*uperc+ump ;
    end;
        
    else do;
        uperc=substr(Úszás,1,2) ; 
		ump=substr(Úszás,4,2) ; 
        uszasido19= 60*uperc+ump ;
    end;
            
		kperc=substr(Kerékpár,1,2) ; 
		kmp=substr(Kerékpár,4,2) ; 
        kerekparido19= 60*kperc+kmp ;
            
		fperc=substr(Futás,1,2) ; 
		fmp=substr(Futás,4,2) ; 
        futasido19= 60*fperc+fmp ; 
        
        cperc=substr(Célidő,3,2) ; 
		cmp=substr(Célidő,6,2) ; 
        celido19= 3600+60*cperc+cmp ;
          
run ;

/** K-means sprint korcsoportra **/
/**2019 sprint klaszter**/

ods noproctitle;

proc stdize data=TISZA.TISZA19KORRIG out=Work._std_ method=range;
	var uszasido19 futasido19 kerekparido19;
run;

proc fastclus data=Work._std_ maxclusters=5 out=work.Fastclus_scores0001;
	var uszasido19 futasido19 kerekparido19;
run;

proc delete data=Work._std_;
run;

/** Klaszter observation sprint kp-ra **/

/** Klaszter analizis 2019 sprint **/                                                                            
ods noproctitle;

/*** Standardize variables ***/
proc distance data=TISZA.TISZA19KORRIG stdonly outsdz=Work._Temp_sdz;
	var ratio(uszasido19 futasido19 kerekparido19 / 
		std=maxabs);
run;

proc cluster data=Work._Temp_sdz method=ward plots outtree=work.Cluster_tree;
	var uszasido19 futasido19 kerekparido19;
	id 'Név'n;
run;

proc delete data=Work._Temp_sdz;
run;

/** Lineáris regresszió sprintre**/

/** 2019 sprint  lin.r. számonként**/
ods noproctitle;
ods graphics / imagemap=on;

proc reg data=TISZA.TISZA19KORRIG alpha=0.05 plots(only)=(diagnostics 
		residuals fitplot observedbypredicted);
	model celido19=uszasido19 /;
	model celido19=futasido19 /;
	model celido19=kerekparido19 /;
	run;
quit;

/** 2019 sprint lin.r. egyben **/

ods noproctitle;
ods graphics / imagemap=on;

proc glmselect data=TISZA.TISZA19KORRIG 
		outdesign(addinputvars)=Work.reg_design;
	model celido19=uszasido19*futasido19*kerekparido19 / 
		showpvalues selection=none;
run;

proc reg data=Work.reg_design alpha=0.05 plots(only)=(diagnostics residuals 
		observedbypredicted);
	ods select DiagnosticsPanel ResidualPlot ObservedByPredicted;
	model celido19=&_GLSMOD /;
	run;
quit;

proc delete data=Work.reg_design;
run;


/** -------------------------- 2019-------------------------**/




/** Import files.  2020-es adatok beolvasása **/


PROC IMPORT DATAFILE="/home/u57916769/tisza/2020no.xlsx"
		    OUT=tisza.tisza20
		    DBMS=XLSX
		    REPLACE;
RUN;
PROC PRINT DATA=tisza.tisza20; RUN;


/**  Sorok tisztítása törléssel  2020 **/

data tisza.tisza20;
set tisza.tisza20;
if (Hely ne ".")
then output;
run;


/** Nagybetűvé alakítás minden nevet 2020 **/

data tisza.tisza20;                                                                                                                               
   set tisza.tisza20;                                                                                                                               
   Név=upcase(Név);                                                                                                                    
   put Név=;                                                                                                                             
run; 


/** Időkorrigálás 2020 **/

data tisza.tisza20korrig (keep=Hely Név Szülév Úszás Kerékpár Futás Célidő uszasido20 kerekparido20 futasido20 celido20);
set tisza.tisza20;

kilences4 = substr(Úszás,1,1);
oraalatt = substr(Célidő,1,1);

if kilences4=9 then
	do;
		uperc=substr(Úszás,1,1) ; 
		ump=substr(Úszás,3,2) ; 
        uszasido20= 60*uperc+ump ;
    end;
        
    else do;
        uperc=substr(Úszás,1,2) ; 
		ump=substr(Úszás,4,2) ; 
        uszasido20= 60*uperc+ump ;
    end;
            
		kperc=substr(Kerékpár,1,2) ; 
		kmp=substr(Kerékpár,4,2) ; 
        kerekparido20= 60*kperc+kmp ;
            
		fperc=substr(Futás,1,2) ; 
		fmp=substr(Futás,4,2) ; 
        futasido20= 60*fperc+fmp ; 
        
if oraalatt=5 then
		do;
        cperc=substr(Célidő,1,2) ; 
		cmp=substr(Célidő,4,2) ; 
        celido20= 60*cperc+cmp ;	
        end;
        
        else do;
        cperc=substr(Célidő,3,2) ; 
		cmp=substr(Célidő,6,2) ; 
        celido20= 3600+60*cperc+cmp ;
          end;
          
run ;

/** K-means sprint korcsoportra **/
/**2020 sprint klaszter**/

ods noproctitle;

proc stdize data=TISZA.TISZA20KORRIG out=Work._std_ method=range;
	var uszasido20 futasido20 kerekparido20;
run;

proc fastclus data=Work._std_ maxclusters=5 out=work.Fastclus_scores0001;
	var uszasido20 futasido20 kerekparido20;
run;

proc delete data=Work._std_;
run;

/** Klaszter observation sprint kp-ra **/

/** Klaszter analizis 2020 sprint **/
ods noproctitle;

/*** Standardize variables ***/
proc distance data=TISZA.TISZA20KORRIG stdonly outsdz=Work._Temp_sdz;
	var ratio(uszasido20 futasido20 kerekparido20 / 
		std=maxabs);
run;

proc cluster data=Work._Temp_sdz method=ward plots outtree=work.Cluster_tree;
	var uszasido20 futasido20 kerekparido20;
	id 'Név'n;
run;

proc delete data=Work._Temp_sdz;
run;

/** Lineáris regresszió sprintre**/

/** 2020 sprint  lin.r. számonként**/
ods noproctitle;
ods graphics / imagemap=on;

proc reg data=TISZA.TISZA20KORRIG alpha=0.05 plots(only)=(diagnostics 
		residuals fitplot observedbypredicted);
	model celido20=uszasido20 /;
	model celido20=futasido20 /;
	model celido20=kerekparido20 /;
	run;
quit;

/** 2020 sprint lin.r. egyben **/

ods noproctitle;
ods graphics / imagemap=on;

proc glmselect data=TISZA.TISZA20KORRIG 
		outdesign(addinputvars)=Work.reg_design;
	model celido20=uszasido20*futasido20*kerekparido20 / 
		showpvalues selection=none;
run;

proc reg data=Work.reg_design alpha=0.05 plots(only)=(diagnostics residuals 
		observedbypredicted);
	ods select DiagnosticsPanel ResidualPlot ObservedByPredicted;
	model celido20=&_GLSMOD /;
	run;
quit;

proc delete data=Work.reg_design;
run;


/** --------------------------------2020--------------------------------**/






/** Import files. 2021-es adatok beolvasása **/

PROC IMPORT DATAFILE="/home/u57916769/tisza/2021no.xlsx"
		    OUT=tisza.tisza21
		    DBMS=XLSX
		    REPLACE;
RUN;
PROC PRINT DATA=tisza.tisza21; RUN;


/** Sorok tisztítása törléssel 2021 **/

data tisza.tisza20;
set tisza.tisza20;
if (Úszás ne "-") or (Kerékpár ne "-") or (Futás ne "-") or (Célidő ne "-") or (Hely ne ".")
then output ;
run;


/** Nagybetűvé alakítás minden nevet 2021 **/

data tisza.tisza21;                                                                                                                               
   set tisza.tisza21;                                                                                                                               
   Név=upcase(Név);                                                                                                                    
   put Név=;                                                                                                                             
run; 


/** Időkorrigálás 2021 **/

data tisza.tisza21korrig (keep=Hely Név Szülév Úszás Kerékpár Futás Célidő uszasido21 kerekparido21 futasido21 celido21);
set tisza.tisza21;

kilences5 = substr(Úszás,1,1);

if kilences5=9 then
	do;
		uperc=substr(Úszás,1,1) ; 
		ump=substr(Úszás,3,2) ; 
        uszasido21= 60*uperc+ump ;
    end;
        
    else do;
        uperc=substr(Úszás,1,2) ; 
		ump=substr(Úszás,4,2) ; 
        uszasido21= 60*uperc+ump ;
    end;
            
		kperc=substr(Kerékpár,1,2) ; 
		kmp=substr(Kerékpár,4,2) ; 
        kerekparido21= 60*kperc+kmp ;
            
		fperc=substr(Futás,1,2) ; 
		fmp=substr(Futás,4,2) ; 
        futasido21= 60*fperc+fmp ; 
        
        cperc=substr(Célidő,3,2) ; 
		cmp=substr(Célidő,6,2) ; 
        celido21= 3600+60*cperc+cmp ;
          
run ;

/** K-means sprint korcsoportra **/
/**2021 sprint klaszter**/

ods noproctitle;

proc stdize data=TISZA.TISZA21KORRIG out=Work._std_ method=range;
	var uszasido21 futasido21 kerekparido21;
run;

proc fastclus data=Work._std_ maxclusters=5 out=work.Fastclus_scores0001;
	var uszasido21 futasido21 kerekparido21;
run;

proc delete data=Work._std_;
run;

/** Klaszter observation sprint kp-ra **/

/** Klaszter analizis 2021 sprint **/
ods noproctitle;

/*** Standardize variables ***/
proc distance data=TISZA.TISZA21KORRIG stdonly outsdz=Work._Temp_sdz;
	var ratio(uszasido21 futasido21 kerekparido21 / 
		std=maxabs);
run;

proc cluster data=Work._Temp_sdz method=ward plots outtree=work.Cluster_tree;
	var uszasido21 futasido21 kerekparido21;
	id 'Név'n;
run;

proc delete data=Work._Temp_sdz;
run;

/** Lineáris regresszió sprintre**/

/** 2121 sprint  lin.r. számonként**/
ods noproctitle;
ods graphics / imagemap=on;

proc reg data=TISZA.TISZA21KORRIG alpha=0.05 plots(only)=(diagnostics 
		residuals fitplot observedbypredicted);
	model celido21=uszasido21 /;
	model celido21=futasido21 /;
	model celido21=kerekparido21 /;
	run;
quit;

/** 2021 sprint lin.r. egyben **/

ods noproctitle;
ods graphics / imagemap=on;

proc glmselect data=TISZA.TISZA21KORRIG 
		outdesign(addinputvars)=Work.reg_design;
	model celido21=uszasido21*futasido21*kerekparido21 / 
		showpvalues selection=none;
run;

proc reg data=Work.reg_design alpha=0.05 plots(only)=(diagnostics residuals 
		observedbypredicted);
	ods select DiagnosticsPanel ResidualPlot ObservedByPredicted;
	model celido21=&_GLSMOD /;
	run;
quit;

proc delete data=Work.reg_design;
run;


/** ----------------------2021--------------------------------**/



/** -----------------------------------------------------------**/
/** proc means használata minden állományra

/** 2017 sprint**/

  PROC SORT Data=tisza.tisza17korrig
    out=tisza.tisza17mean;
   BY Célidő;
  RUN;
  
/** 2018 sprint**/

  PROC SORT Data=tisza.tisza18korrig
    out=tisza.tisza18mean;
   BY Célidő;
  RUN;
  
/** 2019 sprint**/
  
  PROC SORT Data=tisza.tisza19korrig
    out=tisza.tisza19mean;
   BY Célidő;
  RUN;
  
/** 2020 sprint**/

  PROC SORT Data=tisza.tisza20korrig
    out=tisza.tisza20mean;
   BY Célidő;
  RUN;
  
/** 2021 sprint**/
  
  PROC SORT Data=tisza.tisza21korrig
    out=tisza.tisza21mean;
   BY Célidő;
  RUN;
  


/** 2016 gyermek**/

  PROC means Data=tisza.tiszagyermek16korrig;
  RUN;

/** 2017 gyermek**/

  PROC means Data=tisza.tiszagyermek17korrig;
  RUN;
  
/** 2018 gyermek**/
  
  PROC means Data=tisza.tiszagyermek18korrig;
  RUN;
  
  /** 2018 serdulo**/
  
  PROC means Data=tisza.tiszaserdulo18korrig;
  RUN;
  
  
/** 2019 serdulo**/
  
  PROC means Data=tisza.tiszaserdulo19korrig;
  RUN;
  
/** 2020 serdulo**/
  
  PROC means Data=tisza.tiszaserdulo20korrig;
  RUN;
  
/** 2017 sprint**/

  PROC means Data=tisza.tisza17korrig;
  RUN;
  
/** 2018 sprint**/

  PROC means Data=tisza.tisza18korrig;
  RUN;
  
/** 2019 sprint**/
  
  PROC means Data=tisza.tisza19korrig;
  RUN;
  
/** 2020 sprint**/

  PROC means Data=tisza.tisza20korrig;
  RUN;
  
/** 2021 sprint**/
  
  PROC means Data=tisza.tisza21korrig;
  RUN;
  
  
  


/** Összekapcsolás nevek alapján - eloszor minden fajl Név szerinti rendezese **/

/** 2016 gyermek**/

  PROC SORT Data=tisza.tiszagyermek16korrig (keep=Név Helygyermek16 uszasidogyermek16 futasidogyermek16 kerekparidogyermek16 celidogyermek16)
  out=tisza.tiszagyermek16rendezett;
   BY Név;
  RUN;

/** 2017 gyermek**/

  PROC SORT Data=tisza.tiszagyermek17korrig(keep=Név Helygyermek17 uszasidogyermek17 futasidogyermek17 kerekparidogyermek17 celidogyermek17)
    out=tisza.tiszagyermek17rendezett;
   BY Név;
  RUN;
  
/** 2018 gyermek**/
  
  PROC SORT Data=tisza.tiszagyermek18korrig
    out=tisza.tiszagyermek18rendezett;
   BY Név;
  RUN;
  
  /** 2018 serdulo**/
  
  PROC SORT Data=tisza.tiszaserdulo18korrig
    out=tisza.tiszaserdulo18rendezett;
   BY Név;
  RUN;
  
  
/** 2019 serdulo**/
  
  PROC SORT Data=tisza.tiszaserdulo19korrig
    out=tisza.tiszaserdulo19rendezett;
   BY Név;
  RUN;
  
/** 2020 serdulo**/
  
  PROC SORT Data=tisza.tiszaserdulo20korrig
    out=tisza.tiszaserdulo20rendezett;
   BY Név;
  RUN;
  
/** 2017 sprint**/

  PROC SORT Data=tisza.tisza17korrig
    out=tisza.tisza17rendezett;
   BY Név;
  RUN;
  
/** 2018 sprint**/

  PROC SORT Data=tisza.tisza18korrig
    out=tisza.tisza18rendezett;
   BY Név;
  RUN;
  
/** 2019 sprint**/
  
  PROC SORT Data=tisza.tisza19korrig
    out=tisza.tisza19rendezett;
   BY Név;
  RUN;
  
/** 2020 sprint**/

  PROC SORT Data=tisza.tisza20korrig
    out=tisza.tisza20rendezett;
   BY Név;
  RUN;
  
/** 2021 sprint**/
  
  PROC SORT Data=tisza.tisza21korrig
    out=tisza.tisza21rendezett;
   BY Név;
  RUN;
  
  
  
  
/** Magyar versenyzők eredménye az európa kupán **/  
/** Külföldi versenyek importálása **/

/** 2017-es év k verseny importálása **/
PROC IMPORT DATAFILE="/home/u57916769/tisza/juniorwcup17.xlsx"
		    OUT=tisza.juniorwcup17
		    DBMS=XLSX
		    REPLACE;
RUN;
PROC PRINT DATA=tisza.juniorwcup17; RUN;  

/** 2019-es év k verseny importálása **/
PROC IMPORT DATAFILE="/home/u57916769/tisza/juniorwcup19.xlsx"
		    OUT=tisza.juniorwcup19
		    DBMS=XLSX
		    REPLACE;
RUN;
PROC PRINT DATA=tisza.juniorwcup19; RUN;  

/** 2021-es év k verseny importálása **/
PROC IMPORT DATAFILE="/home/u57916769/tisza/juniorwcup21.xlsx"
		    OUT=tisza.juniorwcup21
		    DBMS=XLSX
		    REPLACE;
RUN;
PROC PRINT DATA=tisza.juniorwcup21; RUN;  

/** Tisztitas **/

/** 2017 europa kupa nagybetuve alakitas **/

data tisza.juniorwcup17;                                                                                                                               
   set tisza.juniorwcup17;                                                                                                                               
   Név=upcase(Név);                                                                                                                    
   put Név=;                                                                                                                             
run; 

/** idokorrigalas**/

/** 2017-es idokorrigalas euk **/

data tisza.juniorwcup17korrig (keep= Helyjcup17 Név uszasjcup17 kerekparjcup17 futasjcup17 celidojcup17);
set tisza.juniorwcup17;

	Helyjcup17 = Hely;

	uperc=substr(Swim,1,1) ; 
	ump=substr(Swim,3,2) ; 
    uszasjcup17= 60*uperc+ump ; 

	fperc=substr(Run,1,2) ; 
	fmp=substr(Run,4,2) ; 
    futasjcup17= 60*fperc+fmp ;
        
	kperc=substr(Bike,1,2) ; 
	kmp=substr(Bike,4,2) ; 
    kerekparjcup17= 60*kperc+kmp ;
    
    cperc=substr(Célidő,1,2) ; 
	cmp=substr(Célidő,4,2) ; 
    celidojcup17= 60*cperc+cmp ;
          
run ;

/** rendezes **/

  PROC SORT Data=tisza.juniorwcup17korrig
    out=tisza.juniorwcup17rendezett;
   BY Név;
  RUN;
  
 data tisza.tiszajunioruj (drop=Név);
	
	length Nev $17;
	set tisza.juniorwcup17rendezett;
	Nev = Név;
run;

/** átlagok orsz. **/
ods graphics / reset width=6.4in height=4.8in imagemap;

proc sgplot data=TISZA.JUNIORWCUP17;
	vbar 'Ország'n /;
	yaxis grid;
run;

ods graphics / reset;


/** Külföldi versenyek importálása **/

/** 2018-es év k verseny importálása **/
PROC IMPORT DATAFILE="/home/u57916769/tisza/juniorwcup18.xlsx"
		    OUT=tisza.juniorwcup18
		    DBMS=XLSX
		    REPLACE;
RUN;
PROC PRINT DATA=tisza.juniorwcup18; RUN;  

/** Tisztitas **/

/** 2018 europa kupa nagybetuve alakitas **/

data tisza.juniorwcup18;                                                                                                                               
   set tisza.juniorwcup18;                                                                                                                               
   Név=upcase(Név);                                                                                                                    
   put Név=;                                                                                                                             
run; 

/** idokorrigalas**/

/** 2018-es idokorrigalas euk **/

data tisza.juniorwcup18korrig (keep= Helyjcup18 Név uszasjcup18 kerekparjcup18 futasjcup18 celidojcup18);
set tisza.juniorwcup18;

	Helyjcup18 = Hely;

	uperc=substr(Swim,1,1) ; 
	ump=substr(Swim,3,2) ; 
    uszasjcup18= 60*uperc+ump ; 

	fperc=substr(Run,1,2) ; 
	fmp=substr(Run,4,2) ; 
    futasjcup18= 60*fperc+fmp ;
        
	kperc=substr(Bike,1,2) ; 
	kmp=substr(Bike,4,2) ; 
    kerekparjcup18= 60*kperc+kmp ;
    
    cperc=substr(Célidő,1,2) ; 
	cmp=substr(Célidő,4,2) ; 
    celidojcup18= 60*cperc+cmp ;
          
run ;

/** rendezes **/

  PROC SORT Data=tisza.juniorwcup18korrig
    out=tisza.juniorwcup18rendezett;
   BY Név;
  RUN;


/** Mergelni a magyar versenyt a külföldivel **/


DATA tisza.europak18 (keep= Név Hely18 Helyjcup18 uszasido18 uszasjcup18 futasido18 futasjcup18 kerekparido18 kerekparjcup18);
	merge tisza.tisza18rendezett (in=a)
	tisza.juniorwcup18rendezett (in=b);
	by Név;
	if(a=b);
run;


/** átlagok orsz. **/
ods graphics / reset width=6.4in height=4.8in imagemap;

proc sgplot data=TISZA.JUNIORWCUP18;
	vbar 'Ország'n /;
	yaxis grid;
run;

ods graphics / reset;

/** átlagok orsz. **/
ods graphics / reset width=6.4in height=4.8in imagemap;

proc sgplot data=TISZA.JUNIORWCUP19;
	vbar 'Ország'n /;
	yaxis grid;
run;

ods graphics / reset;

/** átlagok orsz. **/
ods graphics / reset width=6.4in height=4.8in imagemap;

proc sgplot data=TISZA.JUNIORWCUP21;
	vbar 'Ország'n /;
	yaxis grid;
run;

ods graphics / reset;



/**----------------Úszásidők évről évre------------------**/

/** gyermek idok 2016-2017**/

DATA tisza.uszasgyermek1617 (keep=Név uszasidogyermek16 uszasidogyermek17 );
	merge tisza.tiszagyermek16rendezett (in=a)
	tisza.tiszagyermek17rendezett (in=b);
	by Név;
	if(a=b);
run;

/** gyermek idok 2017-2018**/

DATA tisza.uszasgyermek1718 (keep=Név uszasidogyermek17 uszasidogyermek18);
	merge tisza.tiszagyermek17jo (in=a)
	tisza.tiszagyermek18jo (in=b);
	by Név;
	if(a=b);
run;

/** gyermek-serdulo idok serdulo2018**/

DATA tisza.uszasgyermekserdulo18ig (keep=Név uszasidogyermek16 uszasidogyermek17 uszasidoserdulo18);
	merge tisza.uszasgyermek1617 (in=a)
	tisza.tiszaserdulo18rendezett (in=b);
	by Név;
	if(a=b);
run;

/** gyermek-serdulo idok serdulo2019**/

DATA tisza.uszasgyermekserdulo19ig (keep=Név uszasidogyermek16 uszasidogyermek17 uszasidoserdulo18 uszasidoserdulo19);
	merge tisza.uszasgyermekserdulo18ig (in=a)
	tisza.tiszaserdulo19rendezett (in=b);
	by Név;
	if(a=b);
run;

/** gyermek-serdulo idok serdulo2020**/

DATA tisza.uszasgyermekserdulo20ig (keep=Név uszasidogyermek17 uszasidogyermek18 uszasidoserdulo19 uszasidoserdulo20);
	merge tisza.uszasgyermekserdulo19ig (in=a)
	tisza.tiszaserdulo20rendezett (in=b);
	by Név;
	if(a=b);
run;

/** gyermek-serdulo idok sprint2020**/

DATA tisza.uszasevrolevre20 (keep=Név uszasidogyermek16 uszasidogyermek17 uszasidoserdulo18 uszasidoserdulo19 uszasido20);
	merge tisza.uszasgyermekserdulo19ig (in=a)
	tisza.tisza20rendezett (in=b);
	by Név;
	if(a=b);
run;

/** gyermek-serdulo idok sprint2021**/

DATA tisza.uszasevrolevre21 (keep=Név uszasidogyermek16 uszasidogyermek17 uszasidoserdulo18 uszasidoserdulo19 uszasido20 uszasido21);
	merge tisza.uszasevrolevre20 (in=a)
	tisza.tisza21rendezett (in=b);
	by Név;
	if(a=b);
run;

/** Táv emelkedése esetén elvárt idő/ teljesítette-e**/
/** gyermekrol serdulore valtas idok serdulo2019 (3-al valo osztas és 5-el valo szorzas mert: gyermek uszas táva 300m, serudlo: 500m)**/

DATA tisza.uszasgyermekserduloelvart18ig (keep=Név uszasidogyermek16 uszasidogyermek17 uszasidoelvartserdulo2018 uszasidoserdulo18);
	merge tisza.uszasgyermek1617 (in=a)
	tisza.tiszaserdulo18rendezett (in=b);
	by Név;
	if(a=b);
	
	uszasidoelvartserdulo2018 = (uszasidogyermek17/3*5);
run;

/** serdulorol sprintre valtas idok sprint2021 (5-al valo osztas és 7,5-el valo szorzas mert: gyermek uszas táva 500m, serudlo: 750m)**/

DATA tisza.uszasserdulosprintelvart20ig (keep=Név uszasidoserdulo19 uszasido20 uszasidoelvartsprint2020);
	merge tisza.uszasgyermekserdulo19ig (in=a)
	tisza.tisza20rendezett (in=b);
	by Név;
	if(a=b);
	
	uszasidoelvartsprint2020 = (uszasidoserdulo19/5*7.5);
run;

/**                 KÉSZ                             **/
/** -------------------------------------------------**/
/** TODO:     UGYANEZT FUTASSAL ES KEREKPARRAL       **/

DATA tisza.uszas (keep=Név uszasido17 uszasido18);
	merge tisza.tisza17jo (in=a)
	tisza.tisza18jo (in=b);
	by Név;
	if(a=b);
run;

DATA tisza.uszas (keep=Név uszasido17 uszasido18 uszasido19);
	merge tisza.uszas (in=a)
	tisza.tisza19jo (in=b);
	by Név;
	if(a=b);
run;

DATA tisza.uszas (keep=Név uszasido17 uszasido18 uszasido19 uszasido20);
	merge tisza.uszas (in=a)
	tisza.tisza20jo (in=b);
	by Név;
	if(a=b);
run;

DATA tisza.uszas (keep=Név uszasido17 uszasido18 uszasido19 uszasido20 uszasido21);
	merge tisza.uszas (in=a)
	tisza.tisza21jo (in=b);
	by Név;
	if(a=b);
run;

/**----------------Kerékpáridők évről évre------------------**/

DATA tisza.kerekpar (keep=Név kerekparido17 kerekparido18);
	merge tisza.tisza17rendezett (in=a)
	tisza.tisza18jo (in=b);
	by Név;
	if(a=b);
run;

DATA tisza.kerekpar (keep=Név kerekparido17 kerekparido18 kerekparido19);
	merge tisza.kerekpar (in=a)
	tisza.tisza19jo (in=b);
	by Név;
	if(a=b);
run;

DATA tisza.kerekpar (keep=Név kerekparido17 kerekparido18 kerekparido19 kerekparido20);
	merge tisza.kerekpar (in=a)
	tisza.tisza20jo (in=b);
	by Név;
	if(a=b);
run;

DATA tisza.kerekpar (keep=Név kerekparido17 kerekparido18 kerekparido19 kerekparido20 kerekparido21);
	merge tisza.kerekpar (in=a)
	tisza.tisza21jo (in=b);
	by Név;
	if(a=b);
run;

/**----------------Futásidők évről évre------------------**/

DATA tisza.futas (keep=Név futasido17 futasido18);
	merge tisza.tisza17jo (in=a)
	tisza.tisza18jo (in=b);
	by Név;
	if(a=b);
run;

DATA tisza.futas (keep=Név futasido17 futasido18 futasido19);
	merge tisza.futas (in=a)
	tisza.tisza19jo (in=b);
	by Név;
	if(a=b);
run;

DATA tisza.futas (keep=Név futasido17 futasido18 futasido19 futasido20);
	merge tisza.futas (in=a)
	tisza.tisza20jo (in=b);
	by Név;
	if(a=b);
run;

DATA tisza.futas (keep=Név futasido17 futasido18 futasido19 futasido20 futasido21);
	merge tisza.futas (in=a)
	tisza.tisza21jo (in=b);
	by Név;
	if(a=b);
run;



/** Születés szerinti rendezés a sprint távon indulókat**/

proc sort data=tisza.tisza17 out=tisza.szulrend17;
by Szülév;
run;

proc sort data=tisza.tisza18 out=tisza.szulrend18;
by Szülév;
run;

proc sort data=tisza.tisza19 out=tisza.szulrend19;
by Szülév;
run;

proc sort data=tisza.tisza20 out=tisza.szulrend20;
by Szülév;
run;

proc sort data=tisza.tisza21 out=tisza.szulrend21;
by Szülév;
run;


/** Grafikon: evek gyakorisaga **/
/** 2017-re **/

ods graphics / reset width=6.4in height=4.8in imagemap;

proc sgplot data=tisza.szulrend17;
	vbar 'Szülév'n /;
	yaxis grid;
run;

ods graphics / reset;

/** 2018-ra **/

ods graphics / reset width=6.4in height=4.8in imagemap;

proc sgplot data=tisza.szulrend18;
	vbar 'Szülév'n /;
	yaxis grid;
run;

ods graphics / reset;

/** 2019-re **/


ods graphics / reset width=6.4in height=4.8in imagemap;

proc sgplot data=tisza.szulrend19;
	vbar 'Szülév'n /;
	yaxis grid;
run;

ods graphics / reset;


/** 2020-re **/


ods graphics / reset width=6.4in height=4.8in imagemap;

proc sgplot data=tisza.szulrend20;
	vbar 'Szülév'n /;
	yaxis grid;
run;

ods graphics / reset;


/** 2021-re **/


ods graphics / reset width=6.4in height=4.8in imagemap;

proc sgplot data=tisza.szulrend21;
	vbar 'Szülév'n /;
	yaxis grid;
run;

ods graphics / reset;

/** legjobb 13 **/

/** 2017 **/

proc freq data=tisza.tisza17uj;
table Szülév uszasido17 kerekparido17 futasido17 celido17;
run;

data tisza.tisza17elsok tisza.tisza17nemelsok;
set tisza.tisza17jo ;
select ;
 when  (Hely <= 13 ) output tisza.tisza17elsok ;
  otherwise output tisza.tisza17nemelsok ;
end ;

run;

proc print data=tisza.tisza17elsok;
run;


/** 2018 **/

proc freq data=tisza.tisza17uj;
table Szülév uszasido17 kerekparido17 futasido17 celido17;
run;

data tisza.tisza17elsok tisza.tisza17nemelsok;
set tisza.tisza17jo ;
select ;
 when  (Hely <= 13 ) output tisza.tisza17elsok ;
  otherwise output tisza.tisza17nemelsok ;
end ;

run;

proc print data=tisza.tisza17elsok;
run;


/** 2019 **/

proc freq data=tisza.tisza17uj;
table Szülév uszasido17 kerekparido17 futasido17 celido17;
run;

data tisza.tisza17elsok tisza.tisza17nemelsok;
set tisza.tisza17 ;
select ;
 when  (Hely <= 13 ) output tisza.tisza17elsok ;
  otherwise output tisza.tisza17nemelsok ;
end ;

run;

proc print data=tisza.tisza17elsok;
run;


/** 2020 **/

proc freq data=tisza.tisza17uj;
table Szülév uszasido17 kerekparido17 futasido17 celido17;
run;

data tisza.tisza17elsok tisza.tisza17nemelsok;
set tisza.tisza17jo ;
select ;
 when  (Hely <= 13 ) output tisza.tisza17elsok ;
  otherwise output tisza.tisza17nemelsok ;
end ;

run;

proc print data=tisza.tisza17elsok;
run;


proc freq data=tisza.tisza21uj;
table Szülév uszasido21 kerekparido21 futasido21 celido21;
run;

data tisza.tisza21elsok tisza.tisza21nemelsok;
set tisza.tisza21jo ;
select ;
 when  (Hely <= 13) output tisza.tisza21elsok ;
  otherwise output tisza.tisza21nemelsok ;
end ;

run;

proc print data=tisza.tisza21elsok;
run;

/** Születési évek pie chartban **/
/* Define Pie template */
proc template;
	define statgraph SASStudio.Pie;
		begingraph;
		layout region;
		piechart category='Szülév'n /;
		endlayout;
		endgraph;
	end;
run;

ods graphics / reset width=6.4in height=4.8in imagemap;

proc sgrender template=SASStudio.Pie data=TISZA.TISZA17JO;
run;

ods graphics / reset;


