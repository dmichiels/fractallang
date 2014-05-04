functor
import
   Comp at '../../../lib/component.ozf'
export
   new: CompNewGen
define
   fun {CompNewGen Name}
      {Comp.new comp(
		   name:Name type:"editor/component/center"
		   inPorts(
		      input(proc{$ In Out Comp} IP X Y in
			       IP = {In.get}
			       X = (IP.1+IP.3)/2.0
			       Y = (IP.2+IP.4)/2.0
			       {Out.rect IP}
			       {Out.text setCoords(X Y)}
			    end)
		      )
		   outPorts(rect text)
		   )
      }
   end
end