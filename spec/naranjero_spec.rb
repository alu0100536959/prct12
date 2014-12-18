require "naranjero"
require 'thread'


module Naranjero
     describe Naranjero::Arbol_N do
     before :each do
	@arbol_naranjero = Naranjero::Arbol_N.new
     end#end del before

  context "Pruebas para la clase Arbol_N y los hilos de ejecucion" do
      it "El atributo es de la clase" do
	expect(@arbol_naranjero.class).to eq(Arbol_N)
      end
      
      it "Existe un metodo para recolectar una naranja" do
	expect(@arbol_naranjero).to respond_to :recolectar_una
      end
      
      it "Existe un metodo para aumentar edad y altura y comprobrar si el arbol esta muerto" do
	expect(@arbol_naranjero).to respond_to :uno_mas
      end
      
      it "Existe un metodo que devuelva el contador de naranjas" do
	expect(@arbol_naranjero).to respond_to :contador
      end
      
      it "Existe un metodo que devuelva si el arbol esta muerto" do
	expect(@arbol_naranjero).to respond_to :arbol_muerto
      end
      
      it "Existe un metodo que devuelva la edad del arbol" do
	expect(@arbol_naranjero).to respond_to :edad
      end
      
      ###################CREACION DE HILOS CON SUS PRUEBAS#####################
      
      it "Pruebas para probar la ejecucion con los hilos" do
	  @hilo_uno = Thread.new do
          @arbol_naranjero.uno_mas
          sleep(2)
	  @arbol_naranjero.uno_mas
	  sleep(2)
	  @arbol_naranjero.recolectar_una
	  sleep(0.1)
	  @arbol_naranjero.recolectar_una
	  sleep(0.1)
	  @arbol_naranjero.recolectar_una
	  sleep(0.1)
	  @arbol_naranjero.recolectar_una
	  sleep(0.1)
	  @arbol_naranjero.recolectar_una
	  sleep(0.1)
          @arbol_naranjero.uno_mas
          sleep(1)
	  @arbol_naranjero.uno_mas
	  sleep(1)
	  @arbol_naranjero.recolectar_una
	  sleep(1)
	  @arbol_naranjero.uno_mas
	  sleep(1)
	  @arbol_naranjero.recolectar_una
	  sleep(1)
	  @arbol_naranjero.uno_mas
	  sleep(1)   
      end #fin de hilo_uno
   
	  @hilo_dos = Thread.new do
          @arbol_naranjero.recolectar_una
	  sleep(0)
	  @arbol_naranjero.uno_mas
	  sleep(2)
	  @arbol_naranjero.uno_mas
	  sleep(2)
	  @arbol_naranjero.uno_mas
      end#fin de hilo_dos
   
	  @hilo_uno.join
	  @hilo_dos.join
   
   
    expect(@hilo_uno.class).to eq(Thread)
    expect(@hilo_dos.class).to eq(Thread)
    expect(@arbol_naranjero.edad).to eq(8)
    expect(@arbol_naranjero.contador).to eq(0)
    expect(@arbol_naranjero.altura).to eq(16)
    expect(@arbol_naranjero.arbol_muerto).to eq(true)
  end#final del it de ejecucion
      
  end#end context
end#end describe Naranjero

end#fin del module