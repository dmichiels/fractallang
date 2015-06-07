functor
export Component
define
   Component = comp(description:"create comp for movable"
		    inPorts('in')
		    outPorts(window proxyOption proxy)
		    procedure(proc{$ Ins Out Comp} IP in
				 IP = {Ins.'in'.get}
				 {Out.proxyOption opt(comp:IP.comp)}
				 {Out.proxy create(IP.create)}
			      end)
		   )
end
		    