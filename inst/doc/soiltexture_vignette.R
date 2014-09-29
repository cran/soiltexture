### R code from vignette source 'soiltexture_vignette.Rnw'

###################################################
### code chunk number 1: soiltexture_vignette.Rnw:99-121
###################################################
# Set a few Sweave options:
options( 
    width       = 65,  # width of R output
    prompt      = " ", # Sign preceding R input in R-GUI
    continue    = " "  # same, but after 2nd line
)   # 

# The working directory:
# setwd("C:/_RTOOLS/SWEAVE_WORK/SOIL_TEXTURES/rforge/pkg/soiltexture/inst/doc/INOUT") 

# And load the xtable package:
if( !"xtable" %in% .packages(all.available = TRUE) )
{   #
    message( paste( sep = "", 
        "The xtable package is not present in your R install:\n", 
        "R will now try to connect to one package server\n", 
        "and propose you a list of package to download\n", 
        "and install: Choose 'xtable' from the list"
    )   )   #
    utils:::menuInstallPkgs() 
}   #
require( "xtable" ) 


###################################################
### code chunk number 2: soiltexture_vignette.Rnw:140-161
###################################################
old.wd  <- getwd() 

# setwd("C:/_RTOOLS/SWEAVE_WORK/SOIL_TEXTURES/rforge/pkg/soiltexture/inst/doc/INOUT") 

if( !("soiltexture" %in%  as.character( installed.packages()[,1] )) ) 
{   #
    suppressMessages( 
        install.packages( 
            pkgs  = "soiltexture"  
            # repos = "http://R-Forge.R-project.org" 
        )   #
    )   #
}   #

require( 
    package        = "soiltexture", 
    character.only = TRUE, 
    quietly        = TRUE 
)   #

# setwd(old.wd) 


###################################################
### code chunk number 3: COVERFIG
###################################################
TT.plot(class.p.bg.col=T,class.sys="USDA.TT",main=NA)


###################################################
### code chunk number 4: soiltexture_vignette.Rnw:375-415
###################################################
bornes <- c(0,2,20,50,200,2e3,20e3)
noms   <- c("Cl","FiSi","CoSi","FiSa","CoSa","Gr","St")
txt.b  <- expression( 0*mu*m, 2*mu*m, 20*mu*m, 50*mu*m, 200*mu*m, 2*'mm', 2*'cm')

tmp <- data.frame(bornes,noms) # ,txt.b
#tmp$"txt.b" <- as.character(tmp$"txt.b")

par(  "mar"=c(4,1,1,1)+0.1  )  #  c(bottom, left, top, right)

plot( 
	x		= tmp$"bornes"[-1],  
	y		= rep(1,dim(tmp[-1,])[1]),  
	type	= "n",  
	main	= "",  
	xlab	= "Soil particule sizes",  
	ylab	= "",  
	yaxt	= "n",  xaxt = "n",  
	log		= "x",  
	xlim	= c(0.2,75e3), 
	bty		= "n", 
	cex.lab = 2  
)	#

abline(v=tmp$"bornes",lty=3,lwd=c(2,4,2,4,2,4,2))
abline(h=par("usr")[3:4],lty=1,lwd=4)

mtext( 
    text    = txt.b[-1], 
    side    = 1, 
    line    = rep( 
        c(0.5,1.25), 
        (dim(tmp)[1]-1)/2
    ),  #
    at  = tmp$"bornes"[-1], 
    cex = 2  
)   #

xtxt <- (tmp$"bornes"[1:(length(tmp$"bornes"))]+c(tmp$"bornes"[2:length(tmp$"bornes")],75e3))/2

text(x=xtxt,y=rep(1,length(xtxt)),labels=tmp$"noms",cex=2) 


###################################################
### code chunk number 5: soiltexture_vignette.Rnw:504-513
###################################################
TT.plot( 
    class.sys   = "none", 
    tri.data    = data.frame( 
        "CLAY"  = 45, 
        "SILT"  = 38, 
        "SAND"  = 17 
    ),  #
    main        = NA  
)   #


###################################################
### code chunk number 6: soiltexture_vignette.Rnw:551-560
###################################################
TT.plot( 
    class.sys   = "HYPRES.TT", 
    tri.data    = data.frame( 
        "CLAY"  = 45, 
        "SILT"  = 38, 
        "SAND"  = 17 
    ),  
    main        = NA  
)   


###################################################
### code chunk number 7: soiltexture_vignette.Rnw:565-566
###################################################
library( "xtable" ) 


###################################################
### code chunk number 8: soiltexture_vignette.Rnw:569-575
###################################################
tex.tbl <- TT.classes.tbl( class.sys = "HYPRES.TT" ) 
xtable( 
    x       = tex.tbl[,-3],  #
    caption = "Texture classes of the European system / triangle", 
    label   = NULL  
)   #


###################################################
### code chunk number 9: soiltexture_vignette.Rnw:648-649 (eval = FALSE)
###################################################
## install.packages( pkgs = "soiltexture" ) 


###################################################
### code chunk number 10: soiltexture_vignette.Rnw:658-662 (eval = FALSE)
###################################################
## install.packages( 
##     pkgs  = "soiltexture", 
##     repos = "http://R-Forge.R-project.org" 
## )   #


###################################################
### code chunk number 11: soiltexture_vignette.Rnw:669-670
###################################################
require( soiltexture ) 


###################################################
### code chunk number 12: soiltexture_vignette.Rnw:678-680 (eval = FALSE)
###################################################
## detach( package:soiltexture ) 
## remove.packages( "soiltexture" ) 


###################################################
### code chunk number 13: soiltexture_vignette.Rnw:779-780
###################################################
TT.plot( class.sys = "none" ) 


###################################################
### code chunk number 14: soiltexture_vignette.Rnw:805-806
###################################################
TT.plot( class.sys = "USDA.TT" ) 


###################################################
### code chunk number 15: soiltexture_vignette.Rnw:820-826
###################################################
tex.tbl <- TT.classes.tbl( class.sys = "USDA.TT" ) 
xtable( 
    x       = tex.tbl[,-3],  #
    caption = "Texture classes of the USDA system / triangle", 
    label   = NULL  
)   #


###################################################
### code chunk number 16: soiltexture_vignette.Rnw:844-845
###################################################
TT.plot( class.sys = "USDA1911" ) 


