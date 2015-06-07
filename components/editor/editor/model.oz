functor
import
   Fractalide at '../../../lib/fractalide.ozf'
export Component
define
   Unique = {NewCell 0}
   Component = comp(description:"the model for the graph"
		    inPorts(newComponent)
		    inArrayPorts(components)
		    outPorts(out)
		    outArrayPorts(components)
		    state(nodes:nodes
			  edges:nil
			  inLinks:nil
			  outLinks:nil)
		    procedure(proc{$ Ins Out Comp}
				 if {Ins.newComponent.size} > 0 then {ProcComp Ins.newComponent Out Comp} end
				 {ProcComponents Ins.components Out Comp}
			      end)
		   )
   proc {ProcComp In Out Comp} Name C Ack Ack2 in
      _ = {In.get}
      Name = {VirtualString.toAtom "Component"#@Unique}
      Unique := @Unique + 1
      C = {Fractalide.load Name 'editor/movable'}
      {Wait C}
      {C send(options opt(comp:'editor/component') Ack)}
      {Wait Ack}
      {C bind(out Comp.entryPoint components#Name)}
      {Comp.entryPoint bind(components#Name C 'in')}
      Comp.state.nodes := {Record.adjoinAt Comp.state.nodes Name node(x:100 y:100 name:Name displayComp:C)}
      {C send('in' create(100 100 name:Name) Ack2)}
      {Wait Ack2}
   end
   proc {ProcComponents Ins Out Comp}
      {Record.forAllInd Ins
       proc{$ Name Port}
	  if {Port.size} > 0 then IP in
	     IP = {Port.get}
	     case IP
	     of control(delete) then
		{Comp.state.nodes.Name.displayComp unBound(out Comp.entryPoint)}
		{Comp.entryPoint unBound(components#Name Comp.state.nodes.Name.displayComp)}
		Comp.state.nodes := {Record.subtract Comp.state.nodes Name}
	     else
		{Out.out IP}
	     end
	  end
       end}
   end
end
