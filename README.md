# DataPickerCal-for-Solar2D
DataPickerCal for Solar2D
Stworzyłem widget o nazwie jak powyżej. W Solar2D brakuje narzędzia do wybierania daty więc teraz już jest. Ktoś gdzieś stworzył widget do wybierania daty na podstawie PickerWheel. Też jest fajny ale mój jest w wersji kalendarza. Udostępniam swoje wypociny całemu światu i mam nadzieję że ktoś skorzysta. Już się cieszę że mogę pomóc. Kod jest na licencji otwartej więc można go usprawniać proszę tylko aby nie usuwać komentarza z pliku.
Jak zacząć:
W swoim projekcie umieść plik o nazwie „datapickerkal.lua”
W pliku gdzie budujesz swój program np. „main.lua” musisz załadować powyższy plik przez require 
local TwojaZmienna = require(„datapickerkal”)
Wywołanie to:
local TwojaZmienna2 = TwojaZmienna.Moje.nowyDataPicker( {
			year = 2023,
			month = 5,
			day = 21,
			x = display.contentCenterX,
			y = 200,
			width = 130,
			height = 60,
			rounded = 15,
			label = "CośTam", -- or data
			labelColorDefault = { 0, 0, 0.7, 1 },
			labelColorOver = { 0, 0.2, 0.85, 1 },
			font = native.systemFontBold,
			fontSize = 20,
			strokeWidth = 4,
			strokeColorDefault = { 
				type = "gradient", 
				color1 = { 0.2, 0.2, 0.2, 1 }, 
				color2 = { 0.2, 0.2, 0.2, 0 }, 
				direction = "down"  
				}, -- or { 0.2, 0.2, 0.2, 1 } or documentation Paint Type Solar2D
			strokeColorOver = {
				type = "gradient",
				color1 = { 0.9, 0.6, 0.2, 1 },
				color2 = { 0.9, 0.6, 0.2, 0.1 },
				direction = "down"
				}, -- or { 0.9, 0.6, 0.2, 0.1 } or documentation Paint Type Solar2D
			colorDefault = {
				type = "gradient",
				color1 = { 0.8, 0.8, 0.8, 1 },
				color2 = { 1, 1, 1, 1 },
				direction = "down"
				}, -- or documentation Paint Type Solar2D 
			colorOver = {
				type = "gradient",
				color1 = { 1, 1, 1, 1 },
				color2 = { 0.8, 0.8, 0.8, 1 },
				direction = "down"
				} -- or documentation Paint Type Solar2D 
			} )
Pojawi się klawisz i gdy klikniesz na niego rozwinie się kalendarz. Po wybraniu daty kalendarz się zwinie, a opis na klawiszu zmieni się na wybraną datę. Datę możesz też wyciągnąć poi wyborze z TwojaZmienna2.year, TwojaZmienna2.month i TwojaZmienna2.day. Myślę że proste. Cały gotowy projekt w repozytorium.