###################################################
### code chunk number 17: soiltexture_vignette.Rnw:859-865
###################################################
tex.tbl <- TT.classes.tbl( class.sys = "USDA1911" ) 
xtable( 
    x       = tex.tbl[, -3 ],  #
    caption = "Texture classes of the Whitney 1911 system / triangle", 
    label   = NULL  
)   #


###################################################
### code chunk number 18: soiltexture_vignette.Rnw:894-895
###################################################
TT.plot( class.sys = "HYPRES.TT" ) 


###################################################
### code chunk number 19: soiltexture_vignette.Rnw:915-921
###################################################
tex.tbl <- TT.classes.tbl( class.sys = "HYPRES.TT" ) 
xtable( 
    x       = tex.tbl[,-3],  #
    caption = "Texture classes of the European system / triangle", 
    label   = NULL  
)   #


###################################################
### code chunk number 20: soiltexture_vignette.Rnw:941-942
###################################################
TT.plot( class.sys = "FR.AISNE.TT" ) 


###################################################
### code chunk number 21: soiltexture_vignette.Rnw:956-962
###################################################
tex.tbl <- TT.classes.tbl( class.sys = "FR.AISNE.TT" ) 
xtable( 
    x       = tex.tbl[,-3],  #
    caption = "Texture classes of the French 'Aisne' system / triangle", 
    label   = NULL  
)   #


###################################################
### code chunk number 22: soiltexture_vignette.Rnw:981-982
###################################################
TT.plot( class.sys = "FR.GEPPA.TT" ) 


###################################################
### code chunk number 23: soiltexture_vignette.Rnw:993-999
###################################################
tex.tbl <- TT.classes.tbl( class.sys = "FR.GEPPA.TT" ) 
xtable( 
    x       = tex.tbl[,-3],  #
    caption = "Texture classes of the French 'GEPPA' system / triangle", 
    label   = NULL  
)   #


###################################################
### code chunk number 24: soiltexture_vignette.Rnw:1022-1023
###################################################
TT.plot( class.sys = "DE.BK94.TT" ) 


###################################################
### code chunk number 25: soiltexture_vignette.Rnw:1034-1040
###################################################
tex.tbl <- TT.classes.tbl( class.sys = "DE.BK94.TT" ) 
xtable( 
    x       = tex.tbl[,-3],  #
    caption = "Texture classes of the German system / triangle", 
    label   = NULL  
)   #


###################################################
### code chunk number 26: soiltexture_vignette.Rnw:1065-1066
###################################################
TT.plot( class.sys = "DE.SEA74.TT" ) 


###################################################
### code chunk number 27: soiltexture_vignette.Rnw:1071-1072
###################################################
plLim <- TT.get("DE.SEA74.TT")[["base.css.ps.lim"]][3]


###################################################
### code chunk number 28: soiltexture_vignette.Rnw:1083-1089
###################################################
tex.tbl <- TT.classes.tbl( class.sys = "DE.SEA74.TT" ) 
xtable( 
    x       = tex.tbl[,-3],  #
    caption = "Texture classes of the German SEA 1974 system / triangle", 
    label   = NULL  
)   #


###################################################
### code chunk number 29: soiltexture_vignette.Rnw:1104-1110
###################################################
TT.plot( 
    class.sys = "DE.SEA74.TT", 
    blr.clock   = rep(T,3), 
    tlr.an      = rep(60,3), 
    blr.tx      = c("SAND","CLAY","SILT"), 
)   #


###################################################
### code chunk number 30: soiltexture_vignette.Rnw:1126-1127
###################################################
TT.plot( class.sys = "DE.TGL85.TT" ) 


###################################################
### code chunk number 31: soiltexture_vignette.Rnw:1132-1133
###################################################
plLim <- TT.get("DE.TGL85.TT")[["base.css.ps.lim"]][3]


###################################################
### code chunk number 32: soiltexture_vignette.Rnw:1144-1150
###################################################
tex.tbl <- TT.classes.tbl( class.sys = "DE.TGL85.TT" ) 
xtable( 
    x       = tex.tbl[,-3],  #
    caption = "Texture classes of the German TGL 1985 system / triangle", 
    label   = NULL  
)   #


###################################################
### code chunk number 33: soiltexture_vignette.Rnw:1161-1167
###################################################
TT.plot( 
    class.sys = "DE.TGL85.TT", 
    blr.clock   = rep(T,3), 
    tlr.an      = rep(60,3), 
    blr.tx      = c("SAND","CLAY","SILT"), 
)   #


###################################################
### code chunk number 34: soiltexture_vignette.Rnw:1182-1183
###################################################
TT.plot( class.sys = "UK.SSEW.TT" ) 


###################################################
### code chunk number 35: soiltexture_vignette.Rnw:1193-1199
###################################################
tex.tbl <- TT.classes.tbl( class.sys = "UK.SSEW.TT" ) 
xtable( 
    x       = tex.tbl[,-3],  #
    caption = "Texture classes of the UK system / triangle", 
    label   = NULL  
)   #


###################################################
### code chunk number 36: soiltexture_vignette.Rnw:1216-1217
###################################################
TT.plot( class.sys = "AU.TT" ) 


###################################################
### code chunk number 37: soiltexture_vignette.Rnw:1228-1234
###################################################
tex.tbl <- TT.classes.tbl( class.sys = "AU.TT" ) 
xtable( 
    x       = tex.tbl[,-3],  #
    caption = "Texture classes of the Australian system / triangle", 
    label   = NULL  
)   #


###################################################
### code chunk number 38: soiltexture_vignette.Rnw:1256-1257
###################################################
TT.plot( class.sys = "BE.TT" ) 


###################################################
### code chunk number 39: soiltexture_vignette.Rnw:1272-1278
###################################################
tex.tbl <- TT.classes.tbl( class.sys = "BE.TT" ) 
xtable( 
    x       = tex.tbl[,-3],  #
    caption = "Texture classes of the Belgian system / triangle", 
    label   = NULL  
)   #


###################################################
### code chunk number 40: soiltexture_vignette.Rnw:1296-1297
###################################################
TT.plot( class.sys = "CA.EN.TT" ) 


