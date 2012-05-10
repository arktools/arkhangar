all: easystar_aero.xml

clean:
	rm -rf fort.* *.dat *.lfi *.csv *.ac easystar_aero.xml

dist-clean:
	rm -rf *.jiff *.xml *.out

easystar_aero.xml: easystar.dcm
	datcom easystar.dcm

graph: easystar_aero.xml
	jiff $^
	nautilus easystar.jiff

test:
	fgfs --aircraft=easystar-datcom --altitude=3000
