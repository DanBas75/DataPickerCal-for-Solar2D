# DataPickerCal-for-Solar2D
DataPickerCal for Solar2D
Stworzyłem widget o nazwie jak powyżej. W Solar2D brakuje narzędzia do wybierania daty więc teraz już jest. Ktoś gdzieś stworzył widget do wybierania daty na podstawie PickerWheel. Też jest fajny ale mój jest w wersji kalendarza. Udostępniam swoje wypociny całemu światu i mam nadzieję że ktoś skorzysta. Już się cieszę że mogę pomóc. Kod jest na licencji otwartej więc można go usprawniać proszę tylko aby nie usuwać komentarza z pliku.\n
Jak zacząć:\n
W swoim projekcie umieść plik o nazwie „datapickerkal.lua”\n
W pliku gdzie budujesz swój program np. „main.lua” musisz załadować powyższy plik przez require\n 
local TwojaZmienna = require(„datapickerkal”)\n
Wywołanie to:\n
local TwojaZmienna2 = TwojaZmienna.Moje.nowyDataPicker( {\n
			year = 2023,\n
			month = 5,\n
			day = 21,\n
			x = display.contentCenterX,\n
			y = 200,\n
			width = 130,\n
			height = 60,\n
			rounded = 15,\n
			label = "CośTam", -- or data\n
			labelColorDefault = { 0, 0, 0.7, 1 },\n
			labelColorOver = { 0, 0.2, 0.85, 1 },\n
			font = native.systemFontBold,\n
			fontSize = 20,\n
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