###################################################
### code chunk number 41: soiltexture_vignette.Rnw:1304-1305
###################################################
TT.plot( class.sys = "CA.FR.TT" ) 


###################################################
### code chunk number 42: soiltexture_vignette.Rnw:1318-1324
###################################################
tex.tbl <- TT.classes.tbl( class.sys = "CA.EN.TT" ) 
xtable( 
    x       = tex.tbl[,-3],  #
    caption = "Texture classes of the Canadian (en) system / triangle", 
    label   = NULL  
)   #


###################################################
### code chunk number 43: soiltexture_vignette.Rnw:1331-1337
###################################################
tex.tbl <- TT.classes.tbl( class.sys = "CA.FR.TT" ) 
xtable( 
    x       = tex.tbl[,-3],  #
    caption = "Texture classes of the Canadian (fr) system / triangle", 
    label   = NULL  
)   #


###################################################
### code chunk number 44: soiltexture_vignette.Rnw:1363-1364
###################################################
TT.plot( class.sys = "ISSS.TT" ) 


###################################################
### code chunk number 45: soiltexture_vignette.Rnw:1377-1383
###################################################
tex.tbl <- TT.classes.tbl( class.sys = "ISSS.TT" ) 
xtable( 
    x       = tex.tbl[,-3],  #
    caption = "Texture classes of the ISSS system / triangle", 
    label   = NULL  
)   #


###################################################
### code chunk number 46: soiltexture_vignette.Rnw:1401-1402
###################################################
TT.plot( class.sys = "ROM.TT" ) 


###################################################
### code chunk number 47: soiltexture_vignette.Rnw:1415-1421
###################################################
tex.tbl <- TT.classes.tbl( class.sys = "ROM.TT" ) 
xtable( 
    x       = tex.tbl[,-3],  #
    caption = "Texture classes of the Romanian system / triangle", 
    label   = NULL  
)   #


###################################################
### code chunk number 48: soiltexture_vignette.Rnw:1432-1438
###################################################
TT.plot( 
    class.sys = "ROM.TT", 
    blr.clock   = c(F,T,NA), 
    tlr.an      = c(45,90,45), 
    blr.tx      = c("SILT","CLAY","SAND"), 
)   #


###################################################
### code chunk number 49: soiltexture_vignette.Rnw:1459-1466
###################################################
test <- try( TT.plot( class.sys = "PL.TT" ) ) 

#   In case the posih triangle was not loaded at startup
if( "try-error" %in% class(test) ){ 
    plot(1,1,type="n",) 
    text(1,1,label="Plotting failed. Polish triangle not loaded")
}   


###################################################
### code chunk number 50: soiltexture_vignette.Rnw:1490-1492
###################################################
test <- try( plLim <- TT.get("PL.TT")[["base.css.ps.lim"]][3] ) 
if( "try-error" %in% class(test) ){ plLim <- NA_real_ }


###################################################
### code chunk number 51: soiltexture_vignette.Rnw:1515-1521
###################################################
tex.tbl <- TT.classes.tbl( class.sys = "PL.TT" ) 
xtable( 
    x       = tex.tbl[,-3],  #
    caption = "Texture classes of the Polish system / triangle", 
    label   = NULL  
)   #


###################################################
### code chunk number 52: soiltexture_vignette.Rnw:1547-1548
###################################################
TT.plot( class.sys = "BRASIL.TT" ) 


###################################################
### code chunk number 53: soiltexture_vignette.Rnw:1561-1567
###################################################
tex.tbl <- TT.classes.tbl( class.sys = "BRASIL.TT" ) 
xtable( 
    x       = tex.tbl[,-3],  #
    caption = "Texture classes of the Brazilian system / triangle", 
    label   = NULL  
)   #


###################################################
### code chunk number 54: soiltexture_vignette.Rnw:1589-1606
###################################################
# Set a 2 by 2 plot matrix:
old.par <- par(no.readonly=T)
par("mfcol" = c(1,2),"mfrow"=c(1,2)) 

# Plot the triangles
TT.plot( 
    class.sys       = "USDA.TT", 
    class.p.bg.col  = TRUE
)   #

TT.plot( 
    class.sys       = "HYPRES.TT", 
    class.p.bg.col  = TRUE
)   #

# Back to old parameters:
par(old.par)


###################################################
### code chunk number 55: soiltexture_vignette.Rnw:1614-1631
###################################################
# Set a 2 by 2 plot matrix:
old.par <- par(no.readonly=T)
par("mfcol" = c(1,2),"mfrow"=c(1,2)) 

# Plot the triangles
TT.plot( 
    class.sys       = "FR.AISNE.TT", 
    class.p.bg.col  = TRUE
)   #

TT.plot( 
    class.sys       = "FR.GEPPA.TT", 
    class.p.bg.col  = TRUE
)   #

# Back to old parameters:
par(old.par)


###################################################
### code chunk number 56: soiltexture_vignette.Rnw:1639-1656
###################################################
# Set a 2 by 2 plot matrix:
old.par <- par(no.readonly=T)
par("mfcol" = c(1,2),"mfrow"=c(1,2)) 

# Plot the triangles
TT.plot( 
    class.sys       = "UK.SSEW.TT", 
    class.p.bg.col  = TRUE
)   #

TT.plot( 
    class.sys       = "DE.BK94.TT", 
    class.p.bg.col  = TRUE
)   #

# Back to old parameters:
par(old.par)


###################################################
### code chunk number 57: soiltexture_vignette.Rnw:1663-1680
###################################################
# Set a 2 by 2 plot matrix:
old.par <- par(no.readonly=T)
par("mfcol" = c(1,2),"mfrow"=c(1,2)) 

# Plot the triangles
TT.plot( 
    class.sys       = "AU.TT", 
    class.p.bg.col  = TRUE
)   #

TT.plot( 
    class.sys       = "BE.TT", 
    class.p.bg.col  = TRUE
)   #

# Back to old parameters:
par(old.par)


###################################################
### code chunk number 58: soiltexture_vignette.Rnw:1688-1705
###################################################
# Set a 2 by 2 plot matrix:
old.par <- par(no.readonly=T)
par("mfcol" = c(1,2),"mfrow"=c(1,2)) 

# Plot the triangles
TT.plot( 
    class.sys       = "CA.EN.TT", 
    class.p.bg.col  = TRUE
)   #

