all: dcm graph clean
clean:
	rm -rf fort.* *.dat *.lfi *.csv *.ac

dist-clean:
	rm -rf *.jiff *.xml *.out

graph:
	jiff easystar_aero.xml

dcm:
	datcom easystar.dcm
