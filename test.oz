functor
import
   F at './lib/fractalide.ozf'
   System
define
   D1 = {F.load d display}
   D2 = {F.load d2 display}
   {System.show 1}
   {D1 send(input kikou1 _)}
   {D2 send(input kikou2 _)}
   {D1 halt}
   {Delay 1000}
   {System.show 2}
   {D1 send(input kikou1 _)}
   {D2 send(input kikou2 _)}
   {Delay 1000}
   {D2 halt}
   {System.show 3}
   {D1 send(input kikou1 _)}
   {D2 send(input kikou2 _)}

end