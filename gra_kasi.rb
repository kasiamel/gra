class Mapa

	attr_accessor :zebrane_bonusy, :mapa_bonusy

	def initialize(wskaznik_x, wskaznik_y)
		@wartosc_przesuniecia = 1
		@wskaznik_x = wskaznik_x
		@wskaznik_y = wskaznik_y
		#@mapa = ['a','b', 'c']
		@mapa = [ 
			["I", "I", "D", "D", "D", "I"],
			["D", "I", "I", "I", "D", "I"],
			["D", "D", "D", "I", "I", "I"],
			["I", "I", "I", "D", "D", "I"],
			["I", "D", "I", "I", "I", "I"],
			["I", "D", "D", "I", "D", "D"]
		]

		@mapa_bonusy = [
			[0,2,0,0,0,2],
			[0,1,0,2,0,0],
			[0,0,0,0,1,0],
			[1,1,0,0,0,1],
			[0,0,0,2,0,1],
			[1,0,0,1,0,0]
		]

		@zebrane_bonusy = []

		#puts @mapa[1][1] wtedy wyjdzie srodkowe b!
		#ilosc rzedow
		#puts @mapa.length
		#ilosc kolumn w 0 rzedzie 
		#puts @mapa[0].length
	end

	def wyswietl_mape
=begin
		 @mapa.each_with_index do |element,index|
		 	if index == @wskaznik
		 		print "O"
		 	else
		 		print element
		 	end
		end
		print "\n"
=end
		
		@mapa.each_with_index do |element,index_y|
			
			element.each_with_index do |cos,index_x|
				if index_x == @wskaznik_x && index_y == @wskaznik_y
					print "X"
				else
					print cos
				end
			end
			print "\n"
		end
			print "\n"
	end

	def wyswietl_zebrane_bonusy
		 print @zebrane_bonusy.inject { |sum,x| sum += x }
	end

	def zmiana_pozycji(kierunek)
	
		case kierunek
			when "l" 
				 lewo
			when "p"
				 prawo
			when "d"
				 dol
			when "g"
				 gora
			else 
				return "nie ma takiego kierunku"
			end

			if  @mapa_bonusy[@wskaznik_x][@wskaznik_y] != 0
				print "zebrales bonusa #{@mapa_bonusy[@wskaznik_x][@wskaznik_y]} pkt!\n"
				@zebrane_bonusy << @mapa_bonusy[@wskaznik_x][@wskaznik_y]
				@mapa_bonusy[@wskaznik_x][@wskaznik_y] = 0
			else 
				print "tutaj nie ma bonusow\n"
			end

	end

	def prawo
		przesuniecie = @wskaznik_x + @wartosc_przesuniecia
		if  przesuniecie < @mapa[@wskaznik_y].length && @mapa[@wskaznik_y][przesuniecie] != "D"  
			@wskaznik_x = przesuniecie
		else
			puts "nie da sie przesunac"
		end



	end

	def lewo
		przesuniecie = @wskaznik_x - @wartosc_przesuniecia
		if  przesuniecie >= 0 && @mapa[@wskaznik_y][przesuniecie] != "D"
			@wskaznik_x = przesuniecie 
		else
			puts "nie da sie przesunac"
		end
	end

	def dol
		przesuniecie = @wskaznik_y + @wartosc_przesuniecia
		if przesuniecie < @mapa.length && @mapa[przesuniecie][@wskaznik_x] != "D"
			@wskaznik_y = przesuniecie
		else
			puts "nie da sie przesunac"
		end
	end

	def gora
		przesuniecie = @wskaznik_y - @wartosc_przesuniecia
		if przesuniecie >= 0 && @mapa[przesuniecie][@wskaznik_x] != "D"
			@wskaznik_y = przesuniecie
		else
			puts "nie da sie przesunac"
		end
	end
=begin (nie dziala, nie wiem czemu, moze potem to poprawie!!!2)
	def zakoncz_gre
		@zebrane_bonusy.inject { |sum,x| sum += x } == @mapa_bonusy.inject { |sum,x| sum += x }
	end
=end
end


puts "Gra Mateusza\nOto mapa :\n "
mapa = Mapa.new(0,0)
mapa.wyswietl_mape
puts "\nwpisz kierunek: lewo=l prawo=p dol=d gora=g :\naby zakonczyc gre wpisz: koniec\naby wyswietlic ilosc zebranyc punktow wpisz: bonusy"
wektor_przesuniecia = gets.chomp 
while wektor_przesuniecia != "koniec"
	mapa.zmiana_pozycji(wektor_przesuniecia)
	mapa.wyswietl_mape
	puts "\nwpisz kierunek: lewo=l prawo=p dol=d gora=g :"
	wektor_przesuniecia = gets.chomp
	
	if wektor_przesuniecia == "bonusy"
		puts "Twoje zebrane bonusy:"
		puts mapa.wyswietl_zebrane_bonusy
	end
=begin
	if zebrane_bonusy.inject { |sum,x| sum += x } == mapa_bonusy.inject { |sum,x| sum += x }
		puts "To koniec gry, zebrałes/as wszystkie bonusy: #{mapa.wyswietl_zebrane_bonusy} kopkt!"
		wektor_przesuniecia = "koniec"
	end
=end
end