TT.plot( 
    class.sys       = "CA.FR.TT", 
    class.p.bg.col  = TRUE
)   #

# Back to old parameters:
par(old.par)


###################################################
### code chunk number 59: soiltexture_vignette.Rnw:1719-1723
###################################################
TT.plot( 
    class.sys       = "HYPRES.TT", 
    class.p.bg.col  = c("red","green","blue","pink","purple") 
)   #


###################################################
### code chunk number 60: soiltexture_vignette.Rnw:1744-1761
###################################################
# First plot the USDA texture triangle, and retrieve its 
#   geometrical features, silently outputted by TT.plot 
geo <- TT.plot( 
    class.sys   = "USDA.TT", 
    main        = "USDA and French Aisne triangles, overplotted"  
)   # 

# Then overplot the French Aisne texture triangle, 
#   and customise the colors so triangles are well distinct.
TT.classes(
    geo             = geo, 
    class.sys       = "FR.AISNE.TT", 
    # Additional "graphical" options
    class.line.col  = "red", 
    class.lab.col   = "red", 
    lwd.axis        = 2  
)   #


###################################################
### code chunk number 61: soiltexture_vignette.Rnw:1779-1796
###################################################
# First plot the USDA texture triangle, and retrieve its 
#   geometrical features, silently outputted by TT.plot 
geo <- TT.plot( 
    class.sys   = "FR.AISNE.TT", 
    main        = "French Aisne and GEPPA triangles, overplotted"  
)   # 

# Then overplot the French Aisne texture triangle, 
#   and customise the colors so triangles are well distinct.
TT.classes(
    geo             = geo, 
    class.sys       = "FR.GEPPA.TT", 
    # Additional "graphical" options
    class.line.col  = "red", 
    class.lab.col   = "red", 
    lwd.axis        = 2  
)   #


###################################################
### code chunk number 62: soiltexture_vignette.Rnw:1813-1823
###################################################
# Create a dummy data frame of soil textures:
my.text <- data.frame( 
    "CLAY"  = c(05,60,15,05,25,05,25,45,65,75,13,47), 
    "SILT"  = c(05,08,15,25,55,85,65,45,15,15,17,43), 
    "SAND"  = c(90,32,70,70,20,10,10,10,20,10,70,10), 
    "OC"    = c(20,14,15,05,12,15,07,21,25,30,05,28)  
)   #

# Display the table:
my.text


###################################################
### code chunk number 63: soiltexture_vignette.Rnw:1830-1835
###################################################
TT.plot( 
    class.sys   = "HYPRES.TT", 
    tri.data    = my.text, 
    main        = "Soil texture data" 
)   #


###################################################
### code chunk number 64: soiltexture_vignette.Rnw:1853-1859
###################################################
TT.plot( 
    class.sys   = "none", 
    tri.data    = my.text, 
    z.name      = "OC", 
    main        = "Soil texture triangle and OC bubble plot" 
)   #


###################################################
### code chunk number 65: soiltexture_vignette.Rnw:1881-1882
###################################################
rand.text	<- TT.dataset(n=100,seed.val=1980042401)


###################################################
### code chunk number 66: soiltexture_vignette.Rnw:1886-1892
###################################################
TT.plot( 
    class.sys   = "none", 
    tri.data    = rand.text, 
    z.name      = "Z", 
    main        = "Soil texture triangle and Z bubble plot" 
)   #


###################################################
### code chunk number 67: soiltexture_vignette.Rnw:1903-1952
###################################################
TT.plot( 
    class.sys   = "none", 
    tri.data    = my.text, 
    z.name      = "OC", 
    main        = "Soil texture triangle and OC bubble plot" 
)   #

# Recompute some internal values:
z.cex.range <- TT.get("z.cex.range") 
def.pch     <- par("pch") 
def.col     <- par("col")
def.cex     <- TT.get("cex") 
oc.str      <- TT.str( 
    my.text[,"OC"], 
    z.cex.range[1], 
    z.cex.range[2]
)   #

# The legend:
legend( 
    x           = 80, 
    y           = 90, 
    title       = 
        expression( bold('OC [g.kg'^-1 ~ ']') ), 
    legend      = formatC( 
        c( 
            min( my.text[,"OC"] ), 
            quantile(my.text[,"OC"] ,probs=c(25,50,75)/100), 
            max( my.text[,"OC"] ) 
        ), 
        format  = "f", 
        digits  = 1, 
        width   = 4, 
        flag    = "0" 
    ),  #
    pt.lwd      = 4, 
    col         = def.col, 
    pt.cex      = c( 
            min( oc.str ), 
            quantile(oc.str ,probs=c(25,50,75)/100), 
            max( oc.str ) 
    ),  #, 
    pch         = def.pch, 
    bty         = "o", 
    bg          = NA, 
    #box.col    = NA, # Uncomment this to remove the legend box
    text.col    = "black", 
    cex         = def.cex  
)   #


###################################################
### code chunk number 68: soiltexture_vignette.Rnw:1999-2018
###################################################
geo <- TT.geo.get() 
#
iwd.res <- TT.iwd( 
    geo         = geo, 
    tri.data    = rand.text, 
    z.name      = "Z", 
)   #
#
TT.image( 
    x       = iwd.res, 
    geo     = geo, 
    main    = "Soil texture triangle and Z heatmap" 
)   # 
#
TT.plot( 
    geo         = geo, 
    grid.show   = FALSE, 
    add         = TRUE  #  <<-- important 
)   #


###################################################
### code chunk number 69: soiltexture_vignette.Rnw:2048-2066
###################################################
TT.image( 
    x       = iwd.res, 
    geo     = geo, 
    main    = "Soil texture triangle and Z heatmap" 
)   # 
#
TT.contour( 
    x       = iwd.res, 
    geo     = geo, 
    add     = TRUE, #  <<-- important
    lwd     = 2  
)   # 
#
TT.plot( 
    geo         = geo, 
    grid.show   = FALSE, 
    add         = TRUE  #  <<-- important
)   #


