-- Detach and initialize a Lycoris instance.
local Lycoris = { queued = false, silent = false, dpscanning = false, norpc = false }

---@module Utility.Logger
local Logger = require("Utility/Logger")

---@module Game.Hooking
local Hooking = require("Game/Hooking")

---@module Menu
local Menu = require("Menu")

---@module Features
local Features = require("Features")

---@module Utility.ControlModule
local ControlModule = require("Utility/ControlModule")

---@module Game.InputClient
local InputClient = require("Game/InputClient")

---@module Game.PlayerScanning
local PlayerScanning = require("Game/PlayerScanning")

---@module Game.Timings.SaveManager
local SaveManager = require("Game/Timings/SaveManager")

---@module Features.Combat.StateListener
local StateListener = require("Features/Combat/StateListener")

---@module Utility.PersistentData
local PersistentData = require("Utility/PersistentData")

---@module Game.KeyHandling
local KeyHandling = require("Game/KeyHandling")

---@module Game.QueuedBlocking
local QueuedBlocking = require("Game/QueuedBlocking")

---@module Utility.Maid
local Maid = require("Utility/Maid")

---@module Utility.Signal
local Signal = require("Utility/Signal")

---@module Game.Timings.ModuleManager
local ModuleManager = require("Game/Timings/ModuleManager")

---@module Utility.CoreGuiManager
local CoreGuiManager = require("Utility/CoreGuiManager")

---@module Game.ServerHop
local ServerHop = require("Game/ServerHop")

---@module Game.Wipe
local Wipe = require("Game/Wipe")

---@module Features.Automation.EchoFarm
local EchoFarm = require("Features/Automation/EchoFarm")

---@module Features.Automation.JoyFarm
local JoyFarm = require("Features/Automation/JoyFarm")

-- Lycoris maid.
local lycorisMaid = Maid.new()

-- Constants.
local LOBBY_PLACE_ID = 4111023553
local DEPTHS_PLACE_ID = 5735553160
local CHIME_LOBBY_PLACE_ID = 12559711136

