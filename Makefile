all: library comp test

comp:
	cd components/ && $(OZHOME)/bin/ozc -c *.oz && cd ..
	cd components/QTk && $(OZHOME)/bin/ozc -c *.oz && cd ../..
	cd components/QTk/canvas && $(OZHOME)/bin/ozc -c *.oz && cd ../..
	cd components/gates && $(OZHOME)/bin/ozc -c *.oz && cd ../..
	cd components/calculator && $(OZHOME)/bin/ozc -c *.oz && cd ../../
	cd components/dnd/ && $(OZHOME)/bin/ozc -c *.oz && cd ../../
	cd components/failure/ && $(OZHOME)/bin/ozc -c *.oz && cd ../../
	cd components/stack/ && $(OZHOME)/bin/ozc -c *.oz && cd ../../
	cd components/ip/ && $(OZHOME)/bin/ozc -c *.oz && cd ../../

editor:
#	cd components/editor && $(OZHOME)/bin/ozc -c *.oz && cd ../../
#	cd components/editor/link && $(OZHOME)/bin/ozc -c *.oz && cd ../../../
	cd components/editor/component && $(OZHOME)/bin/ozc -c *.oz && cd ../../../
	cd components/editor/movable && $(OZHOME)/bin/ozc -c *.oz && cd ../../../
	cd components/editor/editor && $(OZHOME)/bin/ozc -c *.oz && cd ../../../
#	cd components/graph && $(OZHOME)/bin/ozc -c *.oz && cd ../../
#	cd components/mouse && $(OZHOME)/bin/ozc -c *.oz && cd ../../
#	cd components/editor/editPanel && $(OZHOME)/bin/ozc -c *.oz && cd ../../../


library:
	cd lib/ && $(OZHOME)/bin/ozc -c *.oz && cd ..

test:
	$(OZHOME)/bin/ozc -c *.oz

clean:
	rm -Rrf lib/*.ozf
	rm -Rrf components/*.ozf
	rm -Rrf *.ozf
