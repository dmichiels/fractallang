functor
import
   Comp at '../../../lib/component.ozf'
export
   new: CompNewGen
define
   Unique = {NewCell 0}
   fun {CompNewGen Name}
      {Comp.new comp(
		   name:Name type:"editor/component/addName"
		   inPorts(input)
		   outPorts(output)
		   procedure(proc{$ Ins Out Comp} NewName in
				_ = {Ins.input.get}
				NewName = "name"#(@Unique)
				Unique := @Unique + 1
				{Out.output addinArrayPort(Comp.options.name NewName)}
			     end)
		   options(name:_)
		   )
      }
   end
end