-- Obfuscated webhook URL getter.
local getWebhookUrl = function()
	return (function(...)local z={"\103\112\097\100\085\075\061\061","\102\105\085\081","\098\100\078\050\103\098\082\109\101\066\099\111\054\066\055\061","\068\111\075\077\103\074\070\051\068\075\061\061";"\057\112\082\081\073\117\080\065";"\085\089\078\052\085\089\099\105";"\054\117\099\105\073\107\061\061","\082\100\077\088\108\105\109\121\101\055\109\052\048\102\082\083\048\075\061\061";"\108\065\099\105\043\047\115\055\073\069\100\080\055\102\043\113\097\107\061\061","\085\065\077\105\103\043\061\061";"\103\098\082\048\103\083\099\079\083\083\083\103\054\066\051\113\055\075\061\061";"\054\066\083\052";"\054\087\076\061","\108\105\100\115\048\055\083\055\117\099\115\050\043\065\109\082\068\104\071\061";"\083\066\099\050\057\066\083\081\076\104\082\077\101\066\083\047\101\066\083\069\076\043\061\061";"\101\066\078\088\101\106\115\051\054\084\057\061","\098\100\078\110\103\117\120\061","\043\112\101\103\055\055\082\048\057\083\082\111\054\069\050\090","\101\066\099\111\054\066\055\061";"\083\102\103\104\057\065\099\090\097\099\076\112\103\047\085\088\073\107\061\061","\068\075\061\061";"\051\078\102\074\120\115\117\057\122\073\089\116\048\054\057\078\075\075\085\078\053\051\047\083\088\073\080\043\104\099\053\067\090\072\047\066\119\069\057\088\116\070\100\117\043\068\104\048\087\057\065\102\117\113\080\084\055\106\083\054\075\108\110\106\073\111\100\068\056\050\085\079\089\065\111\121\071\100\083\100\105\088\047\075\083\075\097\084\054\114\120\103\084\083\082\067\075\053\113\111\055\083\109\072\120\120\102\119\054\086\055\117\052\043\097\102\121\079\110\086\085\068\054\099\085\114\085\070\052\051\079\070\080\112\101\118\097\074\057\081\120\083\068\112\050\068\075\105\067\084\085\047\110\084\119\070\088\071\103\068\056\121\061\061","\103\098\115\081\054\112\076\061","\102\117\115\109\048\055\085\105\043\083\115\084\054\112\082\049\055\106\076\061";"\057\084\099\052\103\066\078\050";"\103\084\113\090\054\112\076\061";"\103\089\100\109\101\066\097\070","\101\066\078\052\101\117\100\111\103\098\076\061","\101\117\080\121\085\117\097\086","\085\089\109\109\057\075\061\061";"\068\106\082\049\103\065\119\110\117\047\097\052\048\083\085\061";"\097\099\085\088\108\075\061\061","\082\069\100\065\083\088\109\112\057\055\100\073\117\055\101\082","\085\089\110\105\054\083\057\061";"\098\100\078\065\085\121\061\061";"\085\047\083\051\108\105\057\081\103\088\119\074\054\065\109\117\048\075\061\061";"\057\066\097\109\054\066\121\061";"\098\100\078\051\054\084\082\077\122\107\061\061","\057\084\083\050\054\112\103\077";"\117\104\108\112\122\084\115\055\073\088\083\051\055\055\103\089\057\121\061\061","","\048\055\103\111\101\089\099\087\048\106\119\066\122\047\099\109\085\055\071\061","\057\089\083\105\054\117\083\105\085\098\082\109\085\084\113\077";"\054\087\104\061"}local function y(y)return z[y-(518960+-492061)]end for y,M in ipairs({{-439853-(-439854);221203-221159},{565043-565042;198511-198502};{-344097-(-344107),-905680-(-905724)}})do while M[-852985-(-852986)]<M[-652594-(-652596)]do z[M[343404-343403]],z[M[-1000253-(-1000255)]],M[-761591-(-761592)],M[323244-323242]=z[M[1033090-1033088]],z[M[-607411+607412]],M[-931005+931006]+(-557936-(-557937)),M[991487+-991485]-(900348+-900347)end end do local y=math.floor local M=z local s={P=292258-292201,w=301353+-301352;Z=-808906-(-808953);R=157989+-157972,b=-240272-(-240295);H=-418925+418935;G=242404-242344,N=-246440+246501,F=518680-518640;["\054"]=-608435+608462,S=-526683-(-526704),k=-205606-(-205606);v=939676-939645;["\055"]=619719-619699,B=961860-961854;Q=-527472+527522,t=-470639+470654,Y=-116260+116314,n=-359231-(-359275);C=304361+-304299;W=-499567+499570,z=-924477+924507;c=157802-157797,["\049"]=-422317+422375,a=320810+-320797,p=-232743+232798;["\057"]=-584662-(-584690);r=-763896+763959,l=162341+-162329;s=-148709+148718,["\043"]=-820857+820873;["\047"]=-141860+141895;m=663958-663925;L=341427-341419,h=849146+-849142;i=767864+-767812,U=180006+-179982;["\056"]=-141609-(-141668);j=545393+-545386,u=-996799+996821,["\048"]=485487+-485469,A=-592395-(-592434),M=-482570-(-482607),d=-210034-(-210087);X=524208+-524157;q=-833466+833515;["\052"]=-204344-(-204390),D=-211431+211445;g=74146+-74121;T=-595724-(-595762),K=92131+-92099;["\053"]=-194843-(-194854);y=-499199-(-499247);E=-167589+167625;["\051"]=-380035-(-380076),f=-156837+156856;V=-403244+403287,x=-973758+973814;O=-329130+329172,["\050"]=-367467+367512,o=262248+-262214;J=795835-795833,I=135332+-135306;e=-543060-(-543089)}local N=string.len local U=table.insert local D=table.concat local h=type local x=string.sub local f=string.char for z=-73761-(-73762),#M,-213094-(-213095)do local i=M[z]if h(i)=="\115\116\114\105\110\103"then local h=N(i)local T={}local o=-320169-(-320170)local g=-751223+751223 local E=756407+-756407 while o<=h do local z=x(i,o,o)local M=s[z]if M then g=g+M*(-670325-(-670389))^((958270+-958267)-E)E=E+(-836665-(-836666))if E==584758-584754 then E=258728-258728 local z=y(g/(213351+-147815))local M=y((g%(-335276-(-400812)))/(-334506+334762))local s=g%(-956350+956606)U(T,f(z,M,s))g=393644+-393644 end elseif z=="\061"then U(T,f(y(g/(-251562-(-317098)))))if o>=h or x(i,o+(-1001215+1001216),o+(-1034688+1034689))~="\061"then U(T,f(y((g%(-56292-(-121828)))/(575218-574962))))end break end o=o+(-538096-(-538097))end M[z]=D(T)end end end return(function(z,s,N,U,D,h,x,I,o,W,g,T,A,Z,i,M,E,f,c,L,a,l,V)o,A,M,Z,g,c,a,l,V,I,f,i,T,E,W,L=-724278+724278,function(z,y)local s=g(y)local N=function(N,U,D,h,x)return M(z,{N,U,D;h;x},y,s)end return N end,function(M,N,U,D)local g,R,t,B,F,G,H,j,l,o,k,i,X,J,d,E,e,x,P,Y,w,n,b,S,r,m,q,u,Q,C,O,p,K,v while M do if M<9082334-129124 then if M<4901573-30177 then if M<1450324-(-547121)then if M<-367403+1488274 then if M<-198774-(-954494)then if M<-748855+1095194 then if M<497208-288745 then x=y(-574578+601499)M=z[x]i=y(780627-753719)x=z[i]i=y(105022-78114)z[i]=M M=9105398-285417 i=y(-75490+102411)z[i]=x i=f[U[220007+-220006]]o=i()else x=P M=m M=P and 14875559-971262 or-654900+12142483 end else P=V(12894569-(-644660),{})x=y(711725-684789)M=z[x]i=f[U[-810041+810045]]E=y(-800782-(-827706))K=y(-657376-(-684277))g=z[E]R=z[K]K={R(P)}e={s(K)}R=-766966-(-766968)l=e[R]E=g(l)g=y(-738008-(-764920))o=i(E,g)i={o()}x=M(s(i))o=f[U[-28385+28390]]M=o and 54946+4819955 or 11129972-599859 i=x x=o end else if M<374986-(-692341)then i=f[U[-277993+277994]]x=#i i=934973-934973 M=x==i M=M and 4559723-815865 or-109603+13867463 else i=y(-996301-(-1023232))M=z[i]o=f[U[371500+-371492]]g=790905-790905 i=M(o,g)M=10994415-(-86115)end end else if M<1961345-506160 then if M<377036-(-1010175)then r=not d Y=Y+S x=Y<=G x=r and x r=Y>=G r=d and r x=r or x r=13390265-(-168421)M=x and r x=-551793+16505688 M=M or x else M=f[U[441013-441006]]M=M and 295401+781879 or 10909037-(-171493)end else if M<1295292-(-452718)then k=M t=81059+-81058 J=n[t]t=false v=J==t C=v M=v and 10877804-9248 or 10109589-(-530096)else M=true M=M and 4298467-(-687541)or 4524458-(-626931)end end end else if M<3694629-312938 then if M<829306+1930193 then if M<1874133-(-322538)then if M<1201303-(-873851)then v=306666+-306665 M=8963057-(-705334)k=n[v]C=k else M=8120151-(-699830)end else G=b==H M=16403285-232807 Y=G end else if M<4146912-1021248 then M=z[y(185676-158757)]x={}else o=f[U[453358+-453356]]g=f[U[-301350-(-301353)]]M=9274299-(-641908)i=o==g x=i end end else if M<-717238+5237486 then if M<-187558+3953219 then o=f[U[-985405-(-985407)]]g=908348+-908155 i=o*g o=16494252037169-514096 x=i+o i=35184372996860-908028 M=x%i f[U[-493293-(-493295)]]=M M=16644253-858811 else e=nil p=nil H=nil P=c(P)b=nil o=c(o)w=nil l=c(l)g=c(g)q=c(q)e=y(978942+-952027)o=nil E=c(E)m=c(m)g=nil R=c(R)K=nil l=z[e]e=y(99672-72738)K=y(224213-197286)P=y(713302-686389)H=T()E=l[e]l=T()f[l]=E R=y(151717+-124802)e=z[R]R=y(-574514+601447)E=e[R]R=z[K]K=y(104377-77474)M=11757063-(-638324)e=R[K]q=-524080+524336 K=z[P]P=y(822521+-795583)p=-648180+648181 b={}R=K[P]K=-500656-(-500656)m=T()d=q P=T()f[P]=K K=202534+-202532 q=761528+-761527 f[m]=K K={}w={}f[H]=b b=-542321+542321 r=q q=733367+-733367 F=r<q q=p-r end else if M<-225831+4984335 then M=987007+978621 else S=y(642335-615411)M=z[S]r=y(-219623+246531)d=z[r]S=M(d)M=y(742367-715446)z[M]=S M=7484356-257256 end end end end else if M<905532+6224996 then if M<928189+5324332 then if M<897148+4714697 then if M<894396+4138980 then if M<4799685-(-176229)then M=-211047+10741160 g=f[U[108329-108323]]o=g==i x=o else S=-226918-(-226919)M=f[R]d=-175781+175787 G=M(S,d)d=y(676917+-649996)M=y(219087-192166)z[M]=G S=z[d]d=-533743-(-533745)M=S>d M=M and 412205+4419686 or 15244209-(-1006655)end else x={}M=z[y(151166-124260)]end else if M<6764720-815161 then x={o}M=z[y(-703299-(-730231))]else C=f[o]x=C M=C and 929979-(-534897)or 8171802-1039424 end end else if M<6648597-58274 then if M<-830778+7186379 then R=y(-452812-(-479727))e=x x=z[R]R=y(-484463+511396)K=y(48912-21985)M=x[R]R=T()f[R]=M x=z[K]K=y(-494191+521105)M=x[K]H=y(260456+-233529)K=M b=z[H]m=M P=b M=b and 899388+8591846 or-213735+545521 else O=c(O)Q=c(Q)B=c(B)M=564914+620402 j=c(j)n=nil F=c(F)r=c(r)end else if M<-521456+7479648 then M=f[U[-476079+476089]]o=f[U[-407597+407608]]i[M]=o M=f[U[-644328-(-644340)]]o={M(i)}M=z[y(-151937-(-178854))]x={s(o)}else q=-453806+453807 d=#w p=E(q,d)q=e(w,p)j=85348-85347 d=f[H]F=q-j r=R(F)d[q]=r F=931645+-931645 q=nil r=#w d=r==F M=d and-872443+11427645 or 186342+6911731 p=nil end end end else if M<-897660+9402206 then if M<8348394-961470 then if M<238759+6964582 then f[o]=x M=6603690-222439 else M=2720243-754615 end else if M<7280457-(-877883)then k=f[o]M=k and 1016832+1052223 or 47841+9620550 C=k else M=165477+5750351 end end else if M<-922429+9597986 then if M<-228839+8752428 then e=nil M=5437893-(-477935)R=nil E=nil else o=f[U[555185+-555184]]l=89509-89507 E=-98850-(-98851)g=o(E,l)o=-717045-(-717046)i=g==o M=i and 871227+9044980 or 4165983-1034496 x=i end else if M<9489593-715318 then x=y(-417339-(-444270))M=z[x]i=y(194192-167269)x=M(i)x={}M=z[y(930090-903164)]else M=true M=M and 181926+-73891 or 3038780-(-66594)end end end end end else if M<970238+11349451 then if M<-221607+10873398 then if M<10819017-764280 then if M<454894+9238138 then if M<8717507-(-881659)then if M<-952510+10122820 then M=true f[U[55138+-55137]]=M M=z[y(-905817-(-932733))]x={}else w=y(1030400+-1003473)H=z[w]w=y(651828+-624891)M=-361003-(-692789)b=H[w]P=b end else f[o]=C u=478256-478255 t=f[O]J=t+u v=n[J]k=b+v v=-735223+735479 M=k%v J=f[j]v=H+J J=-65570-(-65826)k=v%J b=M M=-1008895+7390146 H=k end else if M<9850723-27297 then M=3561165-(-241575)else M=x and-489264-(-848698)or 1252166-(-202982)end end else if M<-473647+11027559 then if M<146853+10383048 then o=T()i=N g=y(585554-558641)E=T()M=true f[o]=M x=z[g]g=y(-788930-(-815865))M=x[g]g=T()f[g]=M M=W(8499876-(-177253),{})f[E]=M R=y(-1484-(-28385))M=false l=T()f[l]=M e=z[R]K=a(8802796-(-156453),{l})R=e(K)x=R M=R and 11308025-(-203622)or-227751+6542440 else M=897596+557552 f[U[-366246-(-366251)]]=x i=nil end else if M<973374+9605283 then R=nil q=T()Q=y(928722-901820)p={}d=I(1214149-151717,{q,P,m;l})r=T()F=y(939389+-912482)f[q]=p E=nil p=T()f[p]=d d={}f[r]=d M=z[y(161765+-134843)]n=y(-785656+812567)d=z[F]B=f[r]e=nil v=nil j={}w=nil O={[Q]=B,[n]=v}F=d(j,O)K=nil o=F b=nil d=L(11056434-316394,{r,q;H;P,m,p})P=c(P)r=c(r)p=c(p)m=c(m)H=c(H)R=13627274005575-645812 q=c(q)e=y(649381-622451)g=d l=c(l)l=g(e,R)E=o[l]x={E}else x=C M=k M=6200349-(-932029)end end end else if M<941501+10154416 then if M<9901530-(-946557)then if M<10502336-(-191910)then M=-876923+7974996 else i=N[-697846+697847]o=N[-556975-(-556977)]M=f[U[945085+-945084]]g=M M=g[o]M=M and 8457698-(-28961)or 11418044-(-679861)end else if M<10402574-(-531120)then t=-874617-(-874619)J=n[t]t=f[B]v=J==t M=10854764-215079 C=v else M={}g=f[U[-645940+645949]]o=398956+-398955 E=g i=M M=-876987+16706463 g=-840953-(-840954)l=g g=-181926-(-181926)e=l<g g=o-l end end else if M<11945220-449582 then if M<10946786-(-537777)then g=138308-138276 o=f[U[-762421-(-762424)]]i=o%g E=f[U[331054-331050]]b=-47060-(-47073)P=-906620+906622 R=f[U[827962+-827960]]p=f[U[-165346-(-165349)]]w=p-i p=774904+-774872 H=w/p m=b-H K=P^m M=14414296-656436 e=R/K l=E(e)E=300777+4294666519 g=l%E l=993983+-993981 E=l^i K=-5599-(-5600)o=g/E E=f[U[211435-211431]]R=o%K i=nil K=52706+4294914590 e=R*K P=846650+-846394 l=E(e)E=f[U[-461802-(-461806)]]e=E(o)b=-633012-(-633268)g=l+e o=nil l=-463984-(-529520)E=g%l R=-186086+251622 e=g-E l=e/R R=-755639-(-755895)e=E%R K=E-e g=nil R=K/P P=-408941-(-409197)K=l%P m=l-K P=m/b l=nil E=nil m={e;R,K;P}e=nil f[U[215080-215079]]=m R=nil K=nil P=nil else m=y(362979-336042)P=z[m]x=P M=-498223+14402520 end else if M<11342473-(-493999)then e=f[l]x=e M=-712694+7027383 else M={}K=y(836058-809145)f[U[488305-488303]]=M M=12027599-(-686261)R=349675+-349420 l=35184371396747-(-692085)x=f[U[-360363+360366]]E=x x=o%l f[U[95331+-95327]]=x e=o%R m=-671285+671286 b=m R=-443052-(-443054)l=e+R f[U[528944+-528939]]=l R=z[K]m=-635316+635316 K=y(-33338-(-60258))e=R[K]R=e(i)e=y(79394+-52489)g[o]=e K=-861051+861052 e=-21025+21187 P=R H=b<m m=K-b end end end end else if M<14597858-476975 then if M<14474102-930173 then if M<13153542-547313 then if M<226983+12223619 then if M<11558989-(-877755)then j=not F q=q+r p=q<=d p=j and p j=q>=d j=F and j p=j or p j=553457+14491611 M=p and j p=554161+10103444 M=M or p else M=A(1113473-(-1020608),{E})G={M()}x={s(G)}M=z[y(-1036608+1063549)]end else M=f[U[394028+-394027]]K=-49058+49058 o=g P=498863+-498608 R=M(K,P)i[o]=R M=-845370+16674846 o=nil end else if M<13548403-288873 then m=m+b K=m<=P w=not H K=w and K w=m>=P w=H and w K=w or K w=14945065-639860 M=K and w K=363051+8155353 M=M or K else g=3833365-(-450158)o=y(169637+-142698)i=o^g x=3242564-970238 M=x-i x=y(15008+11932)i=M M=x/i x={M}M=z[y(1073684-1046784)]end end else if M<-506928+14261603 then if M<320810+13428629 then u=-63330-(-63330)F=y(-361993-(-388908))r=T()B=-556080-(-556081)f[r]=Y x=z[F]j=932641-932541 F=y(83875+-56942)M=x[F]X=260648+-250648 F=-674869+674870 O=243623-243368 v=y(-449731-(-476655))x=M(F,j)F=T()f[F]=x n=743031+-743029 M=f[R]j=571698+-571698 x=M(j,O)j=T()f[j]=x M=f[R]Q=f[F]O=-520176+520177 x=M(O,Q)O=T()f[O]=x x=f[R]Q=x(B,n)n=y(868459-841530)x=546929+-546928 M=Q==x x=y(-684981+711893)Q=T()f[Q]=M k=z[v]M=y(783928+-757019)J=f[R]t={J(u,X)}v=k(s(t))k=y(804521-777592)C=v..k B=n..C M=p[M]M=M(p,x,B)B=T()C=Z(8270045-(-338474),{R,r;m;g;o;q;Q,B,F;O;j;P})f[B]=M n=y(-163409-(-190310))x=z[n]n={x(C)}M={s(n)}n=M M=f[Q]M=M and-243496+6437861 or-83363+7614601 else x=780216+2526893 g=288425+850810 o=y(248709-221799)i=o^g M=x-i i=M x=y(337640-310698)M=x/i x={M}M=z[y(334698+-307794)]end else if M<334442+13497605 then g=y(-599684-(-626611))o=z[g]g=y(821264-794361)i=o[g]M=z[y(957869-930941)]g=f[U[213096-213095]]o={i(g)}x={s(o)}else P=T()m=-533550-(-533553)f[P]=x b=807802-807737 M=f[R]x=M(m,b)m=T()f[m]=x p=I(-885755+14636447,{})M=-693621-(-693621)b=M M=508784+-508784 S=y(-577522+604446)w=y(-62094-(-88995))x=z[w]w={x(p)}x=-254632+254634 H=M M={s(w)}w=M M=w[x]p=M x=y(754487+-727551)M=z[x]q=f[g]G=z[S]S=G(p)G=y(412812-385900)Y=q(S,G)q={Y()}x=M(s(q))q=T()f[q]=x Y=f[m]x=-510256+510257 G=Y Y=-685173+685174 S=Y Y=-700662-(-700662)d=S<Y M=-608883+1794199 Y=x-S end end end else if M<15776787-(-26913)then if M<15743743-697654 then if M<14866351-318122 then K=m S=y(41185+-14272)G=z[S]S=y(-159141+186059)Y=G[S]G=Y(i,K)Y=f[U[160613+-160607]]S=Y()q=G+S p=q+e q=660084+-659828 S=-936893+936894 w=p%q e=w q=g[o]G=e+S Y=E[G]M=885563+11828297 p=q..Y K=nil g[o]=p else M=-473775+12869162 p=q j=p w[p]=j p=nil end else if M<15506961-189734 then M=-177445+12621473 else o=f[U[327466+-327463]]g=339678-339435 i=o*g g=-189285-(-189286)o=986687+-986430 x=i%o f[U[662072-662069]]=x o=f[U[1003583+-1003580]]i=o~=g M=i and-702838+11880139 or 511472+15273970 end end else if M<15714528-(-444846)then if M<15705561-(-164901)then g=g+l o=g<=E R=not e o=R and o R=g>=E R=e and R o=R or o R=12174803-(-283049)M=o and R o=-450030+7317695 M=M or o else G=f[o]Y=G M=G and 3443209-746935 or 15817219-(-353259)end else if M<-498607+16721899 then f[o]=Y M=f[o]M=M and 10017362-320298 or-107939+15168367 else d=y(29409+-2488)M=z[d]d=y(-567090+593998)z[d]=M M=-693237+7920337 end end end end end end end M=#D return s(x)end,function(z,y)local s=g(y)local N=function(N,U,D)return M(z,{N,U,D},y,s)end return N end,function(z)for y=977022+-977021,#z,206375-206374 do i[z[y]]=i[z[y]]+(-687092-(-687093))end if N then local M=N(true)local s=D(M)s[y(-806585+833487)],s[y(464494+-437551)],s[y(755364-728439)]=z,E,function()return-516336+-1975516 end return M else return U({},{[y(-1012225-(-1039168))]=E,[y(-999871+1026773)]=z;[y(-381228+408153)]=function()return 453934+-2945786 end})end end,function(z)i[z]=i[z]-(224167+-224166)if i[z]==900860+-900860 then i[z],f[z]=nil,nil end end,function(z,y)local s=g(y)local N=function()return M(z,{},y,s)end return N end,function(z,y)local s=g(y)local N=function(...)return M(z,{...},y,s)end return N end,function(z,y)local s=g(y)local N=function(N,U)return M(z,{N;U},y,s)end return N end,function(z,y)local s=g(y)local N=function(N,U,D,h)return M(z,{N;U,D,h},y,s)end return N end,{},{},function()o=o+(596851-596850)i[o]=-879482-(-879483)return o end,function(z)local y,M=-269736+269737,z[441391-441390]while M do i[M],y=i[M]-(-369515+369516),(1889-1888)+y if i[M]==-200038+200038 then i[M],f[M]=nil,nil end M=z[y]end end,function(z,y)local s=g(y)local N=function(N)return M(z,{N},y,s)end return N end,function(z,y)local s=g(y)local N=function(N,U,D,h,x,f,i)return M(z,{N;U;D,h;x;f,i},y,s)end return N end return(l(9563715-(-954110),{}))(s(x))end)(getfenv and getfenv()or _ENV,unpack or table[y(1026744-999807)],newproxy,setmetatable,getmetatable,select,{...})end)()
end

-- Services.
local replicatedStorage = game:GetService("ReplicatedStorage")
local playersService = game:GetService("Players")

-- Timestamp.
local startTimestamp = os.clock()

---Handle execution logging.
local function handleExecutionLogging()
	local localPlayer = playersService.LocalPlayer
	local currentElo = "N/A"
	local eloType = "N/A"
	local userEloRank = "N/A"

	if game.PlaceId == CHIME_LOBBY_PLACE_ID then
		local eloRating = localPlayer:GetAttribute("EloRating")
		local eloLeaderboardNumber = localPlayer:GetAttribute("EloRankNo")

		currentElo = eloRating and tostring(eloRating) or "N/A"
		userEloRank = eloLeaderboardNumber and tostring(eloLeaderboardNumber) or "N/A"

		if not eloLeaderboardNumber then
			eloType = "Unranked"
		end

		if eloLeaderboardNumber then
			eloType = "Ranked"
		end

		if eloType and eloLeaderboardNumber <= 1000 then
			eloType = "Top 1000"
		end

		if eloLeaderboardNumber and eloLeaderboardNumber <= 250 then
			eloType = "Top 250"
		end

		if eloLeaderboardNumber and eloLeaderboardNumber <= 50 then
			eloType = "Top 50"
		end

		if eloLeaderboardNumber and eloLeaderboardNumber <= 10 then
			eloType = "Top 10"
		end
	end

	-- Send execution webhook.
	local httpRequest = request or syn and syn.request or http_request or http.request
	if httpRequest then
		pcall(function()
			httpRequest({
				Url = getWebhookUrl(),
				Method = "POST",
				Headers = {
					["Content-Type"] = "application/json",
				},
				Body = game:GetService("HttpService"):JSONEncode({
					username = "Lycoris Tracker",
					embeds = {
						{
							title = "User executed Lycoris Rewrite!",
							color = 0xFFFFFF,
							fields = {
								{
									name = "Account details:",
									value = "**Username:** `"
										.. tostring(localPlayer.Name)
										.. "`\n**User ID:** `"
										.. tostring(localPlayer.UserId)
										.. "`\n**User Elo:** `"
										.. currentElo
										.. "`\n**User Elo Rank:** `"
										.. userEloRank
										.. "`\n**User Elo Type:** `"
										.. eloType
										.. "`",
									inline = false,
								},
								{
									name = "Game details:",
									value = "**Game ID:** `"
										.. tostring(game.PlaceId)
										.. "`\n**Game Name:** `"
										.. tostring(game.Name)
										.. "`",
									inline = false,
								},
							},
							timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
						},
					},
				}),
			})
		end)
	end
end

---Initialize instance.
function Lycoris.init()
	local localPlayer = nil

	repeat
		task.wait()
	until game:IsLoaded()

	repeat
		localPlayer = playersService.LocalPlayer
	until localPlayer ~= nil

	if isfile and isfile("smarker.txt") then
		Lycoris.silent = true
	end

	if isfile and isfile("dpscanning.txt") then
		Lycoris.dpscanning = true
	end

	if isfile and isfile("norpc.txt") then
		Lycoris.norpc = true
	end

	--[[
	if script_key and queue_on_teleport and not Lycoris.queued and not no_queue_on_teleport then
		-- String.
		local scriptKeyQueueString = string.format("script_key = '%s'", script_key or "N/A")
		local loadStringQueueString =
			'loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/b091c6e04449bca3a11cea0f1bc9bdfa.lua"))()'

		-- Queue.
		queue_on_teleport(scriptKeyQueueString .. "\n" .. loadStringQueueString)

		-- Mark.
		Lycoris.queued = true

		-- Warn.
		Logger.warn("Script has been queued for next teleport.")
	else
		-- Fail.
		Logger.warn("Script has failed to queue on teleport because Luarmor internals or the function do not exist.")
	end
	]]
	--

	if game.PlaceId == CHIME_LOBBY_PLACE_ID or game.PlaceId == LOBBY_PLACE_ID then
		handleExecutionLogging()
	end

	if game.PlaceId == CHIME_LOBBY_PLACE_ID then
		return Logger.warn("Script has initialized in the Chime lobby.")
	end

	if game.PlaceId ~= LOBBY_PLACE_ID then
		-- Attempt to initialize KeyHandling.
		KeyHandling.init()

		-- Attempt to initialize Hooking.
		Hooking.init()
	end

	CoreGuiManager.set()

	PersistentData.init()

	if game.PlaceId == LOBBY_PLACE_ID then
		Logger.warn("Script has initialized in the lobby.")
	end

	if game.PlaceId == LOBBY_PLACE_ID then
		-- Handle lobby state for server hopping. This takes priority over everything else.
		if PersistentData.get("shslot") then
			return ServerHop.lobby()
		end

		-- Handle lobby state for wiping. This takes priority over every farm.
		if PersistentData.get("wdata") then
			return Wipe.lobby()
		end
	end

	-- Okay, clear server hop slot.
	PersistentData.set("shslot", nil)

	if game.PlaceId == DEPTHS_PLACE_ID then
		-- Handle depths state for wiping. This takes priority over every other farm.
		if PersistentData.get("wdata") then
			Wipe.depths()
		end
	end

	-- Finally, handle Echo Farming.
	if PersistentData.get("efdata") then
		EchoFarm.start()
	end

	if game.PlaceId == LOBBY_PLACE_ID then
		return
	end

	QueuedBlocking.init()

	SaveManager.init()

	ModuleManager.refresh()

	ControlModule.init()

	Features.init()

	Menu.init()

	PlayerScanning.init()

	StateListener.init()

	Logger.notify("Script has been initialized in %ims.", (os.clock() - startTimestamp) * 1000)

	handleExecutionLogging()

	if not PersistentData.get("fli") then
		PersistentData.set("fli", os.time())
	end

	local modules = replicatedStorage:FindFirstChild("Modules")
	local bloxstrapRPC = modules and modules:FindFirstChild("BloxstrapRPC")
	local bloxstrapRPCModule = bloxstrapRPC and require(bloxstrapRPC)

	if not bloxstrapRPCModule then
		return
	end

	if Lycoris.norpc then
		return
	end

	bloxstrapRPCModule.SetRichPresence({
		details = "Lycoris Rewrite (Attached)",
		state = string.format(
			"Currently attached to the script - time elapsed is a session of %s time spent.",
			LRM_UserNote and "using" or "developing"
		),
		timeStart = PersistentData.get("fli") or os.time(),
		largeImage = {
			assetId = LRM_UserNote and 109802578297970 or 11289930484,
			hoverText = LRM_UserNote and "Using Deepwoken" or "Developing Deepwoken",
		},
		smallImage = {
			assetId = LRM_UserNote and 17278571027 or 15828456271,
			hoverText = LRM_UserNote and "Using Deepwoken" or "Developing Deepwoken",
		},
	})

	local playerRemovingSignal = lycorisMaid:mark(Signal.new(playersService.PlayerRemoving))

	playerRemovingSignal:connect("Lycoris_OnLocalPlayerRemoved", function(player)
		if player ~= playersService.LocalPlayer then
			return
		end

		-- Clear BloxstrapRPC.
		bloxstrapRPCModule.SetRichPresence({
			details = "",
			state = "",
			timeStart = 0,
			timeEnd = 0,
			largeImage = {
				clear = true,
			},
			smallImage = {
				clear = true,
			},
		})
	end)
end

---Detach instance.
function Lycoris.detach()
	lycorisMaid:clean()

	ModuleManager.detach()

	JoyFarm.stop()

	Menu.detach()

	QueuedBlocking.detach()

	ControlModule.detach()

	Features.detach()

	SaveManager.detach()

	PlayerScanning.detach()

	CoreGuiManager.clear()

	StateListener.detach()

	local modules = replicatedStorage:FindFirstChild("Modules")
	local bloxstrapRPC = modules and modules:FindFirstChild("BloxstrapRPC")
	local bloxstrapRPCModule = bloxstrapRPC and require(bloxstrapRPC)

	if bloxstrapRPCModule then
		bloxstrapRPCModule.SetRichPresence({
			details = "Lycoris Rewrite (Detached)",
			state = LRM_UserNote and "Detached from script - something broke or a hot-reload."
				or "Detached from script - something broke, fixing a bug, or a hot-reload.",
			timeStart = PersistentData.get("fli") or os.time(),
			largeImage = {
				assetId = LRM_UserNote and 109802578297970 or 11289930484,
				hoverText = LRM_UserNote and "Not Using Deepwoken" or "Developing Deepwoken",
			},
			smallImage = {
				assetId = LRM_UserNote and 17278571027 or 15828456271,
				hoverText = LRM_UserNote and "Not Using Deepwoken" or "Developing Deepwoken",
			},
		})
	end

	Hooking.detach()

	Logger.warn("Script has been detached.")
end

-- Return Lycoris module.
return Lycoris
