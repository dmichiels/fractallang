functor
import
   Comp at '../../lib/component.ozf'
export
   new: New
define
   fun {New Name} 
      {Comp.new component(
		   name: Name type:buttonCreate
		   outPorts(ui_out)
		   inPorts(ui_in(proc {$ In Out Comp} NewUI D FuturOut in
				     NewUI = {In.get}
				     D = button(action: proc{$} {FuturOut button_clicked} end
						text:default
					       )
				     {Out.ui_out fun{$ FO}
						    FuturOut = FO
						    {Record.adjoin {Record.adjoin D NewUI} button}
						 end
				     }
				 end)
			   )
		   )
      }
   end
end
     