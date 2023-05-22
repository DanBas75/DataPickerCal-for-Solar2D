--Autor projektu Daniel Basior
--Niniejszy plik chroniony jest prawm autorskim.
local W = {}
W.nowyDataPicker = function( Parametry )
	local Teraz = os.date( "*t" )
	Parametry = {
		year = Parametry.year or Teraz.year,
		month = Parametry.month or Teraz.month,
		day = Parametry.day or Teraz.day,
		x = Parametry.x or display.contentCenterX,
		y = Parametry.y or display.contentCenterY,
		width = Parametry.width or 250,
		height = Parametry.height or 50,
		rounded = Parametry.rounded or 5,
		label = Parametry.label or Teraz.year.."."..Teraz.month.."."..Teraz.day,
		labelColorDefault = Parametry.labelColorDefault or { 0, 0, 0, 1 },
		labelColorOver = Parametry.labelColorOver or { 0, 0, 0, 1 },
		font = Parametry.font or native.systemFont,
		fontSize = Parametry.fontSize or 16,
		strokeWidth = Parametry.strokeWidth or 0,
		strokeColorDefault = Parametry.strokeColorDefault or { 0.6, 0.6, 0.6, 1 },
		strokeColorOver = Parametry.strokeColorOver or { 0.6, 0.6, 0.6, 1 },
		colorDefault = Parametry.colorDefault or { 1, 1, 1, 1 },
		colorOver = Parametry.colorOver or { 1, 1, 1, 1 }
	}
	local Grupa = display.newGroup(  )
	local G = display.newGroup(  )
	local GKalO = display.newGroup(  )
	local GKalMc = display.newGroup(  )
	local GKalRok = display.newGroup(  )
	local GPrzel = display.newGroup(  )
	local GButt = display.newGroup(  )
	local DniTyg = {
		"Pon",
		"Wto",
		"Śro",
		"Czw",
		"Pią",
		"Sob",
		"Nie"
	}
	local MieName = {
		"Styczeń",
		"Luty",
		"Marzec",
		"Kwiecień",
		"Maj",
		"Czerwiec",
		"Lipiec",
		"Sierpień",
		"Wrzesień",
		"Październik",
		"Listopad",
		"Grudzień"
	}
	local DniWMc = {
		31, -- January
		28, -- February
		31, -- March
		30, -- April
		31, -- May
		30, -- June
		31, -- July
		31, -- August
		30, -- September
		31, -- October
		30, -- November
		31 -- December
	}
	GButt.Button = display.newRoundedRect( Parametry.x, Parametry.y, Parametry.width, Parametry.height, Parametry.rounded )
	GButt.Button.fill = Parametry.colorDefault
	GButt.Button.strokeWidth = Parametry.strokeWidth
	GButt.Button.stroke = Parametry.strokeColorDefault
	GButt.Label = display.newText( {
		text = Parametry.label,
		x = GButt.Button.x,
		y = GButt.Button.y,
		width = GButt.Button.width * 0.9,
		font = Parametry.font,
		fontSize = Parametry.fontSize,
		align = "center"
		} )
	GButt.Label:setFillColor( Parametry.labelColorDefault[1], Parametry.labelColorDefault[2], Parametry.labelColorDefault[3], Parametry.labelColorDefault[4] )
	--GButt insert
	GButt:insert( GButt.Button )
	GButt:insert( GButt.Label )
	---------------------------
	G.Body = display.newRoundedRect( 0, 0, display.contentWidth * 0.8, display.contentHeight * 0.6, display.contentWidth * 0.05 )
	G.Body:setFillColor( 0, 0.7, 0.4, 1 )
	G.Body.anchorX = 0
	G.Body.anchorY = 0
	G.rok = display.newText( {
		text = Parametry.year,
		x = 20,
		y = 20,
		width = G.Body.width * 0.3,
		font = native.systemFont,
		fontSize = 16,
		align = "left"
		} )
	G.rok:setFillColor( 0, 3, 0.1, 1 )
	G.rok.anchorX = 0
	G.rok.anchorY = 0
	local function DzienTygod(rok, mc, dz)
		local JakiDT = os.date( "%w", os.time{ year=rok, month=mc, day=dz, hour=1, min=0, sec=0 } )
		if ( JakiDT == "0" ) then
			JakiDT = "7"
		end

		return JakiDT
	end
	G.DTyg = display.newText( {
		text = DniTyg[tonumber(DzienTygod(Parametry.year, Parametry.month, Parametry.day))]..",",
		x = G.Body.width * 0.25,
		y = G.rok.y + G.rok.height + 10,
		font = native.systemFontBold,
		fontSize = 28,
		align = "center"
		} )
	G.DTyg:setFillColor( 1 )
	G.DTyg.anchorX = 0
	G.DTyg.anchorY = 0
	G.dzien = display.newText( {
		text = Parametry.day,
		x = G.DTyg.x + G.DTyg.width + 4,
		y = G.rok.y + G.rok.height + 10,
		font = native.systemFontBold,
		fontSize = 28,
		align = "center"
		} )
	G.dzien:setFillColor( 1 )
	G.dzien.anchorX = 0
	G.dzien.anchorY = 0
	G.KalBody = display.newRect( 0, G.DTyg.y + G.DTyg.height + 5, G.Body.width, G.Body.height - G.DTyg.y - G.DTyg.height - 25 )
	G.KalBody:setFillColor( 1 )
	G.KalBody.anchorX = 0
	G.KalBody.anchorY = 0
	G.KlawAnuluj = display.newText( {
		text = "Anuluj",
		x = G.KalBody.width,
		y = G.KalBody.height,
		font = native.systemFont,
		fontSize = 18,
		align = "center"
		} )
	G.KlawAnuluj:setFillColor( 0, 0.7, 0.4, 1 )
	G.KlawAnuluj.anchorX = 0
	G.KlawAnuluj.anchorY = 0
	G.KlawAnuluj.x = G.KalBody.width - G.KlawAnuluj.width - 10
	G.KlawAnuluj.y = G.Body.height - G.KlawAnuluj.height - 30
	G.KlawOk = display.newText( {
		text = "OK",
		x = G.KalBody.width,
		y = G.KalBody.height,
		font = native.systemFont,
		fontSize = 18,
		align = "center"
		} )
	G.KlawOk:setFillColor( 0, 0.7, 0.4, 1 )
	G.KlawOk.anchorX = 0
	G.KlawOk.anchorY = 0
	G.KlawOk.x = G.KlawAnuluj.x - G.KlawOk.width - 10
	G.KlawOk.y = G.KlawAnuluj.y
	GPrzel.Minus = display.newText( {
		text = "<",
		x = G.KalBody.x + 20,
		y = G.KalBody.y + 5,
		font = native.systemFontBold,
		fontSize = 28,
		align = "center"
		} )
	GPrzel.Minus:setFillColor( 0 )
	GPrzel.Minus.anchorX = 0
	GPrzel.Minus.anchorY = 0
	GPrzel.Plus = display.newText( {
		text = ">",
		x = G.KalBody.width,
		y = G.KalBody.y + 5,
		font = native.systemFontBold,
		fontSize = 28,
		align = "center"
		} )
	GPrzel.Plus:setFillColor( 0 )
	GPrzel.Plus.x = GPrzel.Plus.x - GPrzel.Plus.width - 20
	GPrzel.Plus.anchorX = 0
	GPrzel.Plus.anchorY = 0
	GPrzel.TPrzel = display.newText( {
		text = MieName[tonumber(Parametry.month)],
		x = G.KalBody.width * 0.5,
		y = G.KalBody.y + 8,
		font = native.systemFontBold,
		fontSize = 20,
		align = "center"
		} )
	GPrzel.TPrzel:setFillColor( 0 )
	GPrzel.TPrzel.anchorX = 0.5
	GPrzel.TPrzel.anchorY = 0
	--GPrzel insert
	GPrzel:insert( GPrzel.Minus )
	GPrzel:insert( GPrzel.Plus )
	GPrzel:insert( GPrzel.TPrzel )
	------------------------------
	local SkrotDT = { "Pn", "Wt", "Śr", "Cz", "Pt", "So", "Ni" }
	local OdsX = G.KalBody.width * 0.9
	local OdsY = G.KalBody.height
	OdsX = OdsX / 7
	local PozX = OdsX
	GKalO.DTygText = {}
	for n=1, 7 do
		GKalO.DTygText[n] = display.newText( {
			text = SkrotDT[n],
			x = PozX,
			y = GPrzel.Plus.y + GPrzel.Plus.height + 10,
			font = native.systemFont,
			fontSize = 14,
			align = "center"
			} )
		GKalO.DTygText[n]:setFillColor( 0 )
		GKalO.DTygText[n].anchorX = 0.5
		GKalO.DTygText[n].anchorY = 0
		PozX = PozX + OdsX
		GKalO:insert( GKalO.DTygText[n] )
	end
	OdsY = OdsY - GKalO.DTygText[1].y - GKalO.DTygText[1].height - 10
	OdsY = OdsY / 7
	PozX = OdsX
	local PozY = GKalO.DTygText[1].y + GKalO.DTygText[1].height + 10
	GKalO.ZnakKalO = display.newRoundedRect( PozX, PozY - 7, 30, 30, 15 )
	GKalO.ZnakKalO:setFillColor( 0, 0.7, 0.4, 1 )
	GKalO.ZnakKalO.anchorX = 0.5
	GKalO.ZnakKalO.anchorY = 0
	GKalO:insert( GKalO.ZnakKalO )
	GKalO.dzienK = {}
	for n=1, 42 do
		GKalO.dzienK[n] = display.newText( {
			text = n,
			x = PozX,
			y = PozY,
			font = native.systemFont,
			fontSize = 14,
			align = "center"
			} )
		GKalO.dzienK[n]:setFillColor( 0 )
		GKalO.dzienK[n].anchorX = 0.5
		GKalO.dzienK[n].anchorY = 0
		PozX = PozX + OdsX
		if ( n%7 == 0 ) then
			PozY = PozY + OdsY
			PozX = OdsX
		end
		GKalO:insert( GKalO.dzienK[n] )
		GKalO.dzienK[n].id = n
	end
	if ( Parametry.year == 1970 ) then
		if ( Parametry.month == 1 ) then
			GPrzel.Minus.isVisible = false
		end
	end
	--GKalO Insert
		
	GKalO.isVisible = true
	------------------------------
	OdsX = G.KalBody.width * 0.9
	OdsY = G.KalBody.height
	OdsX = OdsX / 2
	PozX = OdsX * 0.5
	OdsY = OdsY - 40
	OdsY = OdsY / 7
	PozY = GPrzel.Minus.y + GPrzel.Minus.height + 20
	GKalMc.ZnakKalMc = display.newRoundedRect( PozX, PozY - 7, 30, 30, 15 )
	GKalMc.ZnakKalMc:setFillColor( 0, 0.7, 0.4, 1 )
	GKalMc.ZnakKalMc.anchorX = 0.5
	GKalMc.ZnakKalMc.anchorY = 0
	GKalMc:insert( GKalMc.ZnakKalMc ) 
	GKalMc.miesiacK = {}
	for n=1, 12 do
		GKalMc.miesiacK[n] = display.newText( {
			text = MieName[n],
			x = PozX,
			y = PozY,
			font = native.systemFont,
			fontSize = 14,
			align = "center"
			} )
		GKalMc.miesiacK[n]:setFillColor( 0 )
		GKalMc.miesiacK[n].anchorX = 0.5
		GKalMc.miesiacK[n].anchorY = 0
		PozX = PozX + OdsX * 1.25
		if ( n%2 == 0 ) then
			PozY = PozY + OdsY
			PozX = OdsX * 0.5
		end
		GKalMc:insert( GKalMc.miesiacK[n] )
		GKalMc.miesiacK[n].id = n
	end
	GKalMc.ZnakKalMc.width = GKalMc.miesiacK[Parametry.month].width + 20
	GKalMc.ZnakKalMc.x = GKalMc.miesiacK[Parametry.month].x
	GKalMc.ZnakKalMc.y = GKalMc.miesiacK[Parametry.month].y - 7
	GKalMc.ZnakKalMc.id = Parametry.month
	GKalMc.miesiacK[Parametry.month]:setFillColor( 1 )
	GKalMc.isVisible = false
	-----------------------------
	GKalRok.roll10 = display.newText( {
			text = Parametry.year - 1,
			x = G.KalBody.width * 0.5,
			y = G.KalBody.height * 0.6,
			font = native.systemFont,
			fontSize = 14,
			align = "center"
			} )
		GKalRok.roll10:setFillColor( 0 )
		GKalRok.roll10.anchorX = 0.5
		GKalRok.roll10.anchorY = 0.5
	GKalRok.roll11 = display.newText( {
			text = Parametry.year,
			x = G.KalBody.width * 0.5,
			y = G.KalBody.height * 0.6,
			font = native.systemFont,
			fontSize = 18,
			align = "center"
			} )
		GKalRok.roll11:setFillColor( 1 )
		GKalRok.roll11.anchorX = 0.5
		GKalRok.roll11.anchorY = 0.5
	GKalRok.roll12 = display.newText( {
			text = Parametry.year + 1,
			x = G.KalBody.width * 0.5,
			y = G.KalBody.height * 0.6,
			font = native.systemFont,
			fontSize = 14,
			align = "center"
			} )
		GKalRok.roll12:setFillColor( 0 )
		GKalRok.roll12.anchorX = 0.5
		GKalRok.roll12.anchorY = 0.5
	GKalRok.roll10.y = GKalRok.roll11.y - GKalRok.roll11.height - 15
	GKalRok.roll12.y = GKalRok.roll11.y + GKalRok.roll11.height + 15
	GKalRok.Pas = display.newRoundedRect( GKalRok.roll11.x, GKalRok.roll11.y, 30, 30, 15 )
	GKalRok.Pas:setFillColor( 0, 0.7, 0.4, 1 ) --( 0.7, 0.7, 0.7, 1 )
	GKalRok.Pas.width = GKalRok.roll11.width + 60
	GKalRok.Pas.height = GKalRok.roll11.height + 10
	GKalRok.Pas.anchorX = 0.5
	GKalRok.Pas.anchorY = 0.5
	if ( GKalRok.roll11.text == "1970" ) then
		GKalRok.roll10.isVisible = false
	end
	GKalRok:insert( GKalRok.Pas )
	GKalRok:insert( GKalRok.roll10 )
	GKalRok:insert( GKalRok.roll11 )
	GKalRok:insert( GKalRok.roll12 )
	GKalRok.isVisible = false
	-----------------------------------
	--G Ustawienia
	G.x = display.contentWidth * 0.1
	G.y = display.contentHeight + 20
	G.anchorX = 0
	G.anchorY = 0

	G.KalOgu = GKalO
	G.KalMies = GKalMc
	G.KalRoku = GKalRok
	G.Przelacz = GPrzel
	G:insert( G.Body )
	G:insert( G.rok )
	G:insert( G.DTyg )
	G:insert( G.dzien )
	G:insert( G.KalBody )
	G:insert( G.KlawAnuluj )
	G:insert( G.KlawOk )
	G:insert( G.Przelacz ) 
	G:insert( G.KalOgu )
	G:insert( G.KalMies )
	G:insert( G.KalRoku )
	G.isVisible = false

	Grupa.G = G
	Grupa.GButt = GButt
	Grupa:insert( Grupa.GButt )
	Grupa:insert( Grupa.G )
	-----------------------------
	--funkcje obliczenia zależności kalendarza
	local function CzyRokPrzes(rok)
		if 0 == rok % 4 then
			if 0 == rok % 100 then
				if 0 == rok % 400 then
					return true
				else
					return false
				end
			else
				return true
			end
		else
			return false
		end
	end

	local function DniWMiesacu(mc, rok)
		if rok and mc == 2 and CzyRokPrzes(rok) then
			return 29
		end
		return DniWMc[mc]
	end
	--Konic zależności
	--Funkcja maluje kalendarz ogólny
	local function MalujGKalO( rok, mc, dz )
		local Od, Do = tonumber(DzienTygod(rok, mc, 1)), tonumber(DniWMiesacu(mc, rok))
		Do = Do + Od - 1
		for n=1, 42 do
			GKalO.dzienK[n].isVisible = false
			if ( n >= Od ) then
				if ( n <= Do ) then
					GKalO.dzienK[n].isVisible = true
					GKalO.dzienK[n].text = n - Od + 1
					GKalO.dzienK[n]:setFillColor( 0 )
				end
			end
		end
		if ( dz + Od - 1 > Do ) then
			GKalO.ZnakKalO.x = GKalO.dzienK[Do].x
			GKalO.ZnakKalO.y = GKalO.dzienK[Do].y - 7
			G.dzien.text = GKalO.dzienK[Do].text
			G.DTyg.text = DniTyg[tonumber( DzienTygod(rok, mc, tonumber( GKalO.dzienK[Do].text )) )]..","
			GKalO.ZnakKalO.id = Do
			GKalO.dzienK[Do]:setFillColor( 1 )
		elseif ( dz + Od - 1 <= Do ) then
			GKalO.ZnakKalO.x = GKalO.dzienK[dz + Od - 1].x
			GKalO.ZnakKalO.y = GKalO.dzienK[dz + Od - 1].y - 7
			G.dzien.text = GKalO.dzienK[dz + Od - 1].text
			G.DTyg.text = DniTyg[tonumber( DzienTygod(rok, mc, tonumber( GKalO.dzienK[dz + Od - 1].text )) )]..","
			GKalO.ZnakKalO.id = dz + Od - 1
			GKalO.dzienK[dz + Od - 1]:setFillColor( 1 )
		end
		return true
	end --Koniec MalujKal
	MalujGKalO( Parametry.year, Parametry.month, Parametry.day )
	Parametry.year = Parametry.year
	Parametry.month = Parametry.month
	Parametry.day = Parametry.day
	--Funkcja kliknięcia na dzień
	local function KlikDay( event )
		GKalO.dzienK[GKalO.ZnakKalO.id]:setFillColor( 0 )
		transition.to( GKalO.ZnakKalO, {
			time = 200,
			x = GKalO.dzienK[event.target.id].x,
			y = GKalO.dzienK[event.target.id].y - 7,
			transition = easing.outCubic,
			onComplete = function()
				GKalO.dzienK[event.target.id]:setFillColor( 1 )
			end
			} )
		GKalO.ZnakKalO.id = event.target.id
		Parametry.day = tonumber(GKalO.dzienK[event.target.id].text)
		G.dzien.text = GKalO.dzienK[event.target.id].text
		G.DTyg.text = DniTyg[tonumber( DzienTygod(Parametry.year, Parametry.month, tonumber( GKalO.dzienK[event.target.id].text )) )]..","
		return true
	end --Konic KlikDay
	--Funkcja kliknięcia na minus
	local function KlikMinusMc()
		if ( GKalO.isVisible == true ) then
			Parametry.month = Parametry.month - 1
			if ( Parametry.month == 0 ) then
				Parametry.month = 12
				Parametry.year = Parametry.year - 1
				G.rok.text = Parametry.year
			end
			GPrzel.TPrzel.text = MieName[tonumber(Parametry.month)]
			MalujGKalO( Parametry.year, Parametry.month, Parametry.day )
		elseif ( GKalMc.isVisible == true ) then
			Parametry.year = Parametry.year - 1
			GPrzel.TPrzel.text = Parametry.year
			G.rok.text = Parametry.year
			MalujGKalO( Parametry.year, Parametry.month, Parametry.day )
		end
		if ( Parametry.year == 1970 ) then
			if ( GKalO.isVisible == true ) then
				if ( Parametry.month == 1 ) then
					GPrzel.Minus.isVisible = false
				end
			elseif ( GKalMc.isVisible == true ) then
				GPrzel.Minus.isVisible = false
			end
		end
		return true
	end --Konic KlikMinusMc
	--Funkcja kliknięcia na plus
	local function KlikPlusMc()
		if ( GPrzel.Minus.isVisible == false ) then
			GPrzel.Minus.isVisible = true
		end
		if ( GKalO.isVisible == true ) then
			Parametry.month = Parametry.month + 1
			if ( Parametry.month == 13 ) then
				Parametry.month = 1
				Parametry.year = Parametry.year + 1
				G.rok.text = Parametry.year
			end
			GPrzel.TPrzel.text = MieName[tonumber(Parametry.month)]
			MalujGKalO( Parametry.year, Parametry.month, Parametry.day )
		elseif ( GKalMc.isVisible == true ) then
			Parametry.year = Parametry.year + 1
			GPrzel.TPrzel.text = Parametry.year
			G.rok.text = Parametry.year
			MalujGKalO( Parametry.year, Parametry.month, Parametry.day )
		end
		return true
	end --Koniec KlikPlusMc
	--Funkcja wybierania miesiąca
	local function KlikMiesiac( event )
		GKalMc.miesiacK[GKalMc.ZnakKalMc.id]:setFillColor( 0 )
		transition.to( GKalMc.ZnakKalMc, {
			time = 200,
			x = GKalMc.miesiacK[event.target.id].x,
			y = GKalMc.miesiacK[event.target.id].y - 7,
			width = GKalMc.miesiacK[event.target.id].width + 20,
			transition = easing.outCubic,
			onComplete = function()
				GKalMc.miesiacK[event.target.id]:setFillColor( 1 )
			end
			} )
		GKalMc.ZnakKalMc.id = event.target.id
		G.DTyg.text = DniTyg[tonumber( DzienTygod(Parametry.year, event.target.id, tonumber( G.dzien.text )) )]..","
		--Parametry.month = event.target.id
		--MalujGKalO()
		return true
	end --Konic KlikMiesiac
	--Funkcja kliknięcia na przełącznik
	local function KlikWybMc()
		if ( GKalO.isVisible == true ) then
			if ( Parametry.year == 1970 ) then
				GPrzel.Minus.isVisible = false
			end
			GKalMc.miesiacK[GKalMc.ZnakKalMc.id]:setFillColor( 0 )
			GKalMc.ZnakKalMc.width = GKalMc.miesiacK[Parametry.month].width + 20
			GKalMc.ZnakKalMc.x = GKalMc.miesiacK[Parametry.month].x
			GKalMc.ZnakKalMc.y = GKalMc.miesiacK[Parametry.month].y - 7
			GKalMc.miesiacK[Parametry.month]:setFillColor( 1 )
			GKalMc.ZnakKalMc.id = Parametry.month
			GKalMc.alpha = 0
			GKalMc.isVisible = true
			transition.to( GKalO, {
				time = 200,
				alpha = 0,
				onComplete = function()
					GKalO.isVisible = false
				end
				} )
			transition.to( GKalMc, {
				time = 300,
				alpha = 1,
				onComplete = function()
					GPrzel.TPrzel.text = Parametry.year
				end
				} )
		elseif ( GKalMc.isVisible == true ) then
			if ( GKalRok.roll10.isVisible == false ) then
				GKalRok.roll10.isVisible = true
			end
			GKalRok.roll10.text = Parametry.year - 1
			GKalRok.roll11.text = Parametry.year
			GKalRok.roll12.text = Parametry.year + 1
			if ( GKalRok.roll11.text == "1970" ) then
				GKalRok.roll10.isVisible = false
			end
			GKalRok.alpha = 0
			GKalRok.isVisible = true
			transition.to( GKalMc, {
				time = 200,
				alpha = 0,
				onComplete = function()
					GKalMc.isVisible = false
				end
				} )
			transition.to( GKalRok, {
				time = 300,
				alpha = 1
				} )
			transition.to( GPrzel, {
				time = 200,
				alpha = 0,
				onComplete = function()
					GPrzel.isVisible = false
					GPrzel.alpha = 1
				end
				} )
		end
		return true
	end --Konic KlikWybMc
	--Zmienne i funkcja rolki lat	
	--Funkcja rolki lat
	local Poz0, Poz1, Poz2 = GKalRok.roll10.y, GKalRok.roll11.y, GKalRok.roll12.y
	local OdlePoz1 = Poz1 - Poz0
	local OdlePoz2 = Poz2 - Poz1
	local PokOdl1, PokOdl2
	local function TestMove( event )
		if ( GKalRok.isVisible == true ) then
			local function Nominal()
				GKalRok.roll11.size = 18
			    GKalRok.roll12.size = 14
			    GKalRok.roll10.y = Poz0
			    GKalRok.roll11.y = Poz1
			    GKalRok.roll12.y = Poz2
			    GKalRok.roll10.alpha = 1
				GKalRok.roll12.alpha = 1
			    GKalRok.roll10.touchOffsetY = event.y - GKalRok.roll10.y
				GKalRok.roll11.touchOffsetY = event.y - GKalRok.roll11.y
				GKalRok.roll12.touchOffsetY = event.y - GKalRok.roll12.y
				return true
			end
			if ( event.phase == "began" ) then
				GKalRok.roll10.touchOffsetY = event.y - GKalRok.roll10.y
				GKalRok.roll11.touchOffsetY = event.y - GKalRok.roll11.y
				GKalRok.roll12.touchOffsetY = event.y - GKalRok.roll12.y
			elseif ( event.phase == "moved" ) then
				----
				if ( GKalRok.roll11.text == "1970" ) and ( GKalRok.roll11.y > Poz1 ) then
					GKalRok.roll10.isVisible = false
				else
					GKalRok.Pas:setFillColor( 0.8, 0.8, 0.8, 1 )
					GKalRok.roll11:setFillColor( 0 )
				    GKalRok.roll10.y = event.y - GKalRok.roll10.touchOffsetY
				    GKalRok.roll11.y = event.y - GKalRok.roll11.touchOffsetY
				    GKalRok.roll12.y = event.y - GKalRok.roll12.touchOffsetY
				    PokOdl1 = GKalRok.roll11.y - Poz0
				    PokOdl2 = Poz2 - GKalRok.roll11.y
				    local Procent1 = PokOdl1/OdlePoz1
				    local Procent2 = PokOdl2/OdlePoz2
				    if ( Procent1 > 1 ) then Procent1 = 1 end
				    if ( Procent2 > 1 ) then Procent2 = 1 end
				    GKalRok.roll10.alpha = Procent1
				    GKalRok.roll12.alpha = Procent2
				end
			    if ( GKalRok.roll11.y < Poz1 - GKalRok.Pas.height * 0.4 ) or ( GKalRok.roll11.y > Poz1 + GKalRok.Pas.height * 0.4 ) then
			       	GKalRok.roll11.size = 14
			    else
			       	GKalRok.roll11.size = 18
			    end
			    if ( GKalRok.roll10.y > Poz1 - GKalRok.Pas.height * 0.4 ) then
			       	GKalRok.roll10.size = 18
			    else
			      	GKalRok.roll10.size = 14
			    end
			    if ( GKalRok.roll12.y < Poz1 + GKalRok.Pas.height * 0.4 ) then
			       	GKalRok.roll12.size = 18
			    else
			      	GKalRok.roll12.size = 14
			    end
			    if ( GKalRok.roll11.y <= Poz0 ) then
			    	Nominal()
					GKalRok.roll10.text = GKalRok.roll11.text
					GKalRok.roll11.text = GKalRok.roll12.text
					GKalRok.roll12.text = GKalRok.roll12.text + 1
					if ( GKalRok.roll10.isVisible == false ) then
						GKalRok.roll10.isVisible = true
					end
			    end
			    if ( GKalRok.roll11.y >= Poz2 ) then
			    	Nominal()
					GKalRok.roll12.text = GKalRok.roll11.text
					GKalRok.roll11.text = GKalRok.roll10.text
					GKalRok.roll10.text = GKalRok.roll10.text - 1
					if ( GKalRok.roll11.text == "1970" ) then
						GKalRok.roll10.isVisible = false
					end
			    end
				----
			elseif ( event.phase == "ended" or event.phase == "cancelled" ) then
				if ( GKalRok.roll11.y > Poz1 + GKalRok.Pas.height * 0.4 ) then
					local A = Poz2 - Poz1
				   	A = Poz2 + A
					transition.to( GKalRok.roll10, { time = 200, y = Poz1 } )
				   	transition.to( GKalRok.roll11, { time = 200, y = Poz2 } )
				   	transition.to( GKalRok.roll12, { time = 200, y = A, alpha = 0, onComplete = function()
				   		Nominal()
					    GKalRok.roll12.text = GKalRok.roll11.text
						GKalRok.roll11.text = GKalRok.roll10.text
						GKalRok.roll10.text = GKalRok.roll10.text - 1
						if ( GKalRok.roll11.text == "1970" ) then
							GKalRok.roll10.isVisible = false
						end
						GKalRok.Pas:setFillColor( 0, 0.7, 0.4, 1 )
						GKalRok.roll11:setFillColor( 1 )
						G.DTyg.text = DniTyg[tonumber( DzienTygod(tonumber( GKalRok.roll11.text ), Parametry.month, tonumber( G.dzien.text )) )]..","
						G.rok.text = GKalRok.roll11.text
				   	end
				   	} )
				elseif ( GKalRok.roll11.y < Poz1 - GKalRok.Pas.height * 0.4 ) then
				   	local A = Poz1 - Poz0
				   	A = Poz0 - A
				   	transition.to( GKalRok.roll10, { time = 200, y = A, alpha = 0 } )
				   	transition.to( GKalRok.roll11, { time = 200, y = Poz0 } )
				   	transition.to( GKalRok.roll12, { time = 200, y = Poz1, onComplete = function()
				   		Nominal()
					    GKalRok.roll10.text = GKalRok.roll11.text
						GKalRok.roll11.text = GKalRok.roll12.text
						GKalRok.roll12.text = GKalRok.roll12.text + 1
						if ( GKalRok.roll10.isVisible == false ) then
							GKalRok.roll10.isVisible = true
						end
						GKalRok.Pas:setFillColor( 0, 0.7, 0.4, 1 )
						GKalRok.roll11:setFillColor( 1 )
						G.DTyg.text = DniTyg[tonumber( DzienTygod(tonumber( GKalRok.roll11.text ), Parametry.month, tonumber( G.dzien.text )) )]..","
						G.rok.text = GKalRok.roll11.text
				   	end
				   	} )
				else
				   	transition.to( GKalRok.roll10, { time = 200, y = Poz0, alpha = 1 } )
				   	transition.to( GKalRok.roll11, { time = 200, y = Poz1 } )
				   	transition.to( GKalRok.roll12, { time = 200, y = Poz2, alpha = 1 } )
				   	GKalRok.roll11.size = 18
				   	GKalRok.Pas:setFillColor( 0, 0.7, 0.4, 1 )
					GKalRok.roll11:setFillColor( 1 )
					G.DTyg.text = DniTyg[tonumber( DzienTygod(tonumber( GKalRok.roll11.text ), Parametry.month, tonumber( G.dzien.text )) )]..","
					G.rok.text = GKalRok.roll11.text
				end			
				return true
			end
		end
		return true
	end --Konic TestMove rolki lat
	--Funkcja zanikania rok
	local function ZanikRok()
		if ( Parametry.year == 1970 ) then
			GPrzel.Minus.isVisible = false
		else
			GPrzel.Minus.isVisible = true
		end
		GKalMc.alpha = 0
		GKalMc.isVisible = true
		GPrzel.alpha = 0
		GPrzel.isVisible = true
		transition.to( GKalRok, {
			time = 200,
			alpha = 0,
			onComplete = function()
				GKalRok.isVisible = false
			end
			} )
		transition.to( GKalMc, {
			time = 300,
			alpha = 1,
			onComplete = function()
				GPrzel.TPrzel.text = Parametry.year
				G.rok.text = Parametry.year
			end
			} )
		transition.to( GPrzel, {
			time = 300,
			alpha = 1
			} )
	end --Konic ZanikRok
	--Funkcja zanikania miesiąca
	local function ZanikMc()
		GPrzel.TPrzel.text = MieName[Parametry.month]
		if ( Parametry.year == 1970 ) then
			if ( Parametry.month == 1 ) then
				GPrzel.Minus.isVisible = false
			else
				GPrzel.Minus.isVisible = true
			end
		else
			GPrzel.Minus.isVisible = true
		end
		GKalO.alpha = 0
		GKalO.isVisible = true
		transition.to( GKalO, {
			time = 300,
			alpha = 1,
			onComplete = function()
				GPrzel.TPrzel.text = MieName[Parametry.month]
			end
			} )
		transition.to( GKalMc, {
			time = 200,
			alpha = 0,
			onComplete = function()
				GKalMc.isVisible = false
			end
			} )
	end --Konic ZanikMc
	--Funkcja zanikania kalendarza
	local function ZanikKal()
		transition.to( G, {
			time = 400,
			y = display.contentHeight + 20,
			transition = easing.inBack,
			onComplete = function()
				G.isVisible = false
				GButt.isVisible = true
			end
			} )
		return true
	end --Koniec ZanikKal
	--Funkcja kliknięcia na OK
	local function KlikOk()
		if ( GKalRok.isVisible == true ) then
			Parametry.year = tonumber( GKalRok.roll11.text )
			ZanikRok()
		elseif ( GKalMc.isVisible == true ) then
			Parametry.month = GKalMc.ZnakKalMc.id
			MalujGKalO( Parametry.year, Parametry.month, Parametry.day )
			ZanikMc()
		elseif ( GKalO.isVisible == true ) then
			Grupa.year = Parametry.year
			Grupa.month = Parametry.month
			Grupa.day = Parametry.day
			GButt.Label.text = Parametry.year.."."..Parametry.month.."."..Parametry.day
			ZanikKal()
		end
		return true
	end --Koniec KlikOk
	--Funkcja kliknięcia na anuluj
	local function KlikAnuluj()
		if ( GKalRok.isVisible == true ) then
			ZanikRok()
		elseif ( GKalMc.isVisible == true ) then
			ZanikMc()
		elseif ( GKalO.isVisible == true ) then
			ZanikKal()
		end
		return true
	end --Konic KlikAnuluj
	local function KlikPicker( event )
		if ( event.phase == "began" ) then
			GButt.Label:setFillColor( Parametry.labelColorOver[1], Parametry.labelColorOver[2], Parametry.labelColorOver[3], Parametry.labelColorOver[4] )
			GButt.Button.fill = Parametry.colorOver
			GButt.Button.stroke = Parametry.strokeColorOver
		elseif ( event.phase == "ended" or event.phase == "cancelled" ) then
			GButt.Label:setFillColor( Parametry.labelColorDefault[1], Parametry.labelColorDefault[2], Parametry.labelColorDefault[3], Parametry.labelColorDefault[4] )
			GButt.Button.fill = Parametry.colorDefault
			GButt.Button.stroke = Parametry.strokeColorDefault
			if ( G.isVisible == false ) then
				--GButt.isVisible = false
				G.isVisible = true
				transition.to( G, {
					time = 500,
					y = display.contentHeight * 0.2,
					transition = easing.outBack
					} )
			end
			return true
		end
	end
	local function Blokada( event )
		print( event.phase )
		return true
	end
	for n=1, 42 do
		GKalO.dzienK[n]:addEventListener( "tap", KlikDay )
		if ( n < 13 ) then
			GKalMc.miesiacK[n]:addEventListener( "tap", KlikMiesiac )
		end
	end
	GPrzel.Minus:addEventListener( "tap", KlikMinusMc )
	GPrzel.Plus:addEventListener( "tap", KlikPlusMc )
	GPrzel.TPrzel:addEventListener( "tap", KlikWybMc )
	G.KalBody:addEventListener( "touch", TestMove )
	G.KalBody:addEventListener( "tap", TestMove )
	G.KlawOk:addEventListener( "tap", KlikOk )
	G.KlawAnuluj:addEventListener( "tap", KlikAnuluj )
	G:addEventListener( "tap", Blokada )
	GButt:addEventListener( "touch", KlikPicker )
	----Wchodzę na scenę
	
	--------------------
	return Grupa
end
return W