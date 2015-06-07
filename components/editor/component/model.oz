functor
import
   System
   Fractalide at '../../../lib/fractalide.ozf'
export Component
define
   Component = comp(description:"The model of the component in editor"
		    inPorts('in' start stop load delete mouse)
		    outPorts(canvas name canvasImage image control controlName controlType)
		    state(comp:false name:default)
		    procedure(proc{$ Ins Out Comp}
				 if {Ins.'in'.size} > 0 then {Create Ins.'in' Out Comp} end
				 if {Ins.start.size} > 0 then {Start Ins.start Out Comp} end
				 if {Ins.stop.size} > 0 then {Stop Ins.stop Out Comp} end
				 if {Ins.load.size} > 0 then {Load Ins.load Out Comp} end
				 if {Ins.delete.size} > 0 then {Delete Ins.delete Out Comp} end
				 if {Ins.mouse.size} > 0 then {Mouse Ins.mouse Out Comp} end
				 
			      end)
		   ) 
   proc {Create In Out Comp} IP in
      IP = {In.get}
      {System.show IP}
      {Out.canvas create(bg:white width:100 height:100)}
      {Out.name create(50 50 text:IP.name)}
      {Out.canvasImage create(50 50)}
      {Out.canvasImage lower}
      {Out.image photo(file:"./components/editor/images/circle.gif")}
      {Out.controlName create(init:IP.name)}
      {Out.controlType create(init:"-")}
      Comp.state.name := IP.name
      {System.show endCreate}
   end
   proc {Start In Out Comp}
      _ = {In.get}
      if Comp.state.comp \= false then
	 {Comp.state.comp start}
      end
   end
   proc {Stop In Out Comp}
      _ = {In.get}
      if Comp.state.comp \= false then
	 {Comp.state.comp stop}
      end
   end
   proc {Load In Out Comp} Type C in 
      Type = {In.get}
      C = {Fractalide.load comp {VirtualString.toAtom Type}}
      Comp.state.comp := C
      {Out.controlType set(Type)}
   end
   proc {Delete In Out Comp}
      _ = {In.get}
      % if Comp.state.comp \= false then
      % 	 {Comp.state.comp halt}
      % end
      Comp.state.comp := false
      {Out.controlType set("-")}
      {Out.canvas delete}
      {Out.control delete}
      {Out.out delete}
   end
   proc {Mouse In Out Comp} IP in
      IP = {In.get}
      if (IP.button == 1) then
	 {Out.control display}
      end
   end
   
end