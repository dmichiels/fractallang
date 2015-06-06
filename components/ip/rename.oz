functor
export Component
define
   Component = comp(description:"rename the label of an action with the port name"
		     inArrayPorts(rename)
		     outPorts(out)
		     procedure(proc{$ Ins Out Comp} 
				  {Record.forAllInd Ins.rename
				   proc{$ I V}
				      if {V.size} > 0 then
					 {Out.out {Record.adjoin {V.get} I}}
				      end
				   end}
			       end)
		   )
end