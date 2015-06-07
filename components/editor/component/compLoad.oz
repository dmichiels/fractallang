functor
import
   QTk at 'x-oz://system/wp/QTk.ozf'
export Component
define
   Default = "/home/denis/fractalide/fractallang/components/"
   Component = comp(description:""
		    inPorts(input)
		    outPorts(output)
		    procedure(proc{$ Ins Out Comp} Type WithExt Final in
				 _ = {Ins.input.get}
				 Type = {QTk.dialogbox load(initialdir:"./components/" 
							    title:"Which component?"
							    $)}
				 WithExt = {List.drop Type {Length Default}}
				 Final = {Reverse {List.drop {Reverse WithExt} 4}}
				 {Out.output Final}
			      end)
		   )
end