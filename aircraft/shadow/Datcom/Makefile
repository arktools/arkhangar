all: dcm graph clean
clean:
	rm -rf fort.* *.dat *.lfi *.csv *.ac

dist-clean:
	rm -rf *.jiff *.xml *.out

graph:
	jiff shadow_aero.xml

dcm:
	datcom shadow.dcm
	sed -i -e "1446s:$$:\n                  <independentVar lookup=\"column\">fcs/left-aileron-pos-deg</independentVar>:g" shadow_aero.xml
