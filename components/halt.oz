functor
export
   Component
define
   Component = comp(description:"Halt the graph"
		    inArrayPorts('in')
		    procedure(proc{$ Ins Out Comp}
				 {Comp.parentEntryPoint halt}
			      end)
		   )

end