###################################################
### code chunk number 70: soiltexture_vignette.Rnw:2101-2123
###################################################
geo <- TT.geo.get()  
#
kde.res <- TT.kde2d( 
    geo         = geo, 
    tri.data    = rand.text  
)   #
#
TT.contour( 
    x       = kde.res, 
    geo     = geo, 
    main    = "Probability density estimate of the texture data", 
    lwd     = 2, 
    col     = "red"  
)   # 
#
TT.plot( 
    tri.data    = rand.text, 
    geo         = geo, 
    grid.show   = FALSE, 
    add         = TRUE, #  <<-- important 
    col         = "gray"
)   #


###################################################
### code chunk number 71: soiltexture_vignette.Rnw:2169-2191
###################################################
geo <- TT.geo.get() 
#
maha <- TT.mahalanobis( 
    geo         = geo, 
    tri.data    = rand.text  
)   #
#
TT.contour( 
    x       = maha, 
    geo     = geo, 
    main    = "Texture data Mahalanobis distance", 
    lwd     = 2, 
    col     = "blue"  
)   # 
#
TT.plot( 
    tri.data    = rand.text, 
    geo         = geo, 
    grid.show   = FALSE, 
    add         = TRUE, #  <<-- important 
    col         = "gray"
)   #


###################################################
### code chunk number 72: soiltexture_vignette.Rnw:2219-2243
###################################################
geo <- TT.geo.get() 
#
maha <- TT.mahalanobis( 
    geo         = geo, 
    tri.data    = rand.text, 
    alr         = TRUE  #  <<-- important 
)   #
#
TT.contour( 
    x       = maha, 
    geo     = geo, 
    main    = "Texture data Mahalanobis distance", 
    lwd     = 2, 
    col     = "blue", 
    levels  = c(0.5,1,2,4,8)  #  <<-- manually set. Otherwise 
)   #                                 ugly plot
#
TT.plot( 
    tri.data    = rand.text, 
    geo         = geo, 
    grid.show   = FALSE, 
    add         = TRUE,  #  <<-- important 
    col         = "gray"
)   #


###################################################
### code chunk number 73: soiltexture_vignette.Rnw:2272-2287
###################################################
# Display the USDA texture triangle:
geo     <- TT.plot(class.sys="USDA.TT") 

# Create some custom labels:
labelz  <- letters[1:dim(my.text)[1]] 
labelz 

# Display the text
TT.text( 
    tri.data    = my.text, 
    geo         = geo, 
    labels      = labelz, 
    font        = 2, 
    col         = "blue"  
)   #


###################################################
### code chunk number 74: soiltexture_vignette.Rnw:2325-2326
###################################################
TT.data.test( tri.data = rand.text ) 


###################################################
### code chunk number 75: soiltexture_vignette.Rnw:2349-2360
###################################################
res <- TT.normalise.sum( tri.data = rand.text ) 
#
# With output of the residuals:
res <- TT.normalise.sum( 
    tri.data    = rand.text, 
    residuals   = TRUE  #  <<-- default = FALSE 
)   #
#
colnames( rand.text )
colnames( res )  #  "Z" has been dropped
max( res[ , "residuals" ] ) 


###################################################
### code chunk number 76: soiltexture_vignette.Rnw:2388-2392
###################################################
TT.points.in.classes( 
    tri.data    = my.text[1:5,], 
    class.sys   = "HYPRES.TT"  
)   #


###################################################
### code chunk number 77: soiltexture_vignette.Rnw:2401-2405
###################################################
TT.points.in.classes( 
    tri.data    = my.text[1:5,], 
    class.sys   = "USDA.TT"  
)   #


###################################################
### code chunk number 78: soiltexture_vignette.Rnw:2417-2422
###################################################
TT.points.in.classes( 
    tri.data    = my.text[1:5,], 
    class.sys   = "HYPRES.TT", 
    PiC.type    = "l" 
)   #


###################################################
### code chunk number 79: soiltexture_vignette.Rnw:2433-2438
###################################################
TT.points.in.classes( 
    tri.data    = my.text[1:5,], 
    class.sys   = "HYPRES.TT", 
    PiC.type    = "t" 
)   #


###################################################
### code chunk number 80: soiltexture_vignette.Rnw:2449-2455
###################################################
TT.points.in.classes( 
    tri.data    = my.text[1:5,], 
    class.sys   = "HYPRES.TT", 
    PiC.type    = "t", 
    collapse    = ";"
)   #


###################################################
### code chunk number 81: soiltexture_vignette.Rnw:2532-2623
###################################################
tmp.cex <- 1.5
old.par <- par(no.readonly = TRUE)
par(cex=tmp.cex,cex.axis=tmp.cex,cex.lab=tmp.cex,cex.main=tmp.cex)

tmp.text <- data.frame( "CLAY" = 20, "SILT" = 15, "SAND" = 65 ) 

plot( 
    x       = TT.dia2phi( c(2,20,2000) ), 
    y       = cumsum( unlist(tmp.text[1,]) ), 
    ylim    = c(0,100), 
    xlim    = TT.dia2phi( c(1,2000) ), 
    xaxt    = "n", 
    xlab    =  
expression( 'Particle size['~ mu * 'm] (log'[2] * 'scale)' ), 
    ylab    = "Cumulated particle size distribution [%]", 
    bty     = "n", 
    type    = "b", 
    main    = 
"Principle of particle size log-linear transformation", 
    cex     = tmp.cex  
)   #

lines( 
    spline( 
        y   = rev(cumsum( unlist(tmp.text[1,]) )), 
        x   = TT.dia2phi( c(2000,20,2))
    ),  # 
    col = "green"  
)   #

segments( 
    x0  = TT.dia2phi( c(2,20,2000) ), 
    x1  = TT.dia2phi( c(2,20,2000) ), 
    y0  = rep(0,3), 
    y1  = cumsum( unlist(tmp.text[1,]) ), 
    col = "red"  
)   #

new.tmp.text <- TT.text.transf( 
    tri.data        = tmp.text,  
    base.css.ps.lim = c(0,2,50,2000),  
    dat.css.ps.lim  = c(0,2,20,2000)   
)   #

new.silt.c <- cumsum( unlist(new.tmp.text[1,]) )[2]

arrows( 
    x0  = TT.dia2phi( c(50,50) ), 
    x1  = TT.dia2phi( c(50,1) ), 
    y0  = c(0,new.silt.c), 
    y1  = c(new.silt.c,new.silt.c), 
    col = "blue"  
)   #

