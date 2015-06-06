functor
export Component
define
   Component = comp(description:"rename the label of an action with the port name"
		    inPorts(pop)
		    outPorts(out)
		    outArrayPorts(action)
		    procedure(proc{$ Ins Out Comp} 
				 {SendOut Out {Ins.pop.get}.1}
			      end)
		   )
   proc {SendOut OutPorts Event}
      if {List.member {Label Event} {Arity OutPorts.action}} then
	 {OutPorts.action.{Label Event} Event}
      else
	 {OutPorts.out Event}
      end
   end

end