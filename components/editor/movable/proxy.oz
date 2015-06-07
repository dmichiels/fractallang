functor
import
   Fractalide at '../../../lib/fractalide.ozf'
export
   Component
define
   Component = comp(description:"proxy"
		    inPorts('in' comp error)
		    outPorts(out comp)
		    outArrayPorts(action)
		    options(comp:_)
		    state(comp:_)
		    procedure(proc{$ Ins Out Comp} 
				 if {Ins.'in'.size} > 0 then {In Ins.'in' Out Comp} end
				 if {Ins.comp.size} > 0 then {Redirect Ins.comp Out Comp} end
				 if {Ins.error.size} > 0 then {Out.'ERROR' {Ins.error.get}} end
			      end)
		    )
   proc {In In Out Comp} IP in
      IP = {In.get}
      if {Not {IsDet Comp.state.comp}} then C Ack in
	 C = {Fractalide.load comp Comp.options.comp}
	 {Wait C}
	 {C bind(out Comp.entryPoint comp)}
	 {C bind('ERROR' Comp.entryPoint error)}
	 {Comp.entryPoint bind(comp C 'in')}
	 Comp.state.comp := C
	 {C start}
	 {C send('in' IP Ack)}
	 {Wait Ack}
      else
	 {Out.comp IP}
      end
   end
   proc {Redirect In Out Comp}
      {SendOut Out {In.get}}
   end
   proc {SendOut OutPorts Event}
      if {List.member {Label Event} {Arity OutPorts.action}} then
	 {OutPorts.action.{Label Event} Event}
      else
	 {OutPorts.out Event}
      end
   end
end