text( 
    x       = TT.dia2phi( c(2,20,2000) ), 
    y       = cumsum( unlist(tmp.text[1,]) ), 
    pos     = 2, 
    offset  = 1, 
    labels  = c("Clay","Silt","Sand"), 
    col     = "red", 
    cex     = tmp.cex  
)   #

text( 
    x       = TT.dia2phi( c(50) ), 
    y       = new.silt.c, 
    pos     = 4, 
    offset  = 1, 
    labels  = "new Silt", 
    col     = "blue", 
    cex     = tmp.cex  
)   #

axis( 
    side    = 1, 
    at      = TT.dia2phi( c(2,20,50,2000) ), 
    labels  = c(2,20,50,2000) 
)   #

text( 
    x       = TT.dia2phi( 500 ), 
    y       = 65, 
    #pos    = 4, 
    #offset = 1, 
    labels  = "real distribution?", 
    col     = "green", 
    cex     = tmp.cex  
)   #

par(old.par) 


###################################################
### code chunk number 82: soiltexture_vignette.Rnw:2635-2636
###################################################
my.text[1:5,]   


###################################################
### code chunk number 83: soiltexture_vignette.Rnw:2647-2652
###################################################
TT.text.transf( 
	tri.data        = my.text[1:5,],  
	base.css.ps.lim = c(0,2,50,2000),  
	dat.css.ps.lim  = c(0,2,63,2000)   
)   #


###################################################
### code chunk number 84: soiltexture_vignette.Rnw:2660-2666
###################################################
# Copy the data.frame
my.text.fr  <- my.text 
# Curent columns names:
colnames(my.text.fr) 
# New columns names: 
colnames(my.text.fr) <- c("ARGILE","LIMON","SABLE","CO") 


###################################################
### code chunk number 85: soiltexture_vignette.Rnw:2673-2679
###################################################
TT.text.transf( 
    tri.data        = my.text.fr[1:5,],  
    base.css.ps.lim = c(0,2,50,2000),  
    dat.css.ps.lim  = c(0,2,63,2000),  
    css.names       = c("ARGILE","LIMON","SABLE")   
)   #


###################################################
### code chunk number 86: soiltexture_vignette.Rnw:2718-2729
###################################################
# Create a random fraction between 0 and 1
r.frac <- runif(n=dim(my.text)[1]) 
#
my.text4 <- cbind( 
    "CLAY"          = my.text[,"CLAY"], 
    "FINE_SILT"     = my.text[,"SILT"] * r.frac, 
    "COARSE_SILT"   = my.text[,"SILT"] * (1-r.frac), 
    "SAND"          = my.text[,"SAND"]  
)   #
#
my.text4[1:5,] 


###################################################
### code chunk number 87: soiltexture_vignette.Rnw:2738-2743
###################################################
TT.text.transf.X( 
    tri.data        = my.text4[1:5,], 
    base.ps.lim = c(0,2,20,50,2000),  
    dat.ps.lim  = c(0,2,20,63,2000)   
)   #


###################################################
### code chunk number 88: soiltexture_vignette.Rnw:2757-2762
###################################################
TT.text.transf.X( 
    tri.data        = my.text4[1:5,], 
    base.ps.lim = c(0,2,50,2000),  
    dat.ps.lim  = c(0,2,20,63,2000)   
)   #


###################################################
### code chunk number 89: soiltexture_vignette.Rnw:2776-2793
###################################################
# First, plot the data without transformation:
geo <- TT.plot( 
    class.sys   = "FR.GEPPA.TT", 
    tri.data    = my.text, 
    col         = "red", 
    main        = "Transformed and untransformed data"
)   #

# Then, re-plot them with transformation:
TT.points( 
    tri.data        = my.text, 
    geo             = geo, 
    dat.css.ps.lim  = c(0,2,63,2000),  
    css.transf      = TRUE, 
    col             = "blue", 
    pch             = 3  
)   #


###################################################
### code chunk number 90: soiltexture_vignette.Rnw:2816-2836
###################################################
# Not transformed
geo <- TT.plot( 
    class.sys   = "UK.SSEW.TT", 
    base.css.ps.lim = c(0,2,50,2000), 
    main        = 
        "Dummy transformation of the UK texture triangle"  
)   # 

# Transformed
TT.classes(
    geo             = geo, 
    class.sys       = "UK.SSEW.TT", 
    css.transf      = TRUE, 
    # Additional "graphical" options
    class.line.col  = "red", 
    class.lab.col   = "red", 
    lwd.axis        = 2, 
    class.lab.show  = "none", 
    class.lty       = 2 
)   #


###################################################
### code chunk number 91: soiltexture_vignette.Rnw:2852-2870
###################################################
# No transformation needed or stated
geo <- TT.plot( 
    class.sys   = "USDA.TT", 
    main        = 
        "USDA and transformed UK triangle, overplotted"  
)   # 

# Transformed
TT.classes(
    geo             = geo, 
    class.sys       = "UK.SSEW.TT", 
    css.transf      = TRUE,  #  <<-- important
    # Additional "graphical" options
    class.line.col  = "blue", 
    class.lab.col   = "blue", 
    lwd.axis        = 2, 
    class.lty       = 2 
)   #


###################################################
### code chunk number 92: soiltexture_vignette.Rnw:2881-2900
###################################################
# Untransformed
geo <- TT.plot( 
    class.sys   = "USDA.TT", 
    main        = 
        "(Dummy) transformation of the USDA texture triangle"  
)   # 

# Transformed
TT.classes(
    geo             = geo, 
    class.sys       = "USDA.TT", 
    tri.css.ps.lim  = c(0,2,20,2000), 
    css.transf      = TRUE,  #  <<-- important
    # Additional "graphical" options
    class.line.col  = "blue", 
    class.lab.col   = "blue", 
    lwd.axis        = 2, 
    class.lty       = 2 
)   #


###################################################
### code chunk number 93: soiltexture_vignette.Rnw:2911-2929
###################################################
geo <- TT.plot( 
    class.sys   = "FR.GEPPA.TT", 
    blr.tx      = c("SAND","CLAY","SILT"), 
    main        = 
        "(Dummy) transformation of the GEPPA texture triangle"  
)   # 

