#Test met dagboek
install.packages("GGIR",dependencies = TRUE)
library(GGIR)


mode= c(1,2,3,4,5)
datadir= c("~/Data GENEActiv iBerry/Testfolder")    #maak een testfolder voor iBerry
outputdir= c("~/Data GENEActiv iBerry/Outputfolder") #maak een output folder voor iBerry
studyname="test"
f0 = 1
f1 = 2 #defaults number of files available/ number of participants
g.shell.GGIR(#=======================================
             # INPUT NEEDED:
             #-------------------------------
             # General parameters
             #-------------------------------
             mode=mode, #specify above
             datadir=datadir, #specify above
             outputdir=outputdir, #specify above
             studyname=studyname, #specify above
             f0=f0, #specify above
             f1=f1, #specify above
             overwrite = TRUE, #overwrite previous milestone data?
             do.imp=TRUE, # Do imputation? (recommended)
             idloc = 1, #id location (1 = file header, 2 = filename)
             print.filename=TRUE,
             storefolderstructure = FALSE,
             #-------------------------------
             # Part 1 parameters:
             #-------------------------------
             # Key functions: reading file, auto-calibration, and extracting features
             windowsizes = c(5,900,3600), #Epoch length, non-wear detection resolution, non-wear detection evaluation window
             do.cal= TRUE, # Apply autocalibration? (recommended)
             do.enmo = TRUE,#Needed for physical activity analysis
             acc.metric='ENMO', #comment is needed for cut offs Hildebrand et al. 
             do.enmoa = FALSE, #Needed for physical activity analysis
             do.angley=TRUE, #Needed for sleep detection
             do.anglez=TRUE, #Needed for sleep detection
             chunksize=1, #size of data chunks to be read (value = 1 is maximum)
             printsummary=TRUE,
             #-------------------------------
             # Part 2 parameters:
             #-------------------------------
             # Key functions: Non-wear detection, imputation, and basic descriptives
             strategy = 1, #Strategy (see tutorial for explanation)
             ndayswindow=9, #only relevant when strategy = 3
             hrs.del.start = 1, # Only relevant when strategy = 2. How many HOURS need to be ignored at the START of the measurement?
             hrs.del.end = 1, # Only relevant when strategy = 2. How many HOURS need to be ignored at the END of the measurement?
             maxdur = 9, # How many DAYS of measurement do you maximally expect?
             includedaycrit = 16, # number of minimum valid hours in a day to attempt physical activity analysis
             L5M5window = c(0,24), #window over which to calculate L5 and M5
             M5L5res = 10, #resolution in minutes of M5 and L5 calculation
             winhr = c(5,10), # size of M5 and L5 (5 hours by default)
             qlevels = c(c(1380/1440),c(1410/1440)), #quantiles to calculate, set value at c() if you do not want quantiles
             qwindow=c(0,24), #window over which to calculate quantiles
             ilevels = c(seq(0,400,by=50),8000), #acceleration values (metric ENMO) from which a frequency distribution needs to be derived, set value at c() if you do not want quantiles
             mvpathreshold =c(45.8, 93.2, 418.3), #based on recent literature Hildebrand et al 2014 & 2016 (GA wrist adults)
             mvpadur =c(1,5,10), #MVPA (moderate and vigorous physical activity threshold
             bout.metric = 4,
             closedbout=FALSE, 
             #-------------------------------
             # Part 3 parameters:
             #-------------------------------
             # Key functions: Sleep detection
             timethreshold = c(5), #10
             anglethreshold=5,
             ignorenonwear = FALSE, # if TRUE non-wear is not detected as sleep (if FALSE then it will work with imputed data)
             desiredtz = "Europe/Amsterdam", 
              #-------------------------------
              # Part 4 parameters:
              #-------------------------------
              # Key functions: Integrating sleep log (if available) with sleep detection, storing day and person specific summaries of sleep
             excludefirstlast = FALSE, # Exclude first and last night for sleep analysis?
              includenightcrit = 6, # number of minimum valid hours in a day to attempt sleep analysis
              loglocation= "~/Data GENEActiv iBerry/Sleeplog/Slaaplog test.csv", # full directory and name of the log (if available, otherwise leave value as c() )
             def.noc.sleep=c(1), # if the sleeplog is missing, the HDCZA guider is used
             outliers.only = FALSE,
              criterror = 4,
              relyonguider = FALSE, #if FALSE the sleep log is only used to guide the acc based detection
              sleeplogidnum = FALSE, # Is the participant in the sleep log stored as a number (TRUE) or as a character(FALSE)
              colid=1, #colomn in which the participant id or filename is stored
              coln1=2, #column number for first day
              do.visual = TRUE,
              nnights = 9, #number of nights in the sleep log
              #-------------------------------
              # Part 5 parameters:
              #-------------------------------
              save_ms5rawlevels = TRUE,
              # Key functions: Merging physical activity with sleep analyses --> BASE ON LITERATURE 
              threshold.lig = c(30), #40 #threshold(s) for inactivity (can be more than one number)
              threshold.mod = c(100), #100 120 #threshold(s) for moderate activity (can be more than one number)
              threshold.vig = c(400), #500 #threshold(s) for vigorous activity (can be more than one number)
              excludefirstlast = FALSE,
              boutcriter = 0.8,
              boutcriter.in = 0.9, #0.8 #fraction of an inactivity bout that needs to be below the threshold (needs to be 1 number)
              boutcriter.lig = 0.8, #fraction of an light activity bout that needs to be between the thresholds (needs to be 1 number)
              boutcriter.mvpa = 0.8, #fraction of an light activity bout that needs to be above the threshold (needs to be 1 number)
              boutdur.in = c(10,20,30), # duration of bouts to be calculated (default value)
              boutdur.lig = c(1,5,10), # duration of bouts to be calculated (default value)
              boutdur.mvpa = c(1,5,10), # duration of bouts to be calculated (default value)
              timewindow = c("WW","MM"), 
              #-----------------------------------
              # Report generation
              #-------------------------------
              # Key functions: Generating reports based on meta-data
              do.report=c(2,4,5), #for what parts does and report need to be generated? (option: 2, 4 and 5)
              visualreport=FALSE
             )