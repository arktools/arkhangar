all: dcm graph clean
clean:
	rm -rf fort.* *.dat *.lfi *.csv *.ac

dist-clean:
	rm -rf *.jiff *.xml *.out

graph:
	jiff orbiter_aero.xml

dcm:
	datcom orbiter.dcm
	sed -i -e "1018s:$$:\n                  <independentVar lookup=\"column\">fcs/left-aileron-pos-deg</independentVar>:g" orbiter_aero.xml
	sed -i -e "372,408d" orbiter_aero.xml