TT.classes(
    geo             = geo, 
    class.sys       = "FR.GEPPA.TT", 
    tri.css.ps.lim  = c(0,2,20,2000), 
    css.transf      = TRUE,  #  <<-- important
    # Additional "graphical" options
    class.line.col  = "blue", 
    class.lab.col   = "blue", 
    lwd.axis        = 2, 
    class.lty       = 2 
)   #


###################################################
### code chunk number 94: soiltexture_vignette.Rnw:2939-2959
###################################################
# Not transformed
geo <- TT.plot( 
    class.sys       = "FR.GEPPA.TT", 
    blr.tx          = c("SAND","CLAY","SILT"), 
    base.css.ps.lim  = c(0,2,20,2000), 
    main        = 
        "(Dummy) transformation of the GEPPA texture triangle"  
)   # 

# Transformed
TT.classes(
    geo             = geo, 
    class.sys       = "FR.GEPPA.TT", 
    css.transf      = TRUE,  #  <<-- important
    # Additional "graphical" options
    class.line.col  = "blue", 
    class.lab.col   = "blue", 
    lwd.axis        = 2, 
    class.lty       = 2 
)   #


###################################################
### code chunk number 95: soiltexture_vignette.Rnw:2975-2981
###################################################
TT.points.in.classes( 
    tri.data        = my.text[1:5,], 
    class.sys       = "USDA.TT", 
    dat.css.ps.lim  = c(0,2,20,2000), 
    css.transf      = TRUE   #  <<-- important
)   #


###################################################
### code chunk number 96: soiltexture_vignette.Rnw:2986-2993
###################################################
TT.plot( 
    class.sys       = "USDA.TT", 
    tri.data        = my.text, 
    dat.css.ps.lim  = c(0,2,20,2000), 
    css.transf      = TRUE,  #  <<-- important
    col             = "red"  
)   # 


###################################################
### code chunk number 97: soiltexture_vignette.Rnw:3001-3008
###################################################
TT.points.in.classes( 
    tri.data        = my.text[1:5,], 
    class.sys       = "USDA.TT", 
    dat.css.ps.lim  = c(0,2,20,2000), 
    base.css.ps.lim = c(0,2,20,2000), 
    css.transf      = TRUE  
)   #


###################################################
### code chunk number 98: soiltexture_vignette.Rnw:3014-3022
###################################################
TT.plot( 
    class.sys       = "USDA.TT", 
    tri.data        = my.text, 
    dat.css.ps.lim  = c(0,2,20,2000), 
    base.css.ps.lim = c(0,2,20,2000), 
    css.transf      = TRUE, 
    col             = "red"  
)   # 


###################################################
### code chunk number 99: soiltexture_vignette.Rnw:3066-3080
###################################################
# Create a new function, in fact the copy of TT.text.transf()
TT.text.transf2 <- TT.text.transf

# Imagine some changes in TT.text.transf2...

# Use your new function (will give identical results)
TT.points.in.classes( 
    tri.data        = my.text[1:5,], 
    class.sys       = "USDA.TT", 
    dat.css.ps.lim  = c(0,2,20,2000), 
    base.css.ps.lim = c(0,2,20,2000), 
    css.transf      = TRUE, 
    text.transf.fun = "TT.text.transf2"  #  <<-- important
)   #


###################################################
### code chunk number 100: soiltexture_vignette.Rnw:3087-3098
###################################################
TT.plot( 
    class.sys       = "USDA.TT", 
    tri.data        = my.text, 
    dat.css.ps.lim  = c(0,2,20,2000), 
    base.css.ps.lim = c(0,2,20,2000), 
    css.transf      = TRUE, 
    col             = "red", 
    text.transf.fun = "TT.text.transf2", #  <<-- important
    main            = 
        "Test of a (dummy) new transformation function"
)   # 


###################################################
### code chunk number 101: soiltexture_vignette.Rnw:3153-3158
###################################################
TT.plot( 
    class.sys   = "USDA.TT", 
    tlr.an      = c(45,90,45), 
    main        = "Re-projected USDA triangle (angles)"  
)   # 


###################################################
### code chunk number 102: soiltexture_vignette.Rnw:3183-3188
###################################################
TT.plot( 
    class.sys   = "FR.AISNE.TT", 
    blr.tx      = c("CLAY","SILT","SAND"), 
    main        = "Re-projected French Aisne triangle (axis)"  
)   # 


###################################################
### code chunk number 103: soiltexture_vignette.Rnw:3217-3222
###################################################
TT.plot( 
    class.sys   = "HYPRES.TT", 
    blr.clock   = c(FALSE,TRUE,NA), 
    main        = "Re-projected European triangle (axis directions)"  
)   # 


###################################################
### code chunk number 104: soiltexture_vignette.Rnw:3243-3250
###################################################
TT.plot( 
    class.sys   = "FR.GEPPA.TT", 
    tlr.an      = c(60,60,60), 
    blr.tx      = c("SAND","CLAY","SILT"), 
    blr.clock   = c(TRUE,TRUE,TRUE), 
    main        = "Fully re-projected GEPPA triangle"  
)   # 


###################################################
### code chunk number 105: soiltexture_vignette.Rnw:3268-3284
###################################################
# Set a 2 by 2 plot matrix:
old.par <- par(no.readonly=T)
par("mfcol" = c(1,2),"mfrow"=c(1,2)) 

# Plot the triangles with different geometries:
TT.plot( class.sys = "USDA.TT" ) 

TT.plot( 
    class.sys   = "USDA.TT", 
    blr.tx      = c("SILT","SAND","CLAY"), 
    blr.clock   = c(FALSE,FALSE,FALSE), 
    main        = "USDA triangle with a different geometry"  
)   # 

# Back to old parameters:
par(old.par)


###################################################
### code chunk number 106: soiltexture_vignette.Rnw:3308-3325
###################################################
# Set a 2 by 2 plot matrix:
old.par <- par(no.readonly=T)
par("mfcol" = c(1,2),"mfrow"=c(1,2)) 

# Plot the triangles with different languages:
TT.plot( 
    class.sys   = "FR.GEPPA.TT", 
    lang        = "fr" 
)   #

TT.plot( 
    class.sys   = "FR.GEPPA.TT", 
    lang        = "de" 
)   #

# Back to old parameters:
par(old.par)


