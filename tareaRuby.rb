###########################################################################################################


			# Universidad Simón Bolívar
			# Laboratorio de Lenguajes de Programación I

			# Tarea III. Ruby.

			# Alumnos:
			# 	Nairelys Hernández, 12-10199.
			# 	Jawil Ricauter, 13-11199.



######################################### Primera Parte ####################################################
######################################### Implementación ###################################################


################### (1) Propiedades y herancia. Considere una clase Circulo, con un unico campo radio.

class Circulo

	attr_accessor :radio

	def initialize(radio)
		if radio < 0
			raise ArgumentError.new('Radio invalido.')
		end	
  		@radio = radio
  	end
	
	def getRadio  
		@radio
	end  

	def setRadio(radio)
		@radio = radio
	end

	def area
		area = (Math::PI) * (@radio ** 2)
	end	

end		

# Prueba I

# unCirculo = Circulo.new(2)
# p (unCirculo.getRadio)
# unCirculo.setRadio(3)
# p (unCirculo.getRadio)
# p (unCirculo.area)


class Cilindro < Circulo

	attr_accessor :radio, :altura

	def initialize(radio, altura)
		if altura < 0
			raise ArgumentError.new('Altura invalida.')
		elsif radio < 0
			raise ArgumentError.new('Radio invalido')		
		end	
  		@radio = radio
  		@altura = altura
  	end

	def getAltura
		@altura
	end	

	def setAltura(altura)
		@altura = altura
	end	

	def volumen
		volumen =  (Math::PI) * (@radio ** 2) * @altura
	end	

end

# Prueba II

# unCilindro = Cilindro.new(3, 2)
# p (unCilindro.getRadio)
# p (unCilindro.getAltura)
# unCilindro.setRadio(2)
# unCilindro.setAltura(3)
# p (unCilindro.getRadio)
# p (unCilindro.getAltura)
# p (unCilindro.volumen)




################### (2) Defina una clase Moneda con subclases Dolar, Yen, Euro, Bolivar y Bitcoin.


class Moneda


	def en(moneda)
		# Si la moneda esta en una moneda diferente al dolar, lo convertimos a ella
		if self.class == Yen
			# 1 Japanese yen = 0.00941 U.S. dollars
			self.number = self.number * 0.00941
		end
		if self.class == Bolivar
			# 1 Venezuelan bolivar fuerte = 3.0 × 10-5 U.S. dollars
			self.number == self.number * 0.000004651
		end
		if self.class == Euro
			# 1 euro = 1,23027 U.S. dollars
			self.number == self.number * 1.23027
		end
		if self.class == Bitcoin
			# 1 bitcoin = 8279 bitcoins
			self.number == self.number * 8279
		end	

		if moneda == :dolares
			return self.number.dolares
		elsif moneda == :yens
			self.number = self.number / 0.00941
			return self.number.yens
		elsif moneda == :bolivares
			self.number = self.number / 0.000004651
			return self.number.bolivares
		elsif moneda == :euros
			self.number = self.number / 1.23027
			return self.number.euros
		elsif moneda == :bitcoins
			self.number = self.number /	8279
			return self.number.bitcoins		
		end			
	end
	

	def comparar(moneda)

		# Si la moneda esta en una moneda diferente al dolar, lo convertimos a ella
		if self.class == Yen
			# 1 Japanese yen = 0.00941 U.S. dollars
			self.number = self.number * 0.00941
		end
		if self.class == Bolivar
			# 1 Venezuelan bolivar fuerte = 3.0 × 10-5 U.S. dollars
			self.number = self.number * 0.000004651
		end
		if self.class == Euro
			# 1 euro = 1,23027 U.S. dollars
			self.number = self.number * 1.23027
		end
		if self.class == Bitcoin
			# 1 bitcoin = 8279 bitcoins
			self.number = self.number * 8279
		end	


		aux = moneda.number

		if moneda == Yen
			aux = moneda.number * 0.00941
		elsif moneda == Bolivar
			aux = moneda.number * 0.000004651
		elsif moneda == Euro
			aux = moneda.number * 1.23027
		elsif moneda == Bitcoin
			aux = moneda.number *	8279
		end				

		if self.number == aux
			return :igual
		elsif self.number > aux
			return :mayor
		else
			return :menor
		end			


	end	
end

class Dolar < Moneda

	attr_accessor :number

	def initialize(number)
		@number = number
  	end

end

class Yen < Moneda

	attr_accessor :number

	def initialize(number)
		@number = number
  	end
  	
end

class Euro < Moneda

	attr_accessor :number

	def initialize(number)
		@number = number
  	end
  	
end	

class Bolivar < Moneda

	attr_accessor :number

	def initialize(number)
		@number = number
  	end
  	
end

class Bitcoin < Moneda

	attr_accessor :number

	def initialize(number)
		@number = number
  	end
  	
end	



class Float

	def dolares
		usd = Dolar.new(self)
	end

	def yens
		y = Yen.new(self)
	end 

	def euros
		e = Euro.new(self)
	end 

	def bolivares
		bs = Bolivar.new(self)
	end

	def bitcoins
		bc = Bitcoin.new(self)
	end	

end


# Prueba III

# p (15.0.dolares.en(:euros)).class
# p (15.0.dolares.en(:euros)).number
# p (100000.0.bolivares.comparar(2.0.dolares))


################### (3) Bloques e iteradores.


def productoCruz(coleccion1, coleccion2)

	aux = coleccion1.product(coleccion2)

	for i in aux
		p i
	end	
end	


# Prueba IV

# ejemplo1 = [:a, :b, :c]
# ejemplo2 =[4, 5]

# productoCruz(ejemplo1, ejemplo2)