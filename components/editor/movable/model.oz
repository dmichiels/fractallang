functor
export Component
define
   Component = comp(description:"model for movable"
		    inPorts('in' position)
		    outPorts(window proxy)
		    state(x:0 y:0)
		    procedure(proc{$ Ins Out Comp} 
				 if {Ins.'in'.size} > 0 then {ProcIn Ins.'in' Out Comp} end
				 if {Ins.position.size} > 0 then {ProcPosition Ins.position Out Comp} end
			      end)
		   )
   proc {ProcIn In Out Comp} IP X Y Create in
      IP = {In.get}
      X = IP.1
      Y = IP.2
      Comp.state.x := X
      Comp.state.y := Y
      Create = {Record.subtractList IP [1 2]}
      {Out.window create(X Y)}
      {Out.proxy Create}
   end
   proc {ProcPosition In Out Comp} IP in
      IP = {In.get}
      Comp.state.x := Comp.state.x + IP.1
      Comp.state.y := Comp.state.y + IP.2
      {Out.window move(IP.1 IP.2)}
   end
end
		    