###################################################
### code chunk number 107: soiltexture_vignette.Rnw:3333-3350
###################################################
# Set a 2 by 2 plot matrix:
old.par <- par(no.readonly=T)
par("mfcol" = c(1,2),"mfrow"=c(1,2)) 

# Plot the triangles with different languages:
TT.plot( 
    class.sys   = "FR.GEPPA.TT", 
    lang        = "es" 
)   #

TT.plot( 
    class.sys   = "FR.GEPPA.TT", 
    lang        = "it" 
)   #

# Back to old parameters:
par(old.par)


###################################################
### code chunk number 108: soiltexture_vignette.Rnw:3360-3377
###################################################
# Set a 2 by 2 plot matrix:
old.par <- par(no.readonly=T)
par("mfcol" = c(1,2),"mfrow"=c(1,2)) 

# Plot the triangles with different languages:
TT.plot( 
    class.sys   = "FR.GEPPA.TT", 
    lang        = "nl" 
)   #

TT.plot( 
    class.sys   = "FR.GEPPA.TT", 
    lang        = "fl" 
)   #

# Back to old parameters:
par(old.par)


###################################################
### code chunk number 109: soiltexture_vignette.Rnw:3385-3403
###################################################
# Set a 2 by 2 plot matrix (for size):
old.par <- par(no.readonly=T)
par("mfcol" = c(1,2),"mfrow"=c(1,2)) 

# Plot the triangles with different languages:
TT.plot( 
    class.sys   = "FR.GEPPA.TT", 
    lang        = "se" 
)   #

# Plot the triangles with different languages:
TT.plot( 
    class.sys   = "FR.GEPPA.TT", 
    lang        = "ro" 
)   #

# Back to old parameters:
par(old.par)


###################################################
### code chunk number 110: soiltexture_vignette.Rnw:3417-3429
###################################################
# Set a 2 by 2 plot matrix (for size):
old.par <- par(no.readonly=T)
par("mfcol" = c(1,2),"mfrow"=c(1,2)) 

# Plot the triangles with different languages:
TT.plot( 
    class.sys   = "FR.GEPPA.TT", 
    lang        = "en" 
)   #

# Back to old parameters:
par(old.par)


###################################################
### code chunk number 111: soiltexture_vignette.Rnw:3454-3459
###################################################
TT.plot( 
    tri.data    = my.text.fr, 
    class.sys   = "HYPRES.TT", 
    css.names   = c("ARGILE","LIMON","SABLE") 
)   #


###################################################
### code chunk number 112: soiltexture_vignette.Rnw:3483-3491
###################################################
TT.plot( 
    tri.data    = my.text.fr, 
    class.sys   = "HYPRES.TT", 
    css.names   = c("ARGILE","LIMON","SABLE"), 
    css.lab     = c("l'argile [%]","Le limon [%]","Le sable [%]"), 
    main        = 
        "A texture triangle with (dummy) custom axis names"  
)   #


###################################################
### code chunk number 113: soiltexture_vignette.Rnw:3499-3511
###################################################
TT.plot( 
    tri.data    = my.text.fr, 
    class.sys   = "HYPRES.TT", 
    css.names   = c("ARGILE","LIMON","SABLE"), 
    css.lab     = expression( 
        bold(sqrt('Argile'^2)~'[%]'), 
        bold(sqrt('Limon'^2)~'[%]'), 
        bold(sqrt('Sable'^2)~'[%]')
    ),  #
    main        = 
        "A texture triangle with (dummy) custom axis names"  
)   #


###################################################
### code chunk number 114: soiltexture_vignette.Rnw:3535-3546
###################################################
# Fisrt, retrieve all the data about 
#   the USDA texture triangle
tmp <- TT.get("USDA.TT") 

# It is not displayed here because it is to big
#   The list names are:
names(tmp) 

# If we drop "tt.points" and "tt.polygons", that will be 
#   presented later, the list size is more reasonable
tmp[ !names(tmp) %in% c("tt.points","tt.polygons") ]


###################################################
### code chunk number 115: soiltexture_vignette.Rnw:3564-3572
###################################################
# Retrieve and save the table:
tmp2 <- TT.classes.tbl( class.sys = "HYPRES.TT" ) 

# Display the first part:
tmp2[,1:2] 

# Then display the last column (and the 1st again):
tmp2[,c(1,3)] 


###################################################
### code chunk number 116: soiltexture_vignette.Rnw:3587-3588
###################################################
TT.vertices.tbl( class.sys = "HYPRES.TT" ) 


###################################################
### code chunk number 117: soiltexture_vignette.Rnw:3604-3616
###################################################
geo <- TT.plot( 
    class.sys   = "HYPRES.TT", 
    main        = "Vertices numbers. USDA texture triangle"
)   # 

TT.vertices.plot( 
    geo         = geo, 
    class.sys   = "HYPRES.TT", 
    col         = "red", 
    cex         = 2, 
    font        = 2  
)   #


###################################################
### code chunk number 118: soiltexture_vignette.Rnw:3645-3658
###################################################
# Step 1 
HYPRES63 <- TT.get("HYPRES.TT") 
#
# Visualize the data that will be modified
HYPRES63[[ "base.css.ps.lim" ]] 
HYPRES63[[ "tri.css.ps.lim" ]] 
#
# Step 2 
HYPRES63[[ "base.css.ps.lim" ]][3] <- 63 
HYPRES63[[ "tri.css.ps.lim" ]][3]  <- 63 
#
# Step 3: Load the new texture triangle
TT.add( "HYPRES63.TT" = HYPRES63 ) 


###################################################
### code chunk number 119: soiltexture_vignette.Rnw:3666-3670
###################################################
TT.plot( 
    class.sys   = "HYPRES63.TT", 
    main        = "Modified European soil texture triangle"
)   # 


###################################################
### code chunk number 120: soiltexture_vignette.Rnw:3681-3701
###################################################
# Get the definition of the HYPRES texture triangle
HYPRES <- TT.get( "HYPRES.TT" ) 
#
# Check its class (list) 
class( HYPRES ) 
#
# Check its parameters names 
names( HYPRES ) 
#
# Check its parameters class 
for( i in 1:length(HYPRES) )
{   
    print( 
        paste( 
            names( HYPRES )[i], 
            class( HYPRES[[i]] ), 
            sep = ": "
        )   
    )    
}   


