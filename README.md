# DataPickerCal-for-Solar2D
DataPickerCal for Solar2D</br>
Stworzyłem widget o nazwie jak powyżej. W Solar2D brakuje narzędzia do wybierania daty więc teraz już jest. Ktoś gdzieś stworzył widget do wybierania daty na podstawie PickerWheel. Też jest fajny ale mój jest w wersji kalendarza. Udostępniam swoje wypociny całemu światu i mam nadzieję że ktoś skorzysta. Już się cieszę że mogę pomóc. Kod jest na licencji otwartej więc można go usprawniać proszę tylko aby nie usuwać komentarza z pliku.</br>
Jak zacząć:</br>
W swoim projekcie umieść plik o nazwie „datapickerkal.lua”</br>
W pliku gdzie budujesz swój program np. „main.lua” musisz załadować powyższy plik przez require</br>
<i>local TwojaZmienna = require(„datapickerkal”)</i></br>
Wywołanie to:</br>
<i>local TwojaZmienna2 = TwojaZmienna.Moje.nowyDataPicker( {</br>
			year = 2023,</br>
			month = 5,</br>
			day = 21,</br>
			x = display.contentCenterX,</br>
			y = 200,</br>
			width = 130,</br>
			height = 60,</br>
			rounded = 15,</br>
			label = "CośTam", -- or data</br>
			labelColorDefault = { 0, 0, 0.7, 1 },</br>
			labelColorOver = { 0, 0.2, 0.85, 1 },</br>
			font = native.systemFontBold,</br>
			fontSize = 20,</br>
			strokeWidth = 4,</br>
			strokeColorDefault = {</br> 
				type = "gradient",</br> 
				color1 = { 0.2, 0.2, 0.2, 1 },</br> 
				color2 = { 0.2, 0.2, 0.2, 0 },</br> 
				direction = "down"</br>  
				}, -- or { 0.2, 0.2, 0.2, 1 } or documentation Paint Type Solar2D</br>
			strokeColorOver = {</br>
				type = "gradient",</br>
				color1 = { 0.9, 0.6, 0.2, 1 },</br>
				color2 = { 0.9, 0.6, 0.2, 0.1 },</br>
				direction = "down"</br>
				}, -- or { 0.9, 0.6, 0.2, 0.1 } or documentation Paint Type Solar2D</br>
			colorDefault = {</br>
				type = "gradient",</br>
				color1 = { 0.8, 0.8, 0.8, 1 },</br>
				color2 = { 1, 1, 1, 1 },</br>
				direction = "down"</br>
				}, -- or documentation Paint Type Solar2D</br> 
			colorOver = {</br>
				type = "gradient",</br>
				color1 = { 1, 1, 1, 1 },</br>
				color2 = { 0.8, 0.8, 0.8, 1 },</br>
				direction = "down"</br>
				} -- or documentation Paint Type Solar2D</br> 
			} )</i></br>
Pojawi się klawisz i gdy klikniesz na niego rozwinie się kalendarz. Po wybraniu daty kalendarz się zwinie, a opis na klawiszu zmieni się na wybraną datę. Datę możesz też wyciągnąć poi wyborze z TwojaZmienna2.year, TwojaZmienna2.month i TwojaZmienna2.day. Myślę że proste. Cały gotowy projekt w repozytorium.
