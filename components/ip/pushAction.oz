functor
export Component
define
   Component = comp(description:"rename the label of an action with the port name"
		     inArrayPorts(push)
		     outPorts(out)
		     procedure(proc{$ Ins Out Comp} 
				  {Record.forAllInd Ins.push
				   proc{$ I V}
				      if {V.size} > 0 then R in
					 R = {Record.make I [1]}
					 R.1 = {V.get}
					 {Out.out R}
				      end
				   end}
			       end)
		   )
end